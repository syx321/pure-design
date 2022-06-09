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
 * @since 2022-06-09
 */
@Getter
@Setter
  @ApiModel(value = "Product对象", description = "")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "product_id", type = IdType.AUTO)
      private Integer productId;

    private byte[] name;

    private Double price;

      @ApiModelProperty("尺寸")
      private Double size;

      @ApiModelProperty("img转二进制存")
      private byte[] img;

      @ApiModelProperty("库存数量")
      private Integer stockNum;

      @ApiModelProperty("历史销量")
      private Integer historySaleNum;

      @ApiModelProperty("购买人数")
      private Integer purchaseNum;

      @ApiModelProperty("评分")
      private Integer score;

      @ApiModelProperty("是否删除该商品")
      private Integer isDelete;

      @ApiModelProperty("交易方式")
      private byte[] dealStyle;

      @ApiModelProperty("好评率")
      private byte[] favorableRate;

      @ApiModelProperty("是否上架在售")
      private Integer isEnable;

      @ApiModelProperty("是否通过审核")
      private Integer isChecked;


}
