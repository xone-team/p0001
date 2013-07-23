package com.xone.action.back.person;

import com.xone.action.base.ActionForm;

public class PersonForm implements ActionForm {
    private static final long serialVersionUID = 2945279293939990360L;
    protected String id;
    protected String username;
    protected String password;
    protected String nickName;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getNickName() {
        return nickName;
    }
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    
}
