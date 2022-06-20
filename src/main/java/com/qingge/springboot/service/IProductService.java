package com.qingge.springboot.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Result;
import com.qingge.springboot.entity.Person;
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

    Result purchase(Integer productId, Integer userId, Integer count);

    Result search(String name);

    boolean updateProductToPass(Integer id);

    boolean updateProductToFail(Integer id);

    IPage<Product> findProductPage(Integer pageNum, Integer pageSize, String productName);

    IPage<Product> findUnCheckProductPage(Integer pageNum,Integer pageSize, String productName);
}
