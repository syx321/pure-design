package com.qingge.springboot.service.impl;

import com.qingge.springboot.entity.BusinessProduct;
import com.qingge.springboot.mapper.BusinessProductMapper;
import com.qingge.springboot.service.IBusinessProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author longdengyu
 * @since 2022-06-09
 */
@Service
public class BusinessProductServiceImpl extends ServiceImpl<BusinessProductMapper, BusinessProduct> implements IBusinessProductService {

}
