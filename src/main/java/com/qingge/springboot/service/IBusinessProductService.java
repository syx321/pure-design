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

    Result publishProduct(Integer productId, Integer userId);

    Result soldOutProduct(Integer productId, Integer userId);

    Result findProduct(Integer productId, Integer userId);


}
