package com.chinasofti.app.mps.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chinasofti.app.common.validate.Assert;
import com.chinasofti.app.mps.model.vo.PermissionVO;
import com.chinasofti.app.mps.service.PermissionService;
import com.chinasofti.app.mps.mapper.PermissionMapper;
import com.chinasofti.app.mps.model.entity.Permission;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * <p>
 * 权限表 服务实现类
 * </p>
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    @Override
    @Cacheable(value = "permission_details", key = "#role  + '_permission'")
    public List<PermissionVO> findPermissionByRoleName(String role) {
        return permissionMapper.findPermissionByRoleName(role);
    }

    @Override
    //@CacheEvict(value = "permission_details", allEntries = true)
    public Boolean deletePermission(Integer id) {
        Assert.isNull(id, "权限ID不能为空");
        // 删除当前节点
        Permission condition1 = new Permission();
        condition1.setPermissionId(id);
        return this.updateById(condition1);

    }

    @Override
    //@CacheEvict(value = "permission_details", allEntries = true)
    public Boolean updatePermissionById(Permission permission) {
        return this.updateById(permission);
    }
}
