package com.qingge.springboot.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.config.AuthAccess;
import com.qingge.springboot.entity.Files;
import com.qingge.springboot.mapper.AccountChangeMapper;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qingge.springboot.common.Result;

import com.qingge.springboot.service.IAccountChangeService;
import com.qingge.springboot.entity.AccountChange;

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
@RequestMapping("/account-change")
public class AccountChangeController {

    @Resource
    AccountChangeMapper accountChangeMapper;

    @Resource
    private IAccountChangeService accountChangeService;

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody AccountChange accountChange) {
        accountChangeService.saveOrUpdate(accountChange);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        accountChangeService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        accountChangeService.removeByIds(ids);
        return Result.success();
    }

    //充值记录
    @AuthAccess
    @GetMapping("/rechargeRecord/{id}")
    public Result rechargeRecord(@PathVariable Integer id) {
        QueryWrapper<AccountChange> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", id);
        List<AccountChange> accountChangeList = accountChangeMapper.selectList(queryWrapper);
        return Result.success(accountChangeList);
    }

    @GetMapping
    public Result findAll() {
        return Result.success(accountChangeService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(accountChangeService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize) {
        QueryWrapper<AccountChange> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        return Result.success(accountChangeService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

}

