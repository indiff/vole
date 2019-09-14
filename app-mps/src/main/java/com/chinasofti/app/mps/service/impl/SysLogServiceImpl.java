package com.chinasofti.app.mps.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chinasofti.app.common.constants.CommonConstant;
import com.chinasofti.app.common.validate.Assert;
import com.chinasofti.app.mps.service.SysLogService;
import com.chinasofti.app.mps.mapper.SysLogMapper;
import com.chinasofti.app.mps.model.entity.SysLog;
import org.springframework.stereotype.Service;

import java.util.Date;


@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {

    @Override
    public Boolean updateByLogId(Long id) {
        Assert.isNull(id, "日志ID为空");

        SysLog sysLog = new SysLog();
        sysLog.setId(id);
        sysLog.setDelFlag(CommonConstant.STATUS_DEL);
        sysLog.setUpdateTime(new Date());
        return updateById(sysLog);
    }
}
