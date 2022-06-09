package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
 * @since 2022-06-09
 */
@Getter
@Setter
  @TableName("purchase_relationship")
@ApiModel(value = "PurchaseRelationship对象", description = "")
public class PurchaseRelationship implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "user_id", type = IdType.AUTO)
      private Integer userId;

    private Integer productId;

    private byte[] evaluate;

      @ApiModelProperty("购买数量")
      private Integer count;

      @ApiModelProperty("交易状态")
      private byte[] state;

      @ApiModelProperty("商家服务态度")
      private byte[] attitude;

      @ApiModelProperty("收货时长")
      private Integer receiveTime;

      @ApiModelProperty("交易状态")
      private byte[] deliverState;

      @ApiModelProperty("本次交易评分")
      private Integer score;

      @ApiModelProperty("卖家对客户评价")
      private byte[] sellerEvaluate;

      @ApiModelProperty("是否在购物车")
      private Integer isCart;


}
