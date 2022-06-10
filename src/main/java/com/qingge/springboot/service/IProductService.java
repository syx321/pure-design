package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Product;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
public interface IProductService extends IService<Product> {

    Page<Product> findPage(Page<Product> objectPage, String name);
}
