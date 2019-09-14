package com.chinasofti.app.portal.data.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chinasofti.app.portal.data.model.entity.SysSettingMenu;

import java.util.List;


/**
 *
 * SysSettingMenu 表数据服务层接口
 *
 */
public interface ISysSettingMenuService extends IService<SysSettingMenu> {
	
	/**
	 * 获取指定角色的权限
	 */
	List<SysSettingMenu> selectBySetting(String sysId);

}