package com.xone.action.base.query;

import java.util.List;

public class ConditionItem {
    String logic;
    String field;
    String operator;
    String column;
    List items;
    public String getLogic() {
        return logic;
    }
    public void setLogic(String logic) {
        this.logic = logic;
    }
    public String getField() {
        return field;
    }
    public void setField(String field) {
        this.field = field;
    }
    public String getOperator() {
        return operator;
    }
    public void setOperator(String operator) {
        this.operator = operator;
    }
    public List getItems() {
        return items;
    }
    public void setItems(List items) {
        this.items = items;
    }
    public String getColumn() {
        return column;
    }
    public void setColumn(String column) {
        this.column = column;
    }
    
}
