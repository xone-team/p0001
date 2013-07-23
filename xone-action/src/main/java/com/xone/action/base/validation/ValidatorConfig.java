package com.xone.action.base.validation;

import java.util.Map;

import com.xone.action.base.validators.Validator;

public class ValidatorConfig {
    protected String name;
    protected String className;
    protected boolean singleton;
    protected boolean customized;
    protected Map paramTypes;
    protected String textPattern;
    protected Validator validator;
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

    public Map getParamTypes() {
        return paramTypes;
    }
    public void setParamTypes(Map paramTypes) {
        this.paramTypes = paramTypes;
    }
    public String getTextPattern() {
        return textPattern;
    }
    public void setTextPattern(String textPattern) {
        this.textPattern = textPattern;
    }
    public Validator getValidator() {
        return validator;
    }
    public void setValidator(Validator validator) {
        this.validator = validator;
    }
    public boolean isSingleton() {
        return singleton;
    }
    public void setSingleton(boolean singleton) {
        this.singleton = singleton;
    }
    public boolean isCustomized() {
        return customized;
    }
    public void setCustomized(boolean customized) {
        this.customized = customized;
    }

}
