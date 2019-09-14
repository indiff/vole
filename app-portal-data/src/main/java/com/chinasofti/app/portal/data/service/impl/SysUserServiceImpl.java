package com.chinasofti.app.portal.data.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chinasofti.app.portal.data.model.vo.SysUserVO;
import com.chinasofti.app.portal.data.service.ISysUserService;
import com.chinasofti.app.portal.data.mapper.SysUserMapper;
import com.chinasofti.app.portal.data.model.entity.SysUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 *
 * SysUser 表数据服务层接口实现类
 *
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

	@Resource
	private SysUserMapper userMapper;


	@Override
	public SysUserVO findUserByloginname(String loginname) {
		return userMapper.selectUserVoByLoginname(loginname);
	}

	@Override
	public SysUserVO findUserByUsername(String username) {
		return userMapper.selectUserVoByUsername(username);
	}

	@Override
	public SysUserVO findUserByMobile(String mobile) {
		return userMapper.selectUserVoByMobile(mobile);
	}


}