package com.chinasofti.app.gateway.exception;

/**
 * 403 授权拒绝
 */
public class AppDeniedException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public AppDeniedException() {
    }

    public AppDeniedException(String message) {
        super(message);
    }

    public AppDeniedException(Throwable cause) {
        super(cause);
    }

    public AppDeniedException(String message, Throwable cause) {
        super(message, cause);
    }

    public AppDeniedException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}
