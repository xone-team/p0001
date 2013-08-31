package com.xone.model.hibernate.support;

import java.io.Serializable;

public class NameValuePairs implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 5278405000079058357L;
    String name;
    String value;
    
    public NameValuePairs(String name, String value) {
        super();
        this.name = name;
        this.value = value;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    

}
