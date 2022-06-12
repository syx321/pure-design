package com.qingge.springboot.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.config.AuthAccess;
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
 *  前端控制器
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
    public Result save(@RequestBody Product product) {
        productService.saveOrUpdate(product);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        productService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        productService.removeByIds(ids);
        return Result.success();
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

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String username) {
        return Result.success(productService.findPage(new Page<>(pageNum, pageSize), username));
    }

}

