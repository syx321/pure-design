package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.AccountChange;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
public interface IAccountChangeService extends IService<AccountChange> {
    Page<AccountChange> findPage(Page<AccountChange> objectPage, String userId);
}
