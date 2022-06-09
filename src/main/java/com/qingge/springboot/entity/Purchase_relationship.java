package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("purchase_relationship")
public class Purchase_relationship {

    @TableId(type = IdType.AUTO)
    private Integer user_id;
    private Integer product_id;
    private String evaluate;
    private Integer count;
    private String state;
    private String attitude;
    private Integer receive_time;
    private String deliver_state;
    private Integer score;
    private String seller_evaluate;
    private Boolean is_cart;

}
