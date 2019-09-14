package com.chinasofti.app.mps.listener;

import com.chinasofti.app.mps.service.SysLogService;
import com.chinasofti.app.mps.model.entity.SysLog;
import com.chinasofti.app.mps.model.vo.LogVO;
import org.slf4j.MDC;
//import org.springframework.amqp.rabbit.annotation.RabbitHandler;
//import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
//@RabbitListener(queues = MqQueueConstant.LOG_QUEUE)
public class LogReceiveListener {
    private static final String KEY_USER = "user";

    @Resource
    private SysLogService sysLogService;

//    @RabbitHandler
    public void receive(LogVO logVo) {
        SysLog sysLog = logVo.getSysLog();
        MDC.put(KEY_USER, logVo.getUsername());
        sysLog.setCreateBy(logVo.getUsername());
        sysLogService.save(sysLog);
        MDC.remove(KEY_USER);
    }
}
