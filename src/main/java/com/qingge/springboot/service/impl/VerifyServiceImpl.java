package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.qingge.springboot.service.IVerifyService;
import com.qingge.springboot.utils.RandomValidateCode;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class VerifyServiceImpl implements IVerifyService {

    @Override
    public String getCode(HttpServletResponse response, HttpServletRequest request) {
        System.out.println("获取验证码");
        response.setContentType("image/jpeg");// 设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");// 设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
//        response.setHeader("Set-Cookie", "name=value;");//设置HttpOnly属性,防止Xss攻击
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response,"imagecode");// 输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    @Override
    public String checkCode(HttpServletRequest request, HttpServletResponse response) {
        String validateCode = request.getParameter("validateCode");
        String code = null;
        //1:获取cookie里面的验证码信息
        Cookie[] cookies = request.getCookies();
        System.out.println(cookies);
        for (Cookie cookie : cookies) {
            if ("imagecode".equals(cookie.getName())) {
                code = cookie.getValue();
                break;
            }
        }
        //1:获取session验证码的信息
        //String code1 = (String) request.getSession().getAttribute("");
        //2:判断验证码是否正确
        if(!StringUtils.isEmpty(validateCode)){
//            全部转化为小写
            validateCode = validateCode.toLowerCase();
            code = code.toLowerCase();
            if(validateCode.equals(code)) {
                return "ok";
            }
        }
        return "Error";

    }
}
