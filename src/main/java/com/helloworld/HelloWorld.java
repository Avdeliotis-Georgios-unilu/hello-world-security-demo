package com.helloworld;

import org.slf4j.*;

public class HelloWorld {
    private static final Logger log = LoggerFactory.getLogger(HelloWorld.class);
    public static void main(String[] args) {
        log.info("Hello, World!");
        log.info("This is a Java application for security monitoring.");
        log.info("Running on Java {}", System.getProperty("java.version"));

    }
}
