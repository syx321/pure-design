package com.qingge.springboot.entity;

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
  @TableName("business_product")
@ApiModel(value = "BusinessProduct对象", description = "")
public class BusinessProduct implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer userId;

      @ApiModelProperty("商家持有的物品")
      private Integer productId;


}
