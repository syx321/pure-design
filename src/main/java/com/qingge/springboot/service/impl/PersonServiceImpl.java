package com.qingge.springboot.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.controller.dto.PersonDTO;
import com.qingge.springboot.controller.dto.PersonPasswordDTO;
import com.qingge.springboot.entity.Menu;
import com.qingge.springboot.entity.Person;
import com.qingge.springboot.entity.User;
import com.qingge.springboot.exception.ServiceException;
import com.qingge.springboot.mapper.PersonMapper;
import com.qingge.springboot.mapper.RoleMapper;
import com.qingge.springboot.mapper.RoleMenuMapper;
import com.qingge.springboot.service.IMenuService;
import com.qingge.springboot.service.IPersonService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingge.springboot.utils.TokenUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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

    @Resource
    private PersonMapper personMapper;
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private RoleMenuMapper roleMenuMapper;
    @Resource
    private IMenuService menuService;
    private static final Log LOG = Log.get();
    @Override
    public PersonDTO login(PersonDTO personDTO) {
        Person one = getUserInfo(personDTO);
        if (one != null) {
            BeanUtil.copyProperties(one, personDTO, true);
            // 设置token
            String token = TokenUtils.genToken(one.getUserId().toString(), one.getPassword());
            personDTO.setToken(token);

            String role = one.getRole(); // ROLE_ADMIN
            // 设置用户的菜单列表
            List<Menu> roleMenus = getRoleMenus(role);
            personDTO.setMenus(roleMenus);
            return personDTO;
        } else {
            throw new ServiceException(Constants.CODE_600, "用户名或密码错误");
        }
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
    public boolean saveUser(Person person) {
        if(person.getUserId() == null){
            return save(person);
        }else {
            return updateById(person);
        }
//        return saveOrUpdate(user);
    }
    @Override
    public boolean updatePassword(PersonPasswordDTO personPasswordDTO) {
        int update = personMapper.updatePassword(personPasswordDTO);
        if(update == 1){
            return true;
        }
        if (update < 1) {
            throw new ServiceException(Constants.CODE_600, "密码错误");
        }
        return false;
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
    /**
     * 获取当前角色的菜单列表
     * @param roleFlag
     * @return
     */
    private List<Menu> getRoleMenus(String roleFlag) {
        Integer roleId = roleMapper.selectByFlag(roleFlag);
        // 当前角色的所有菜单id集合
        List<Integer> menuIds = roleMenuMapper.selectByRoleId(roleId);

        // 查出系统所有的菜单(树形)
        List<Menu> menus = menuService.findMenus("");
        // new一个最后筛选完成之后的list
        List<Menu> roleMenus = new ArrayList<>();
        // 筛选当前用户角色的菜单
        for (Menu menu : menus) {
            if (menuIds.contains(menu.getId())) {
                roleMenus.add(menu);
            }
            List<Menu> children = menu.getChildren();
            // removeIf()  移除 children 里面不在 menuIds集合中的 元素
            children.removeIf(child -> !menuIds.contains(child.getId()));
        }
        return roleMenus;
    }
}
