package com.xone.action.base.validators;

import com.xone.action.base.ActionForm;
import com.xone.action.base.validation.ValidationContext;
import com.xone.action.base.validation.ValidationRuleConfig;
import com.xone.action.base.validation.ValidationUtils;

public class NotNull implements Validator {
    public boolean execute(ActionForm form, ValidationContext context,
            ValidationRuleConfig rule) throws Exception {
        String fieldName = rule.getField();
        String value = ValidationUtils.getStringOfForm(fieldName, form);
        
        boolean result = value != null;
        
        if(!result){
            String text = rule.getText();
            context.addFieldError(fieldName, text);
        }
        
        return result;
    }

}
