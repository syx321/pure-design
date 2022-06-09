package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
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
public class Person implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "user_id", type = IdType.AUTO)
      private Integer userId;

    private String username;

    private String password;

    private String name;

    private String phone;

    private String email;

    private String city;

    private Integer sex;

    private String bankCard;

      @ApiModelProperty("管理员、商家、用户")
      private String role;

      @ApiModelProperty("商家营业执照img转二进制存储")
      private String license;

      @ApiModelProperty("register_checked")
      private Integer registerChecked;

      @ApiModelProperty("image转二进制")
      private String avatar;

    private String simpleInfo;

    private String wechat;

    private String address;

      @ApiModelProperty("购物积分(100减1元)")
      private String shoppingPoints;

      @ApiModelProperty("账户余额")
      private String balance;

      @ApiModelProperty("卖家等级")
      private Integer level;


}
