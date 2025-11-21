package com.helloworld;

public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        System.out.println("This is a Java application for security monitoring.");
        
        String javaVersion = System.getProperty("java.version");
        String javaVendor = System.getProperty("java.vendor");
        System.out.println("Running on Java " + javaVersion + " (" + javaVendor + ")");
    }
}
