package com.qingge.springboot.service.impl;

import com.qingge.springboot.entity.Person;
import com.qingge.springboot.mapper.PersonMapper;
import com.qingge.springboot.service.IPersonService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-10
 */
@Service
public class PersonServiceImpl extends ServiceImpl<PersonMapper, Person> implements IPersonService {

}
