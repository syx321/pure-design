package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.qingge.springboot.service.IVerifyService;
import com.qingge.springboot.utils.RandomValidateCode;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Service
public class VerifyServiceImpl implements IVerifyService {

    @Override
    public String getCode(HttpServletResponse response, HttpServletRequest request) {
        System.out.println("获取验证码");
        response.setContentType("image/jpeg");// 设置相应类型,告诉浏览器输出的内容为图片
//        response.setHeader("Pragma", "No-cache");// 设置响应头信息，告诉浏览器不要缓存此内容
//        response.setHeader("Cache-Control", "no-cache");
//        response.setHeader("Set-Cookie", "name=value;");//设置HttpOnly属性,防止Xss攻击
        response.setDateHeader("Expire", 1);
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
        String filePath = "/Users/chenlong/Documents/tmpRandomCode/"+"randomCode.txt";
        String code = null;
        File file = new File(filePath);
        BufferedReader br;
        try {
            FileReader fileReader = new FileReader(file);
            br = new BufferedReader(fileReader);
            code = br.readLine();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
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
