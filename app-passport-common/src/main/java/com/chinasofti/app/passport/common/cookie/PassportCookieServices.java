package com.chinasofti.app.passport.common.cookie;

import com.chinasofti.app.passport.common.auth.PassportAuthentication;
import org.springframework.security.core.AuthenticationException;

public interface PassportCookieServices {

    PassportAuthentication loadAuthentication(String cookieValue) throws AuthenticationException;

    boolean removeAuthentication (String cookieValue) throws AuthenticationException;
}
