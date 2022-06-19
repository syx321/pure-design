package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Result;
import com.qingge.springboot.controller.dto.OrderDTO;
import com.qingge.springboot.entity.PurchaseRelationship;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
public interface IPurchaseRelationshipService extends IService<PurchaseRelationship> {
    Result receive(Integer id);

    Boolean createOrder(PurchaseRelationship purchaseRelationship);

    Page<OrderDTO> findMyOrder(Page<OrderDTO> objectPage, String name, Integer userId);

    Result userEvaluate(Integer orderId, String userEvaluate, String sellerAttitude, Integer score);

    Result sellerEvaluate(Integer orderId, String sellerEvaluate);

    Page<OrderDTO> sellerAllOrder(Page<OrderDTO> objectPage, String name, Integer businessId);

    // 加入购物车
    Result addProductToUserCart(List<Integer> productsId, Integer userId);

    //一键下单购物车
    Result placeOrdersAtOnce(Integer userId);

    Result requestForReturn(Integer userId, Integer productsId);
}
