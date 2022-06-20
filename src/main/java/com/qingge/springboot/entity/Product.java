package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * @since 2022-06-09
 */
@Getter
@Setter
@ApiModel(value = "Product对象", description = "")
@TableName("product")
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value = "product_id", type = IdType.AUTO)
    private Integer productId;

    private Integer businessId;

    private String name;

    private Double price;

    @ApiModelProperty("分类")
    private String sort;

    @ApiModelProperty("尺寸")
    private Double size;

    @ApiModelProperty("img转二进制存")
    private String img;

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
    private String dealStyle;

    @ApiModelProperty("好评率")
    private String favorableRate;

    @ApiModelProperty("是否上架在售")
    private Integer isEnable;

    @ApiModelProperty("是否通过审核")
    private boolean isChecked;

}
