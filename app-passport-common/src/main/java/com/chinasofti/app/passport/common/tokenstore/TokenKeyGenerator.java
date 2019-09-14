package com.chinasofti.app.passport.common.tokenstore;

import com.chinasofti.app.passport.common.token.PassportToken;

public interface TokenKeyGenerator {

    String extractKey(PassportToken token);
}
