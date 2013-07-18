package com.fzy.core.entity;

public class ValidatorConfig {
    protected String name;
    protected String className;
    protected String singleton;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getClassName() {
        return className;
    }
    public void setClassName(String className) {
        this.className = className;
    }
    public String getSingleton() {
        return singleton;
    }
    public void setSingleton(String singleton) {
        this.singleton = singleton;
    }
    
}
