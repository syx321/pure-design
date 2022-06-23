package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.common.ReceiveState;
import com.qingge.springboot.common.Result;
import com.qingge.springboot.entity.BusinessProduct;
import com.qingge.springboot.entity.Product;
import com.qingge.springboot.entity.PurchaseRelationship;
import com.qingge.springboot.mapper.BusinessProductMapper;
import com.qingge.springboot.mapper.ProductMapper;
import com.qingge.springboot.mapper.PurchaseRelationshipMapper;
import com.qingge.springboot.service.IBusinessProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author suyixiao
 * @since 2022-06-14
 */
@Service
public class BusinessProductServiceImpl extends ServiceImpl<BusinessProductMapper, BusinessProduct> implements IBusinessProductService {

    @Resource
    private ProductMapper productMapper;

    @Resource
    private PurchaseRelationshipMapper purchaseRelationshipMapper;


    @Override
    public Result soldOutProduct(Integer productId) {
        Product product = productMapper.selectOne(
                new QueryWrapper<Product>()
                        .eq("product_id", productId)
        );
        product.setIsEnable(0);
        if (productMapper.updateById(product) == 0) {
            return Result.error(Constants.CODE_400, "下架失败");
        }
        return Result.success();
    }

    @Override
    public Result publishProduct(Integer businessId, String name, Double price, String sort, Double size, String image, Integer stockNum, String dealStyle) {
        Product product = new Product();
        product.setBusinessId(businessId);
        product.setName(name);
        product.setPrice(price);
        product.setSort(sort);
        product.setSize(size);
        product.setImg(image);
        product.setStockNum(stockNum);
        product.setHistorySaleNum(0);
        product.setScore(0);
        product.setIsDelete(0);
        product.setFavorableRate("0");
        product.setIsEnable(1);
        product.setIsChecked(0);
        product.setTotal(0.0);

        if (productMapper.insert(product) == 0) {
            return Result.error(Constants.CODE_400, "上架商品失败");
        }
        return Result.success();
    }

    @Override
    public Result deliver(Integer orderId) {
        PurchaseRelationship purchaseRelationship = purchaseRelationshipMapper.selectOne(
                new QueryWrapper<PurchaseRelationship>()
                        .eq("order_id", orderId)
        );
        purchaseRelationship.setDeliverState(String.valueOf(ReceiveState.WAIT_FOR_RECEIVING));
        if (purchaseRelationshipMapper.updateById(purchaseRelationship) == 0) {
            return Result.error(Constants.CODE_400, "发货失败");
        }
        return Result.success();
    }

    @Override
    public Result approveForReturn(Integer orderId, Boolean isApproval) {
        PurchaseRelationship purchaseRelationship = purchaseRelationshipMapper.selectOne(
                new QueryWrapper<PurchaseRelationship>()
                        .eq("order_id", orderId)
        );

        purchaseRelationship.setDeliverState(String.valueOf(isApproval ? ReceiveState.approve_return : ReceiveState.reject_return));

        if (purchaseRelationshipMapper.updateById(purchaseRelationship) == 0) {
            return Result.error(Constants.CODE_400, "退货失败");
        }
        return Result.success();
    }

    @Override
    public Result sellerEvaluate(Integer orderId, String sellerEvaluate, Integer score) {
        PurchaseRelationship purchaseRelationship = purchaseRelationshipMapper.selectOne(
                new QueryWrapper<PurchaseRelationship>()
                        .eq("order_id", orderId)
        );
        purchaseRelationship.setSellerEvaluate(sellerEvaluate);
        purchaseRelationship.setSellerScore(String.valueOf(score));
        if (purchaseRelationshipMapper.updateById(purchaseRelationship) == 0) {
            return Result.error(Constants.CODE_400, "卖家评论失败");
        }
        return null;
    }


}
