package com.qingge.springboot.service;

import com.qingge.springboot.common.Result;
import com.qingge.springboot.entity.BusinessProduct;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
public interface IBusinessProductService extends IService<BusinessProduct> {
    Result soldOutProduct(Integer productId);

    Result publishProduct(Integer businessId, String name, Double price, String sort, Double size, String image, Integer stockNum, String dealStyle);

    Result deliver(Integer orderId);

    Result approveForReturn(Integer orderId, Boolean isApproval);

    Result sellerEvaluate(Integer orderId, String sellerEvaluate, Integer score);
}
