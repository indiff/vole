package com.chinasofti.app.portal.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chinasofti.app.portal.model.entity.SysUserRole;

import java.util.Set;


/**
 *
 * SysUserRole 表数据服务层接口
 *
 */
public interface ISysUserRoleService extends IService<SysUserRole> {
	
	/**
	 * 获取用户的角色
	 * @param uid
	 * @return
	 */
	Set<String> findRolesByUid(String uid);
}