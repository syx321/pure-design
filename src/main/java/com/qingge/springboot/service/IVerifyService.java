package com.qingge.springboot.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IVerifyService {
    String getCode(HttpServletResponse response, HttpServletRequest request);

    String checkCode(HttpServletRequest request,HttpServletResponse response);
}
