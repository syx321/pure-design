package com.qingge.springboot.controller;

import com.qingge.springboot.config.AuthAccess;
import com.qingge.springboot.service.IVerifyService;
import com.qingge.springboot.service.impl.VerifyServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@CrossOrigin("http://localhost:8080/register")
@RestController
@RequestMapping("/verify")
public class VerifyController {
    @Resource
    IVerifyService verifyService;
    //    获取验证码
    @GetMapping("/getcode")
    @ResponseBody
    @AuthAccess
    public String getSysManageLoginCode(HttpServletResponse response, HttpServletRequest request) {
        return verifyService.getCode(response,request);
    }
    //验证码验证
    @GetMapping(value = "/checkcode")
    @ResponseBody
    @AuthAccess
    public String checkTcode(HttpServletRequest request,HttpServletResponse response) {
        return verifyService.checkCode(request,response);
    }


}
