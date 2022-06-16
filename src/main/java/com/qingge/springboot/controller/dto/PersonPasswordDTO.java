package com.qingge.springboot.controller.dto;

import lombok.Data;

@Data
public class PersonPasswordDTO {
    private String username;
    private String password;
    private String newPassword;
}
