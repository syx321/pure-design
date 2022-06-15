package com.qingge.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.controller.dto.OrderDTO;
import com.qingge.springboot.entity.Product;
import com.qingge.springboot.entity.PurchaseRelationship;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
public interface PurchaseRelationshipMapper extends BaseMapper<PurchaseRelationship> {
    Page<OrderDTO> findMyOrder(Page<OrderDTO> page, @Param("name") String name, @Param("userId") Integer userId);

    Page<OrderDTO> sellerAllOrder(Page<OrderDTO> page, @Param("name") String name, @Param("businessId") Integer businessId);

}
