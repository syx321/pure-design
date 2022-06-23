package com.qingge.springboot.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.config.AuthAccess;
import com.qingge.springboot.service.IBusinessProductService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qingge.springboot.common.Result;

import com.qingge.springboot.service.IProductService;
import com.qingge.springboot.entity.Product;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
@RestController
@RequestMapping("/product")
public class ProductController {

    @Resource
    private IProductService productService;

    // 新增或者更新
    @PostMapping
    @AuthAccess
    public Result save(@RequestBody Product product) {
        productService.saveOrUpdate(product);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    @AuthAccess
    public Result delete(@PathVariable Integer id) {
        return Result.success(productService.removeById(id));
    }

    @PostMapping("/del/batch")
    @AuthAccess
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(productService.removeByIds(ids));
    }

    @GetMapping("/purchase")
    public Result purchase(@RequestParam Integer productId,
                           @RequestParam Integer userId,
                           @RequestParam Integer count) {
        return productService.purchase(productId, userId, count);
    }

    @AuthAccess
    @GetMapping
    public Result findAll() {
        return Result.success(productService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(productService.getById(id));
    }

    @GetMapping("/search")
    @AuthAccess
    public Result search(@RequestParam(defaultValue = "") String name) {
        return Result.success(productService.search(name));
    }
    //后台商品数据分页接口
    @GetMapping("/pageProduct")
    @AuthAccess
    public Result findProductPage(@RequestParam Integer pageNum,
                                   @RequestParam Integer pageSize,
                                   @RequestParam(defaultValue = "") String productName) {
        return Result.success(productService.findProductPage(pageNum,pageSize,productName));
    }

    @GetMapping("/pageUncheckProduct")
    @AuthAccess
    public Result findUncheckProductPage(@RequestParam Integer pageNum,
                                          @RequestParam Integer pageSize,
                                          @RequestParam(defaultValue = "") String productName) {
        return Result.success(productService.findUnCheckProductPage(pageNum,pageSize,productName));
    }
    //后台商品审核接口
    @GetMapping("/updateCheckPass/{id}")
    @AuthAccess
    public Result updateRegisterToPass(@PathVariable Integer id){
        return Result.success(productService.updateProductToPass(id));
    }

    @GetMapping("/updateCheckFail/{id}")
    @AuthAccess
    public Result updateRegisterToFail(@PathVariable Integer id){
        return Result.success(productService.updateProductToFail(id));
    }
}

