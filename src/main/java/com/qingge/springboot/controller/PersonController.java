package com.qingge.springboot.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.config.AuthAccess;
import com.qingge.springboot.controller.dto.PersonDTO;
import com.qingge.springboot.controller.dto.UserDTO;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qingge.springboot.common.Result;

import com.qingge.springboot.service.IPersonService;
import com.qingge.springboot.entity.Person;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-10
 */
@RestController
@RequestMapping("/person")
public class PersonController {
    @Resource
    private IPersonService personService;


    //用户注册接口 ： 普通用户、商家
    @AuthAccess
    @PostMapping("/register")
    public Result register(@RequestBody PersonDTO personDTO) {
        String username = personDTO.getUsername();
        String password = personDTO.getPassword();
        if (StrUtil.isBlank(username) || StrUtil.isBlank(password)) {
            return Result.error(Constants.CODE_400, "参数错误");
        }
        return Result.success(personService.register(personDTO));
    }


    //    // 新增或者更新
//    @PostMapping
//    public Result save(@RequestBody Person person) {
//        personService.saveOrUpdate(person);
//        return Result.success();
//    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        personService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        personService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(personService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(personService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize) {
        QueryWrapper<Person> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        return Result.success(personService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

}

