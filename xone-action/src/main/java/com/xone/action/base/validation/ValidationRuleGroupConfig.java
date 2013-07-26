package com.xone.action.base.validation;

import java.util.List;

public class ValidationRuleGroupConfig {
    protected String type;
    protected String field;
    protected List group;
    protected Boolean shortcut;
    public List getGroup() {
        return group;
    }
    public void setGroup(List group) {
        this.group = group;
    }
    public Boolean getShortcut() {
        return shortcut;
    }
    public void setShortcut(Boolean shortcut) {
        this.shortcut = shortcut;
    }
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
    
}
