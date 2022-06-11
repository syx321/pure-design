package com.qingge.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.AccountChange;
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
public interface AccountChangeMapper extends BaseMapper<AccountChange> {
    Page<AccountChange> findPage(Page<AccountChange> page,
                           @Param("userId") String userId);
}
