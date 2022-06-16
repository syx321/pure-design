package com.qingge.springboot.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.config.AuthAccess;
import com.qingge.springboot.controller.dto.PersonDTO;
import com.qingge.springboot.controller.dto.PersonPasswordDTO;
import com.qingge.springboot.controller.dto.UserDTO;
import com.qingge.springboot.controller.dto.UserPasswordDTO;
import com.qingge.springboot.entity.User;
import com.qingge.springboot.service.IUserService;
import com.qingge.springboot.utils.ImageUtils;
import com.qingge.springboot.utils.MultiToBase64;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qingge.springboot.common.Result;

import com.qingge.springboot.service.IPersonService;
import com.qingge.springboot.entity.Person;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
    @PostMapping("/encode")
    @AuthAccess
    public String pictureEncoder(MultipartFile file){
        MultiToBase64 multiToBase64 = new MultiToBase64();
        try {
            String encodeStr = multiToBase64.getBase64String(file);
            return encodeStr;
        } catch (IOException e) {
            e.printStackTrace();
            return "Encode ERROR";
        }

    }
    @PostMapping("/decode")
    @AuthAccess
    public MultipartFile pictureDecoder(String baseStr){
        ImageUtils imageUtils = new ImageUtils();
        return imageUtils.base64ToMultipartFile(baseStr);
    }
}

