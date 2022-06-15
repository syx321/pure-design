package com.qingge.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Product;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qingge.springboot.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
public interface ProductMapper extends BaseMapper<Product> {
    List<Product> findPage(@Param("name") String name);
}
