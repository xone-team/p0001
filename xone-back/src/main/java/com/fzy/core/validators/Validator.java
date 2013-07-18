package com.fzy.core.validators;

import com.fzy.core.entity.ValidationContext;
import com.fzy.core.entity.ValidationRule;
import com.fzy.web.RestForm;

public interface Validator {
    public boolean execute(RestForm form, ValidationContext context, ValidationRule rule) throws Exception;
}
