package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Product;
import com.qingge.springboot.mapper.ProductMapper;
import com.qingge.springboot.mapper.UserMapper;
import com.qingge.springboot.service.IProductService;
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
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

    @Resource
    private ProductMapper productMapper;
    @Override
    public Page<Product> findPage(Page<Product> objectPage, String name) {
        return productMapper.findPage(objectPage, name);
    }
}
