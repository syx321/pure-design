package com.qingge.springboot.common;

public enum ReceiveState {
    // 已发货, 待收货, 运输中, 已收货, 订单已完成, 申请退货, 确认退货, 拒绝退货
    DELIVERED, WAIT_FOR_RECEIVING, IN_TRANSIT, RECEIVED, FINISHED, request_return, approve_return, reject_return
}
