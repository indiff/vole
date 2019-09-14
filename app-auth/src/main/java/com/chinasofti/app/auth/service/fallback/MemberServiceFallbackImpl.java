package com.chinasofti.app.auth.service.fallback;

import com.chinasofti.app.auth.fegin.MemberService;
import com.chinasofti.app.auth.model.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class MemberServiceFallbackImpl implements MemberService {

    @Override
    public MemberVO findMemberByMembername(String username) {
        log.error("调用{}异常:{}", "findMemberByMembername", username);
        return null;
    }


    @Override
    public MemberVO findMemberByMobile(String mobile) {
        log.error("调用{}异常:{}", "通过手机号查询用户", mobile);
        return null;
    }


    @Override
    public MemberVO findMemberByOpenId(String openId) {
        log.error("调用{}异常:{}", "通过OpenId查询用户", openId);
        return null;
    }
}
