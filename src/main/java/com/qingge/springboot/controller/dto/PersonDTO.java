package com.qingge.springboot.controller.dto;

import lombok.Data;

@Data
public class PersonDTO {
    private String username;

    private String password;

    private String name;

    private String phone;

    private String email;

    private String city;

    private Integer sex;

    private String bankcard;

    private String role;//管理员、商家、用户

    private String license;//商家营业执照img转二进制存储

    private String avatar;//头像转二进制

    private boolean registerChecked;

    private String simpleInfo;

    private String address;
}
