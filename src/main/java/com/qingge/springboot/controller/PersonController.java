package com.qingge.springboot.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.config.AuthAccess;
import com.qingge.springboot.controller.dto.PersonDTO;
import com.qingge.springboot.controller.dto.PersonPasswordDTO;
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
    @PostMapping("/register")
    @AuthAccess
    public Result register(@RequestBody PersonDTO personDTO) {
        String username = personDTO.getUsername();
        String password = personDTO.getPassword();
        if (StrUtil.isBlank(username) || StrUtil.isBlank(password)) {
            return Result.error(Constants.CODE_400, "参数错误");
        }
        return Result.success(personService.register(personDTO));
    }

    @PostMapping("/login")
    @AuthAccess
    public Result login(@RequestBody PersonDTO personDTO) {
        String username = personDTO.getUsername();
        String password = personDTO.getPassword();
        if (StrUtil.isBlank(username) || StrUtil.isBlank(password)) {
            return Result.error(Constants.CODE_400, "参数错误");
        }
        PersonDTO dto = personService.login(personDTO);
        return Result.success(dto);
    }

    @GetMapping("/username/{username}")
    @AuthAccess
    public Result findByUsername(@PathVariable String username) {
        QueryWrapper<Person> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        return Result.success(personService.getOne(queryWrapper));
    }
    // 新增或者更新
    @PostMapping
    @AuthAccess
    public Result save(@RequestBody Person person) {
        if (person.getUserId() == null && person.getPassword() == null) {  // 新增用户默认密码
            person.setPassword("123");
        }
        return Result.success(personService.saveUser(person));
    }
    @PostMapping("/password")
    @AuthAccess
    public Result password(@RequestBody PersonPasswordDTO personPasswordDTO) {
        return Result.success(personService.updatePassword(personPasswordDTO));
    }
    @DeleteMapping("/{id}")
    @AuthAccess
    public Result delete(@PathVariable Integer id) {
        return Result.success(personService.removeById(id));
    }

    @PostMapping("/del/batch")
    @AuthAccess
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(personService.removeByIds(ids));
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
    @AuthAccess
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String username,
                           @RequestParam(defaultValue = "") String email,
                           @RequestParam(defaultValue = "") String address) {
        return Result.success(personService.findPage(pageNum,pageSize,username,email,address));
    }
    @GetMapping("/pageUser")
    @AuthAccess
    public Result findUserPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String username,
                           @RequestParam(defaultValue = "") String email,
                           @RequestParam(defaultValue = "") String address) {
        return Result.success(personService.findUserPage(pageNum,pageSize,username,email,address));
    }
    @GetMapping("/pageUncheckUser")
    @AuthAccess
    public Result findUncheckUserPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String username,
                           @RequestParam(defaultValue = "") String email,
                           @RequestParam(defaultValue = "") String address) {
        return Result.success(personService.findUnCheckUserPage(pageNum,pageSize,username,email,address));
    }

    @GetMapping("/pageBusiness")
    @AuthAccess
    public Result findBusinessPage(@RequestParam Integer pageNum,
                                   @RequestParam Integer pageSize,
                                   @RequestParam(defaultValue = "") String username,
                                   @RequestParam(defaultValue = "") String email,
                                   @RequestParam(defaultValue = "") String address) {
        return Result.success(personService.findBusinessPage(pageNum,pageSize,username,email,address));
    }

    @GetMapping("/pageUncheckBusiness")
    @AuthAccess
    public Result findUncheckBusinessPage(@RequestParam Integer pageNum,
                                          @RequestParam Integer pageSize,
                                          @RequestParam(defaultValue = "") String username,
                                          @RequestParam(defaultValue = "") String email,
                                          @RequestParam(defaultValue = "") String address) {
        return Result.success(personService.findUnCheckBusinessPage(pageNum,pageSize,username,email,address));
    }

    @GetMapping("/updateCheckPass/{id}")
    @AuthAccess
    public Result updateRegisterToPass(@PathVariable Integer id){
        return Result.success(personService.updateRegisterToPass(id));
    }

    @GetMapping("/updateCheckFail/{id}")
    @AuthAccess
    public Result updateRegisterToFail(@PathVariable Integer id){
        return Result.success(personService.updateRegisterToFail(id));
    }


}

