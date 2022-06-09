package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("account_change")
public class Account_change {
    @TableId(type = IdType.AUTO)
    private Integer user_id;
    private double recharge_record;
    private double consume_record;
    private double income_record;
}
