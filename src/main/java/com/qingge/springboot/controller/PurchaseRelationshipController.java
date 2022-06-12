package com.qingge.springboot.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.common.ReceiveState;
import com.qingge.springboot.config.AuthAccess;
import com.qingge.springboot.entity.AccountChange;
import com.qingge.springboot.entity.Files;
import com.qingge.springboot.mapper.AccountChangeMapper;
import com.qingge.springboot.mapper.PurchaseRelationshipMapper;
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
    private PurchaseRelationshipMapper purchaseRelationshipMapper;
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

    // 订单完成
    @GetMapping("/receive/{id}")
    public Result receive(@PathVariable Integer id) {
        return purchaseRelationshipService.receive(id);
    }

    // 订单完成
    @GetMapping("/evaluate")
    public Result userEvalute(@RequestParam Integer orderId,
                              @RequestParam String userEvaluate,
                              @RequestParam String sellerAttitude,
                              @RequestParam Integer score) {
        return purchaseRelationshipService.userEvaluate(orderId, userEvaluate, sellerAttitude, score);
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(purchaseRelationshipService.removeByIds(ids));
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
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name,
                           @RequestParam Integer userId) {
        return Result.success(purchaseRelationshipService.findMyOrder(new Page<>(pageNum, pageSize), name, userId));
    }

}

