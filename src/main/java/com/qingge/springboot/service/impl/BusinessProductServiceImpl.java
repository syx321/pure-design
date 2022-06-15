package com.qingge.springboot.service.impl;

import com.qingge.springboot.common.Result;
import com.qingge.springboot.entity.BusinessProduct;
import com.qingge.springboot.mapper.BusinessProductMapper;
import com.qingge.springboot.mapper.ProductMapper;
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


    @Override
    public Result publishProduct(Integer productId, Integer userId) {
        return null;
    }

    @Override
    public Result soldOutProduct(Integer productId, Integer userId) {
        return null;
    }

    @Override
    public Result findProduct(Integer productId, Integer userId) {
        return null;
    }
}
