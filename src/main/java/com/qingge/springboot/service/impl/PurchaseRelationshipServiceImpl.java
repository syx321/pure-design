package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.common.LevelEnum;
import com.qingge.springboot.common.ReceiveState;
import com.qingge.springboot.common.Result;
import com.qingge.springboot.controller.dto.OrderDTO;
import com.qingge.springboot.entity.*;
import com.qingge.springboot.mapper.*;
import com.qingge.springboot.service.IProductService;
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

    @Resource
    IProductService productService;

    @Override
    public Result receive(Integer id) {
        PurchaseRelationship purchaseRelationship = purchaseRelationshipMapper.selectById(id);
        Integer businessId = purchaseRelationship.getBusinessId();
        Long currentTime = System.currentTimeMillis();

        Person business = personMapper.selectById(businessId);
        AccountChange businessAccount = new AccountChange();

        //获取商家等级对应的费率
        LevelEnum levelEnum = StrToEnum(business.getLevel());
        double level_Rate = Double.valueOf(levelEnum.getRate());

        purchaseRelationship.setDeliverState(ReceiveState.RECEIVED.toString());
        purchaseRelationship.setReceivedTime(currentTime);

        businessAccount.setUserId(businessId);
        businessAccount.setIncomeRecord(purchaseRelationship.getTotal()*level_Rate);
        businessAccount.setTime(currentTime);

        business.setBalance(business.getBalance() + purchaseRelationship.getTotal()*level_Rate);

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
    public Result addProductToUserCart(@NonNull List<Integer> productsId, @NonNull Integer userId) {
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
        Person person = personMapper.selectOne(
                new QueryWrapper<Person>()
                        .eq("user_id", userId)
        );
        if (person == null) {
            return Result.error(Constants.CODE_400, "购物车一键下单失败，无此用户" + userId);
        }
        if (purchaseRelationships == null) {
            return Result.error(Constants.CODE_400, "购物车一键下单失败，购物车为空" + userId);
        }
        for (PurchaseRelationship purchaseRelationship : purchaseRelationships) {
            Result result = productService.purchase(purchaseRelationship.getProductId(), userId, purchaseRelationship.getCount());
            if (!result.equals(Result.success())) {
                return result;
            }
        }
        return Result.success("购物车一键下单成功");
    }

    @Override
    public Result requestForReturn(@NonNull Integer userId, @NonNull Integer productId) {
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

        if ((System.currentTimeMillis() - purchaseRelationship.getCreateTime()) > 24 * 60 * 60 * 1000) {
            return Result.error(Constants.CODE_400, "退货失败，已超过24h");
        }

        purchaseRelationship.setDeliverState(ReceiveState.request_return.toString());
        if (purchaseRelationshipMapper.updateById(purchaseRelationship) == 0) {
            return Result.error(Constants.CODE_400, "退货失败，更新数据失败" + purchaseRelationship);
        }

        return Result.success("退货申请成功");
    }

    //String to LevelEnum
    public LevelEnum StrToEnum(String level){
        switch (level){
            case "LEVEL_1":
                return LevelEnum.LEVEL_1;
            case "LEVEL_2":
                return LevelEnum.LEVEL_2;
            case "LEVEL_3":
                return LevelEnum.LEVEL_3;
            case "LEVEL_4":
                return LevelEnum.LEVEL_4;
            case "LEVEL_5":
                return LevelEnum.LEVEL_5;
            default:
                System.out.println("错误的等级");
                break;
        }
        return null;

    }
}
