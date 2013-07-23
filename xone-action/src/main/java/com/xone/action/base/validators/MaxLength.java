package com.xone.action.base.validators;

import java.util.Map;

import com.xone.action.base.ActionForm;
import com.xone.action.base.validation.ValidationContext;
import com.xone.action.base.validation.ValidationRuleConfig;
import com.xone.action.base.validation.ValidationUtils;

public class MaxLength implements Validator {

    public boolean execute(ActionForm form, ValidationContext context,
            ValidationRuleConfig rule) throws Exception {
        String fieldName = rule.getField();
        String value = ValidationUtils.getStringOfForm(fieldName, form);
        if( value == null ){
            return false;
        }
        int length = value.toString().length();
        
        Map params = rule.getParams();
        
        boolean result = true;
        
        int maxInt = ((Number)params.get("max")).intValue();
        if(length > maxInt){
            result = false;
        }
        
        if(!result){
            String text = rule.getText();
            context.addFieldError(fieldName, text);
        }
        
        return result;
    }

}
