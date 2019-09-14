package com.chinasofti.app.passport.common.tokenstore;

import com.chinasofti.app.passport.common.token.PassportToken;

public interface PassportTokenStore {

    public PassportToken storeToken(PassportToken token);

    public boolean deleteToken(PassportToken token);

    public boolean deleteToken(String tokenKey);

    public PassportToken getToken(String tokenKey);

}
