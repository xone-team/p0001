package com.fzy.core.entity;

import java.util.Map;

public class ValidationRule {
    protected String type;
    protected String field;
    protected String fieldText;
    protected String validatorName;
    protected Map paramTypes;
    protected Map params;
    protected String textPattern;
    protected String text;
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getField() {
        return field;
    }
    public void setField(String field) {
        this.field = field;
    }
    public String getFieldText() {
        return fieldText;
    }
    public void setFieldText(String fieldText) {
        this.fieldText = fieldText;
    }
    public String getValidatorName() {
        return validatorName;
    }
    public void setValidatorName(String validatorName) {
        this.validatorName = validatorName;
    }
    public Map getParamTypes() {
        return paramTypes;
    }
    public void setParamTypes(Map paramTypes) {
        this.paramTypes = paramTypes;
    }
    public Map getParams() {
        return params;
    }
    public void setParams(Map params) {
        this.params = params;
    }
    public String getTextPattern() {
        return textPattern;
    }
    public void setTextPattern(String textPattern) {
        this.textPattern = textPattern;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }

}
