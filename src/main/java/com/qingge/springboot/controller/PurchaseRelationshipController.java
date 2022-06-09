package com.qingge.springboot.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qingge.springboot.common.Result;

import com.qingge.springboot.service.IPurchaseRelationshipService;
import com.qingge.springboot.entity.PurchaseRelationship;

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
@RequestMapping("/purchase-relationship")
public class PurchaseRelationshipController {

    @Resource
    private IPurchaseRelationshipService purchaseRelationshipService;

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody PurchaseRelationship purchaseRelationship) {
        purchaseRelationshipService.saveOrUpdate(purchaseRelationship);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        purchaseRelationshipService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        purchaseRelationshipService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(purchaseRelationshipService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(purchaseRelationshipService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize) {
        QueryWrapper<PurchaseRelationship> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        return Result.success(purchaseRelationshipService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

}

