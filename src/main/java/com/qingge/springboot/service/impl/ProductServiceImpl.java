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
import com.qingge.springboot.service.IProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingge.springboot.service.IPurchaseRelationshipService;
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
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

    @Resource
    private ProductMapper productMapper;

    @Resource
    private PersonMapper personMapper;

    @Resource
    private AccountChangeMapper accountChangeMapper;

    @Resource
    private IPurchaseRelationshipService purchaseRelationshipService;

    @Override
    public Result purchase(Integer productId, Integer userId, Integer count) {
        Product product = productMapper.selectById(productId);
        Person user = personMapper.selectById(userId);
        Person business = personMapper.selectById(product.getBusinessId());
        AccountChange accountChange = new AccountChange();

        if (user.getBalance() > product.getPrice() * count) {

            user.setBalance(user.getBalance() - product.getPrice() * count);
            personMapper.updateById(user);

            business.setBalance(business.getBalance() + product.getPrice() * count);
            personMapper.updateById(business);

            accountChange.setUserId(userId);
            accountChange.setConsumeRecord(product.getPrice() * count);
            accountChange.setTime(System.currentTimeMillis());
            accountChangeMapper.insert(accountChange);

            accountChange = new AccountChange();
            accountChange.setUserId(business.getUserId());
            accountChange.setIncomeRecord(product.getPrice() * count);
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
            return Result.success();
        } else {
            return Result.error(Constants.CODE_600, "余额不足");
        }
    }

    @Override
    public Page<Product> findPage(Page<Product> objectPage, String name) {
        return productMapper.findPage(objectPage, name);
    }
}
