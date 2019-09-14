package com.chinasofti.app.portal.data.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chinasofti.app.portal.data.model.vo.TreeMenu;
import com.chinasofti.app.portal.data.model.entity.SysMenu;
import com.chinasofti.app.portal.data.model.vo.SysMenuVO;

import java.util.List;

/**
 *
 * SysMenu 表数据服务层接口
 *
 */
public interface ISysMenuService extends IService<SysMenu> {

	/**
	 * 获取指定用户的菜单
	 * @param  menuIds 当前用户所在角色拥有的权限ID集合
	 * @param  pid 菜单父ID
	 */
	List<TreeMenu> selectTreeMenuByMenuIdsAndPid(List<String> menuIds, String pid);
	/**
	 * 获取当前用户的菜单
	 */
	List<TreeMenu> selectTreeMenuByUserId(String uid);

	/**
	 * 获取当前角色菜单列表
	 */
	List<SysMenuVO> findMenusByRoleName(String role);

}