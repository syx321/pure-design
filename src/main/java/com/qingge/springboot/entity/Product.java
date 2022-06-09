package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sun.org.apache.xpath.internal.operations.Bool;
import lombok.Data;

@Data
@TableName("product")
public class Product {

    @TableId(type = IdType.AUTO)
    private Integer product_id;
    private String name;
    private double price;
    private double size;
    private String img;
    private Integer stock_num;
    private Integer history_sale_num;
    private Integer purchase_num;
    private Integer score;
    private Boolean is_delete;
    private String deal_style;
    private String favorable_rate;
    private Boolean is_enable;
    private Boolean is_checked;

}
