package com.chinasofti.app.passport.server.service.fallback;

import com.chinasofti.app.passport.server.entity.vo.SysUserVO;
import com.chinasofti.app.passport.server.fegin.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 用户服务的fallback
 */
@Slf4j
@Service
public class UserServiceFallbackImpl implements UserService {

    @Override
    public SysUserVO findUserByUsername(String username) {
        log.error("调用{}异常:{}", "findUserByUsername", username);
        return null;
    }

}
