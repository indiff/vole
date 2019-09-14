package com.chinasofti.app.portal.common.fegin.fallback;

import com.chinasofti.app.portal.common.vo.SysSettingMenuVO;
import com.chinasofti.app.portal.common.vo.SysSettingVO;
import com.chinasofti.app.portal.common.fegin.SettingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 系统服务的fallback
 */
@Slf4j
@Service
public class SettingServiceFallbackImpl implements SettingService {


    @Override
    public SysSettingVO findSysByGlobalKey(String sysGlobalKey) {
        log.error("调用{}异常:{}", "findSysByGlobalKey", sysGlobalKey);
        return null;
    }

    @Override
    public List<SysSettingMenuVO> findSysMenusById(String sysId) {
        log.error("调用{}异常:{}", "findSysMenusById", sysId);
        return null;
    }
}
