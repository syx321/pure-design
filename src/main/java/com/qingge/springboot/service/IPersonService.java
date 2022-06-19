package com.qingge.springboot.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.controller.dto.PersonDTO;
import com.qingge.springboot.controller.dto.PersonPasswordDTO;
import com.qingge.springboot.entity.Person;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qingge.springboot.entity.User;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-10
 */
public interface IPersonService extends IService<Person> {

    boolean saveUser(Person person);

    PersonDTO login(PersonDTO personDTO);

    Person register(PersonDTO personDTO);

    boolean updatePassword(PersonPasswordDTO personPasswordDTO);

    IPage<Person> findPage(Integer pageNum,Integer pageSize, String username, String email, String address);

    IPage<Person> findUserPage(Integer pageNum,Integer pageSize, String username, String email, String address);

    IPage<Person> findUnCheckUserPage(Integer pageNum,Integer pageSize, String username, String email, String address);

    IPage<Person> findBusinessPage(Integer pageNum,Integer pageSize, String username, String email, String address);

    IPage<Person> findUnCheckBusinessPage(Integer pageNum,Integer pageSize, String username, String email, String address);

    boolean updateRegisterToPass(Integer id);

    boolean updateRegisterToFail(Integer id);

}
