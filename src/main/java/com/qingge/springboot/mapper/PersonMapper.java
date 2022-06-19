package com.qingge.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.controller.dto.PersonPasswordDTO;
import com.qingge.springboot.controller.dto.UserPasswordDTO;
import com.qingge.springboot.entity.Person;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qingge.springboot.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-10
 */
public interface PersonMapper extends BaseMapper<Person> {
    @Update("update person set password = #{newPassword} where username = #{username} and password = #{password}")
    int updatePassword(PersonPasswordDTO personPasswordDTO);

    Page<User> findPage(Page<Person> page,
                        @Param("username") String username,
                        @Param("email") String email,
                        @Param("address") String address);

}
