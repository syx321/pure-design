package com.qingge.springboot.service;

import com.qingge.springboot.common.Result;
import com.qingge.springboot.entity.PurchaseRelationship;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
public interface IPurchaseRelationshipService extends IService<PurchaseRelationship> {
    Result receive(Integer id);
    Boolean createOrder(PurchaseRelationship purchaseRelationship);
}
