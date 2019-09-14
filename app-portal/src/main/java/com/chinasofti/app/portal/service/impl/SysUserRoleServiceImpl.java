package com.chinasofti.app.portal.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chinasofti.app.portal.model.entity.SysUserRole;
import com.chinasofti.app.portal.mapper.SysUserRoleMapper;
import com.chinasofti.app.portal.service.ISysUserRoleService;
import org.springframework.stereotype.Service;


/**
 *
 * SysUserRole 表数据服务层接口实现类
 *
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements ISysUserRoleService {

	@Override
	public Set<String> findRolesByUid(String uid) {
		List<SysUserRole> list = this.list(new QueryWrapper<SysUserRole>().eq("user_id", uid));

		Set<String> set = new HashSet<String>();
		for (SysUserRole ur : list) {
			set.add(ur.getRoleId().toString());
		}
		return set;
	}
}