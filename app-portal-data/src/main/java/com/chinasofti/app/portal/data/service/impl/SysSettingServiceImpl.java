package com.chinasofti.app.portal.data.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.chinasofti.app.portal.data.service.ISysSettingService;
import com.chinasofti.app.portal.data.mapper.SysSettingMapper;
import com.chinasofti.app.portal.data.model.entity.SysSetting;
import org.springframework.stereotype.Service;

/**
 *
 * SysSetting 表数据服务层接口实现类
 *
 */
@Service
public class SysSettingServiceImpl extends ServiceImpl<SysSettingMapper, SysSetting> implements ISysSettingService {
	
	@Override
	public SysSetting findSysByGlobalKey(String sysGlobalKey) {
		return this.getOne(new QueryWrapper<SysSetting>().eq("sys_Global_Key",sysGlobalKey));
	}


}