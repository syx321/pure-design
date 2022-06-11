package com.qingge.springboot.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.controller.dto.PersonDTO;
import com.qingge.springboot.controller.dto.PersonPasswordDTO;
import com.qingge.springboot.controller.dto.UserDTO;
import com.qingge.springboot.controller.dto.UserPasswordDTO;
import com.qingge.springboot.entity.Person;
import com.qingge.springboot.entity.User;
import com.qingge.springboot.exception.ServiceException;
import com.qingge.springboot.mapper.PersonMapper;
import com.qingge.springboot.service.IPersonService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-10
 */
@Service
public class PersonServiceImpl extends ServiceImpl<PersonMapper, Person> implements IPersonService {

    private static final Log LOG = Log.get();
    @Override
    public PersonDTO login(PersonDTO personDTO) {

        return null;
    }

    @Override
    public Person register(PersonDTO personDTO) {
        Person person = getUserInfo(personDTO);
        if(person == null){
            person = new Person();
            BeanUtil.copyProperties(personDTO,person,true);
            save(person);
        }else {
            throw new ServiceException(Constants.CODE_600, "用户已存在");
        }
        return person;
    }

    @Override
    public void updatePassword(PersonPasswordDTO personPasswordDTO) {

    }

    @Override
    public Page<User> findPage(Page<Person> objectPage, String username, String email, String address) {
        return null;
    }

    private Person getUserInfo(PersonDTO personDTO) {
        QueryWrapper<Person> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", personDTO.getUsername());
        queryWrapper.eq("password", personDTO.getPassword());
        Person one;
        try {
            one = getOne(queryWrapper); // 从数据库查询用户信息
        } catch (Exception e) {
            LOG.error(e);
            throw new ServiceException(Constants.CODE_500, "系统错误");
        }
        return one;
    }
}
