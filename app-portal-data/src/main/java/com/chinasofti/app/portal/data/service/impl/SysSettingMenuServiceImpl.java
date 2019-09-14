package com.chinasofti.app.portal.data.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.chinasofti.app.portal.data.service.ISysSettingMenuService;
import com.chinasofti.app.portal.data.mapper.SysSettingMenuMapper;
import com.chinasofti.app.portal.data.model.entity.SysSettingMenu;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysSettingMenuServiceImpl extends ServiceImpl<SysSettingMenuMapper, SysSettingMenu> implements ISysSettingMenuService {

    @Override
    public List<SysSettingMenu> selectBySetting(String sysId) {
        QueryWrapper<SysSettingMenu> ew = new QueryWrapper<SysSettingMenu>();

        return this.list(ew.eq("sys_id",sysId));
    }
}
