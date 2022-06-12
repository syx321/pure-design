package com.qingge.springboot.controller.dto;

import lombok.Data;

@Data
public class OrderDTO {
    private Integer orderId;
    private String name;
    private String img;
    private double price;
    private String dealStyle;
    private long receivedTime;
    private long createTime;
    private Integer count;
    private String deliverState;
    private String userEvaluate;
}
