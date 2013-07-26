package com.xone.action.base.validators;

import com.xone.action.base.ActionForm;
import com.xone.action.base.validation.ValidationContext;
import com.xone.action.base.validation.ValidationRuleConfig;

public interface Validator {
    public boolean execute(ActionForm form, ValidationContext context, ValidationRuleConfig rule) throws Exception;
}
