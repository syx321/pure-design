package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("business_product")
public class Business_product {
    @TableId(type = IdType.AUTO)
    private Integer user_id;
    private Integer product_id;
}
