package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.AccountChange;
import com.qingge.springboot.mapper.AccountChangeMapper;
import com.qingge.springboot.service.IAccountChangeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
@Service
public class AccountChangeServiceImpl extends ServiceImpl<AccountChangeMapper, AccountChange> implements IAccountChangeService {

    @Resource
    AccountChangeMapper accountChangeMapper;
    @Override
    public Page<AccountChange> findPage(Page<AccountChange> objectPage, String userId) {
        return accountChangeMapper.findPage(objectPage, userId);
    }
}
