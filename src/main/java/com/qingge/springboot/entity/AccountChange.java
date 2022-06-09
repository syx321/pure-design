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
  @TableName("account_change")
@ApiModel(value = "AccountChange对象", description = "")
public class AccountChange implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer userId;

      @ApiModelProperty("充值记录")
      private Double rechargeRecord;

      @ApiModelProperty("消费记录")
      private Double consumeRecord;

      @ApiModelProperty("货款到账")
      private Double incomeRecord;


}
