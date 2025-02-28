package com.chinasofti.app.auth.util.jackson2;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;

import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.util.Assert;

import java.io.IOException;
import java.util.*;

public class OAuth2AccessTokenSerializer extends JsonSerializer<OAuth2AccessToken> {

    public OAuth2AccessTokenSerializer() {
    }

    @Override
    public void serialize(OAuth2AccessToken token, JsonGenerator jgen, SerializerProvider serializers) throws IOException {
        ser(token, jgen, serializers, null);
    }

    @Override
    public void serializeWithType(OAuth2AccessToken token, JsonGenerator jgen, SerializerProvider serializers,
                                  TypeSerializer typeSer)
            throws IOException {
        ser(token, jgen, serializers, typeSer);
    }

    private void ser(OAuth2AccessToken token, JsonGenerator jgen, SerializerProvider serializers,
                     TypeSerializer typeSer) throws IOException {
        jgen.writeStartObject();
        if (typeSer != null) {
            jgen.writeStringField(typeSer.getPropertyName(), OAuth2AccessToken.class.getName());
        }
        jgen.writeStringField(OAuth2AccessToken.ACCESS_TOKEN, token.getValue());
        jgen.writeStringField(OAuth2AccessToken.TOKEN_TYPE, token.getTokenType());
        OAuth2RefreshToken refreshToken = token.getRefreshToken();
        if (refreshToken != null) {
            jgen.writeStringField(OAuth2AccessToken.REFRESH_TOKEN, refreshToken.getValue());
        }
        Date expiration = token.getExpiration();
        if (expiration != null) {
            long now = System.currentTimeMillis();
            jgen.writeNumberField(OAuth2AccessToken.EXPIRES_IN, (expiration.getTime() - now) / 1000);
        }
        Set<String> scope = token.getScope();
        if (scope != null && !scope.isEmpty()) {
            StringBuffer scopes = new StringBuffer();
            for (String s : scope) {
                Assert.hasLength(s, "Scopes cannot be null or empty. Got " + scope + "");
                scopes.append(s);
                scopes.append(" ");
            }
            jgen.writeStringField(OAuth2AccessToken.SCOPE, scopes.substring(0, scopes.length() - 1));
        }
        Map<String, Object> additionalInformation = token.getAdditionalInformation();
        for (String key : additionalInformation.keySet()) {
            jgen.writeObjectField(key, additionalInformation.get(key));
        }
        jgen.writeEndObject();
    }

}
