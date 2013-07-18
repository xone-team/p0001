package com.fzy.core.validators;

import java.util.Map;

import com.fzy.core.entity.ValidationContext;
import com.fzy.core.entity.ValidationRule;
import com.fzy.web.RestForm;
import com.fzy.webtools.A;
import com.fzy.webtools.ValidationUtils;

public class Length implements Validator {

    public boolean execute(RestForm form, ValidationContext context,
            ValidationRule rule) throws Exception {
        String fieldName = rule.getField();
        String value = ValidationUtils.getStringOfForm(fieldName, form);
        if( value == null ){
            return false;
        }
        int length = value.toString().length();
        
        Map params = rule.getParams();
        
        boolean result = true;
        
        int minInt = ((Number)params.get("min")).intValue();
        if(length < minInt){
            result = false;
        }
        
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
