package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.common.ReceiveState;
import com.qingge.springboot.common.Result;
import com.qingge.springboot.entity.AccountChange;
import com.qingge.springboot.entity.Person;
import com.qingge.springboot.entity.Product;
import com.qingge.springboot.entity.PurchaseRelationship;
import com.qingge.springboot.mapper.AccountChangeMapper;
import com.qingge.springboot.mapper.PersonMapper;
import com.qingge.springboot.mapper.ProductMapper;
import com.qingge.springboot.service.IBusinessProductService;
import com.qingge.springboot.service.IProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingge.springboot.service.IPurchaseRelationshipService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

    @Resource
    private ProductMapper productMapper;

    @Resource
    private PersonMapper personMapper;

    @Resource
    private AccountChangeMapper accountChangeMapper;

    @Resource
    private IPurchaseRelationshipService purchaseRelationshipService;

    @Resource
    IBusinessProductService businessProductService;

    @Override
    public Result purchase(Integer productId, Integer userId, Integer count) {
        Product product = productMapper.selectById(productId);
        Person user = personMapper.selectById(userId);
        AccountChange accountChange = new AccountChange();


        if (user.getBalance() > product.getPrice() * count) {

            Integer shoppingPoints = user.getShoppingPoints();
            Integer coupon = user.getShoppingPoints() / 100;
            user.setBalance(user.getBalance() - product.getPrice() * count - coupon);
            user.setShoppingPoints(shoppingPoints % 100);
            personMapper.updateById(user);

            accountChange.setUserId(userId);
            accountChange.setConsumeRecord(product.getPrice() * count - coupon);
            accountChange.setTime(System.currentTimeMillis());
            accountChangeMapper.insert(accountChange);

            product.setHistorySaleNum(product.getHistorySaleNum() + 1);
            product.setPurchaseNum(product.getPurchaseNum() + 1);
            product.setStockNum(product.getStockNum() - 1);
            productMapper.updateById(product);

            PurchaseRelationship purchaseRelationship = new PurchaseRelationship();
            purchaseRelationship.setProductId(productId);
            purchaseRelationship.setUserId(userId);
            purchaseRelationship.setBusinessId(product.getBusinessId());
            purchaseRelationship.setIsCart(0);
            purchaseRelationship.setCount(count);
            purchaseRelationship.setCreateTime(System.currentTimeMillis());
            purchaseRelationship.setDeliverState(ReceiveState.WAIT_FOR_RECEIVING.toString());
            //创建订单
            purchaseRelationshipService.createOrder(purchaseRelationship);

            // TODO: 付款后卖家发货

            return Result.success();
        } else {
            return Result.error(Constants.CODE_600, "余额不足");
        }
    }

    @Override
    public Result search(String name) {
        return Result.success(productMapper.findPage(name));
    }
}
