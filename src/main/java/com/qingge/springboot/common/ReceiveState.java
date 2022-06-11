package com.qingge.springboot.common;

public enum ReceiveState {
    // 已发货, 待收货, 运输中, 已收货, 订单已完成
    DELIVERED, WAIT_FOR_RECEIVING, IN_TRANSIT, RECEIVED, FINISHED
}
