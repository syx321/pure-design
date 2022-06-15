package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.common.ReceiveState;
import com.qingge.springboot.common.Result;
import com.qingge.springboot.controller.dto.OrderDTO;
import com.qingge.springboot.entity.*;
import com.qingge.springboot.mapper.*;
import com.qingge.springboot.service.IPurchaseRelationshipService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.NonNull;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
@Service
public class PurchaseRelationshipServiceImpl extends ServiceImpl<PurchaseRelationshipMapper, PurchaseRelationship> implements IPurchaseRelationshipService {

    @Resource
    PurchaseRelationshipMapper purchaseRelationshipMapper;

    @Resource
    PersonMapper personMapper;

    @Resource
    AccountChangeMapper accountChangeMapper;

    @Resource
    ProductMapper productMapper;

    @Override
    public Result receive(Integer id) {
        PurchaseRelationship purchaseRelationship = purchaseRelationshipMapper.selectById(id);
        Integer businessId = purchaseRelationship.getBusinessId();
        Integer productId = purchaseRelationship.getProductId();
        Long currentTime = System.currentTimeMillis();

        Product product = productMapper.selectById(productId);
        Person business = personMapper.selectById(businessId);
        AccountChange businessAccount = new AccountChange();

        purchaseRelationship.setDeliverState(ReceiveState.RECEIVED.toString());
        purchaseRelationship.setReceivedTime(currentTime);

        businessAccount.setUserId(businessId);
        businessAccount.setIncomeRecord(product.getPrice() * purchaseRelationship.getCount());
        businessAccount.setTime(currentTime);

        business.setBalance(business.getBalance() + product.getPrice() * purchaseRelationship.getCount());

        purchaseRelationshipMapper.updateById(purchaseRelationship);
        accountChangeMapper.insert(businessAccount);
        personMapper.updateById(business);

        return Result.success();
    }

    @Override
    public Boolean createOrder(PurchaseRelationship purchaseRelationship) {
        return save(purchaseRelationship);
    }

    @Override
    public Page<OrderDTO> findMyOrder(Page<OrderDTO> objectPage, String name, Integer userId) {
        return purchaseRelationshipMapper.findMyOrder(objectPage, name, userId);
    }

    @Override
    public Result userEvaluate(Integer orderId, String userEvaluate, String sellerAttitude, Integer score) {
        PurchaseRelationship purchaseRelationship = purchaseRelationshipMapper.selectById(orderId);
        purchaseRelationship.setDeliverState(ReceiveState.FINISHED.toString());
        purchaseRelationship.setUserEvaluate(userEvaluate);
        purchaseRelationship.setScore(score);
        purchaseRelationship.setSellerAttitude(sellerAttitude);
        return Result.success(purchaseRelationshipMapper.updateById(purchaseRelationship));
    }

    @Override
    public Result sellerEvaluate(Integer orderId, String sellerEvaluate) {
        PurchaseRelationship purchaseRelationship = purchaseRelationshipMapper.selectById(orderId);
        purchaseRelationship.setSellerEvaluate(sellerEvaluate);
        return Result.success(purchaseRelationshipMapper.updateById(purchaseRelationship));
    }

    @Override
    public Page<OrderDTO> sellerAllOrder(Page<OrderDTO> objectPage, String name, Integer businessId) {
        return purchaseRelationshipMapper.sellerAllOrder(objectPage, name, businessId);
    }

    @Override
    public Result addProductToUserCart(@NonNull List<Integer> productsId,@NonNull Integer userId) {
        List<Product> products = new ArrayList<>();
        Person user = personMapper.selectById(userId);
        for (Integer productId : productsId) {
            Product product = productMapper.selectById(productId);
            if (product == null) {
                return Result.error(Constants.CODE_400, "productsId错误");
            }
            products.add(product);
        }
        if (user == null) {
            return Result.error(Constants.CODE_400, "userId错误");
        }

        for (Product product : products) {
            PurchaseRelationship currentRelationShip = purchaseRelationshipMapper.selectOne(
                    new QueryWrapper<PurchaseRelationship>()
                            .eq("user_id", userId)
                            .eq("product_id", product.getProductId())
                            .eq("is_cart", 1)
            );
            Product currentProduct = productMapper.selectOne(
                    new QueryWrapper<Product>()
                            .eq("product_id", product.getProductId())
            );
            PurchaseRelationship purchaseRelationship = new PurchaseRelationship();
            purchaseRelationship.setUserId(user.getUserId());
            purchaseRelationship.setProductId(product.getProductId());
            purchaseRelationship.setIsCart(1);
            purchaseRelationship.setBusinessId(currentProduct.getBusinessId());
            purchaseRelationship.setCount(currentRelationShip != null ? currentRelationShip.getCount() + 1 : 1);
            purchaseRelationship.setOrderId(currentRelationShip != null ? currentRelationShip.getOrderId() : null);
            purchaseRelationship.setCreateTime(System.currentTimeMillis());
            if (currentRelationShip != null) {
                if (purchaseRelationshipMapper.updateById(purchaseRelationship) == 0) {
                    return Result.error(Constants.CODE_400, "加入购物车失败" + purchaseRelationship);
                }
            } else {
                purchaseRelationship.setCount(1);
                if (purchaseRelationshipMapper.insert(purchaseRelationship) == 0) {
                    return Result.error(Constants.CODE_400, "加入购物车失败" + purchaseRelationship);
                }
            }

        }
        return Result.success("添加购物车成功");
    }

    @Override
    public Result placeOrdersAtOnce(@NonNull Integer userId) {
        List<PurchaseRelationship> purchaseRelationships = purchaseRelationshipMapper.selectList(
                new QueryWrapper<PurchaseRelationship>()
                        .eq("user_id", userId)
                        .eq("is_cart", 1)
        );
        for (PurchaseRelationship purchaseRelationship : purchaseRelationships) {
            purchaseRelationship.setDeliverState(ReceiveState.WAIT_FOR_RECEIVING.toString());
            purchaseRelationship.setIsCart(0);
            if (purchaseRelationshipMapper.updateById(purchaseRelationship) == 0) {
                return Result.error(Constants.CODE_400, "购物车一键下单失败" + purchaseRelationship);
            }
        }
        return Result.success("购物车一键下单成功");
    }

    @Override
    public Result requestForReturn(@NonNull Integer userId,@NonNull Integer productId) {
        PurchaseRelationship purchaseRelationship = purchaseRelationshipMapper.selectOne(
                new QueryWrapper<PurchaseRelationship>()
                        .eq("user_id", userId)
                        .eq("product_id", productId)
                        .eq("is_cart", "0")
        );
        if (purchaseRelationship == null) {
            return Result.error(Constants.CODE_400, "退货失败，未查询到商品");
        }

        if (purchaseRelationship.getDeliverState().equals(ReceiveState.reject_return.toString()) ||
        purchaseRelationship.getDeliverState().equals(ReceiveState.request_return.toString())) {
            return Result.error(Constants.CODE_400, "退货失败，已申请或已驳回");
        }

        purchaseRelationship.setDeliverState(ReceiveState.request_return.toString());
        if (purchaseRelationshipMapper.updateById(purchaseRelationship) == 0) {
            return Result.error(Constants.CODE_400, "退货失败，更新数据失败" + purchaseRelationship);
        }

        return Result.success("退货申请成功");
    }

}
