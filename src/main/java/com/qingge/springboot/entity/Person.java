package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-10
 */
@Getter
@Setter
@ApiModel(value = "Person对象", description = "")
@TableName("person")
public class Person implements Serializable {

    private static final long serialVersionUID = 1L;
      @TableId(value = "user_id", type = IdType.AUTO)
      private Integer userId;
   @TableField("username")
    private String username;
    @TableField("password")
    private String password;
    @TableField("name")
    private String name;
    @TableField("phone")
    private String phone;
    @TableField("email")
    private String email;
    @TableField("city")
    private String city;
    @TableField("sex")
    private Integer sex;
    @TableField("bank_card")
    private String bankcard;

      @ApiModelProperty("身份证照片")
      @TableField("id_card_img")
      private String idCardImg;

      @ApiModelProperty("管理员、商家、用户")
      private String role;

      @ApiModelProperty("商家营业执照img转二进制存储")
      private String license;

      @ApiModelProperty("register_checked")
      private boolean registerChecked;

      @ApiModelProperty("image转二进制")
      @TableField("avatar")
      private String avatarUrl;

    private String simpleInfo;

    private String wechat;
    @TableField("address")
    private String address;

      @ApiModelProperty("购物积分(100减1元)")
      private Integer shoppingPoints;

      @ApiModelProperty("账户余额")
      private double balance;

      @ApiModelProperty("卖家等级")
      private Integer level;


}
