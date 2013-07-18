package com.fzy.core.entity;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class ValidationContext {
    protected HttpServletRequest request;
    protected HttpServletRequest response;
    protected List messages = new ArrayList();
    protected List errors = new ArrayList();
    protected List fieldMessages = new ArrayList();
    protected List fieldErrors = new ArrayList();
    public boolean hasError(){
        if((errors != null && errors.size() > 0) || (fieldErrors != null && fieldErrors.size() > 0)){
            return true;
        }
        return false;
    }
    public void addFieldError(String field, String errorText){
        fieldErrors.add(new NameValuePair(field, errorText));
    }
    public void addFieldMessage(String field, String messageText){
        fieldMessages.add(new NameValuePair(field, messageText));
    }
    public void addError(String errorText){
        errors.add(errorText);
    }
    public void addMessage(String messageText){
        messages.add(messageText);
    }
    
    
    public HttpServletRequest getRequest() {
        return request;
    }
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    public HttpServletRequest getResponse() {
        return response;
    }
    public void setResponse(HttpServletRequest response) {
        this.response = response;
    }
    public List getMessages() {
        return messages;
    }
    public void setMessages(List messages) {
        this.messages = messages;
    }
    public List getErrors() {
        return errors;
    }
    public void setErrors(List errors) {
        this.errors = errors;
    }
    public List getFieldMessages() {
        return fieldMessages;
    }
    public void setFieldMessages(List fieldMessages) {
        this.fieldMessages = fieldMessages;
    }
    public List getFieldErrors() {
        return fieldErrors;
    }
    public void setFieldErrors(List fieldErrors) {
        this.fieldErrors = fieldErrors;
    }
    
}
