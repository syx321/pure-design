package com.qingge.springboot.service.impl;

import com.qingge.springboot.common.ReceiveState;
import com.qingge.springboot.common.Result;
import com.qingge.springboot.entity.*;
import com.qingge.springboot.mapper.*;
import com.qingge.springboot.service.IPurchaseRelationshipService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class PurchaseRelationshipServiceImpl extends ServiceImpl<PurchaseRelationshipMapper, PurchaseRelationship> implements IPurchaseRelationshipService {

    @Resource
    PurchaseRelationshipMapper purchaseRelationshipMapper;

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
        AccountChange businessAccount = accountChangeMapper.selectById(businessId);

        purchaseRelationship.setDeliverState(ReceiveState.FINISHED.toString());
        purchaseRelationship.setReceivedTime(currentTime);

        businessAccount.setIncomeRecord(product.getPrice() * purchaseRelationship.getCount());

        purchaseRelationshipMapper.updateById(purchaseRelationship);
        accountChangeMapper.updateById(businessAccount);

        return Result.success();
    }

    @Override
    public Boolean createOrder(PurchaseRelationship purchaseRelationship) {
        return save(purchaseRelationship);
    }
}
