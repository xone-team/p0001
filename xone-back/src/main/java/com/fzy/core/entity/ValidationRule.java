package com.fzy.core.entity;

import java.util.Map;

import com.fzy.core.validators.Validator;

public class ValidationRule {
    protected String type;
    protected String field;
    protected String fieldText;
    protected String validatorName;
    protected Map params;
    protected String text;
    protected ValidatorConfig validatorConfig;
    protected boolean shortcut;
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
    public Map getParams() {
        return params;
    }
    public void setParams(Map params) {
        this.params = params;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public ValidatorConfig getValidatorConfig() {
        return validatorConfig;
    }
    public void setValidatorConfig(ValidatorConfig validatorConfig) {
        this.validatorConfig = validatorConfig;
    }
    public boolean isShortcut() {
        return shortcut;
    }
    public void setShortcut(boolean shortcut) {
        this.shortcut = shortcut;
    }

}
