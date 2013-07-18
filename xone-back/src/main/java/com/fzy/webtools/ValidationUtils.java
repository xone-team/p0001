package com.fzy.webtools;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;

import com.fzy.action.app.person.PersonAction;
import com.fzy.core.entity.ValidationContext;
import com.fzy.core.validators.Validator;
import com.fzy.web.RestForm;

public class ValidationUtils {
    private static Log log = LogFactory.getLog(ValidationUtils.class);

    public static final String VALIDATORS_ROOT = "validators";
    public static final String VALIDATOR_NAME = "name";
    public static final String VALIDATOR_CLASS = "class";
    public static final String VALIDATOR_SINGLETON = "singleton";

    public static final String VALIDATION_RULES_ROOT = "validationRules";
    public static final String VALIDATION_RULE_VALIDATOR_NAME = "validatorName";
    public static final String VALIDATION_RULE_PARAM_TYPES = "paramTypes";
    public static final String VALIDATION_RULE_TEXT_PATTERN = "textPattern";
    public static final String VALIDATION_RULE_TYPE = "type";
    public static final String VALIDATION_RULE_SUB_RULES = "subRules";
    public static final String VALIDATION_RULE_SHORTCUT = "shortcut";

    public static final String VALIDATION_RULE_FIELD = "field";
    public static final String VALIDATION_RULE_FIELD_TEXT = "fieldText";
    public static final String VALIDATION_RULE_PARAMS = "params";

    public static final String VALIDATION_RULE_TYPE_ACTION = "action";
    public static final String VALIDATION_RULE_TYPE_GROUP = "group";
    public static final String VALIDATION_RULE_TYPE_FIELD = "field";

    public static String getStringOfForm(String fieldName, RestForm form) throws Exception {
        String result = null;
        Method m = form.getClass().getMethod("get" + StringUtils.capitalize(fieldName));
        result = (String) m.invoke(form);
        return result;
    }

    public static List ruleConfig2list(JSONObject ruleConfig) throws Exception {
        List result = new ArrayList();
        JSONArray ruleArray = ruleConfig.getJSONArray(VALIDATION_RULES_ROOT);
        for (int i = 0; i < ruleArray.length(); i++) {
            JSONObject rule = ruleArray.getJSONObject(i);
            String type = rule.getString(VALIDATION_RULE_TYPE);
            // field
            if (VALIDATION_RULE_TYPE_FIELD.equals(type)) {
                String field = rule.getString(VALIDATION_RULE_FIELD);
                String fieldText = rule.getString(VALIDATION_RULE_FIELD_TEXT);
                // VALIDATION_RULE_SHORTCUT is not required
                boolean isShort = getBooleanFormJson(rule, VALIDATION_RULE_SHORTCUT, true);
                
                JSONArray subRules = rule.getJSONArray(VALIDATION_RULE_SUB_RULES);
                for (int j = 0; j < subRules.length(); j++) {
                    JSONObject subRule = subRules.getJSONObject(j);
                    String validatorName = subRule.getString(VALIDATION_RULE_VALIDATOR_NAME);
                    // VALIDATION_RULE_SHORTCUT is not required
                    isShort = getBooleanFormJson(subRule, VALIDATION_RULE_SHORTCUT, isShort);
                }
            }
        }
        JSONObject commonRulesConfig = A.getJsonConfigWithCacheOfWeb("/assets/data/validation-rules.json");
        JSONObject commonValidatorsConfig = A.getJsonConfigWithCacheOfClass("/conf-fzy/validators.json");
        return result;
    }
    
    public static Validator getValidatorByNameOfConfig(String validatorName, JSONObject validatorConfig) throws Exception{
        Validator result = null;
        JSONArray validators = validatorConfig.getJSONArray(VALIDATORS_ROOT);
        for (int i = 0; i < validators.length(); i++) {
            JSONObject validator = validators.getJSONObject(i);
            String name = validator.getString(validatorName);
            if(name.equals(validatorName)){
                String className = validator.getString(VALIDATOR_CLASS);
                // VALIDATOR_SINGLETON is not required
                boolean isSingleton = getBooleanFormJson(validator, VALIDATOR_SINGLETON, true);
                
                // TODO
            }
        }
        return result;
    }
    
    public static boolean getBooleanFormJson(JSONObject jsonObject, String name, boolean defaultValue) throws Exception{
        Boolean value = jsonObject.getBoolean(name);
        boolean result = defaultValue;
        if(value != null && !value.booleanValue()){
            result = false;
        }
        return result;
    }

    public static void validate(RestForm form, ValidationContext context) throws Exception {
        JSONObject validationRulesConfig = A.getJsonConfigWithCacheOfWeb("/assets/data/action/person/Person-validation-rules.json");
        JSONArray validatorsConfig = validationRulesConfig.getJSONArray(VALIDATORS_ROOT);
        boolean hasErrorAtAll = true;
        for (int i = 0; i < validatorsConfig.length(); i++) {
            JSONObject ruleValidator = validatorsConfig.getJSONObject(i);
            String type = ruleValidator.getString(VALIDATION_RULE_TYPE);
            if (VALIDATION_RULE_TYPE_FIELD.equals(type)) {
                JSONArray fieldValidators = ruleValidator.getJSONArray(VALIDATION_RULE_SUB_RULES);
                String field = ruleValidator.getString(VALIDATION_RULE_FIELD);
                String fieldText = ruleValidator.getString(VALIDATION_RULE_FIELD_TEXT);
                boolean shotcut = true;
                for (int j = 0; j < fieldValidators.length(); j++) {
                    JSONObject config = (JSONObject) A.getJsonValueSafely(fieldValidators, j);
                    Boolean shortValue = (Boolean) A.getJsonValueSafely(config, VALIDATION_RULE_SHORTCUT);
                    if (shortValue != null && !shortValue.booleanValue()) {
                        shotcut = false;
                    }
                    String func = (String) A.getJsonValueSafely(config, VALIDATION_RULE_VALIDATOR_NAME);
                    if (!StringUtils.isBlank(func)) {
                        Validator v = getValidator(func);
                        if (v != null) {
//                            boolean hasError = hasErrorAtAll = v.execute(form, context, config);
//                            if (hasError && shotcut) {
//                                break;
//                            }
                        }
                    }
                }
            }

            if (VALIDATION_RULE_TYPE_GROUP.equals(type)) {
                JSONArray group = ruleValidator.getJSONArray(VALIDATION_RULE_TYPE_GROUP);
                String func = ruleValidator.getString(VALIDATION_RULE_VALIDATOR_NAME);
                Validator v = getValidator(func);
                if (v != null && group != null && group.length() > 0) {
                    boolean isShort = true;
                    for (int j = 0; j < group.length(); j++) {
                        JSONObject g = group.getJSONObject(j);
                        // g to config
                        JSONObject config = null;
//                        boolean hasError = hasErrorAtAll = v.execute(form, context, config);
//                        if (hasError && isShort) {
//                            break;
//                        }
                    }
                }
            }
        }
    }

    private static Validator getValidator(String func) throws Exception {
        Validator v = getValidatorByName(func, "UserQuery-validation-beans.json", PersonAction.class);
        if (v == null) {
            v = getValidatorByName(func, "/conf/validation-beans.json");
        }
        return v;
    }

    private static Validator getValidatorByName(String name, String configPath, Class clazz) throws Exception {
        JSONObject vs = A.getJsonConfigWithCache(configPath, clazz);
        JSONArray s = (JSONArray) vs.get(VALIDATORS_ROOT);
        if (s != null) {
            for (int i = 0; i < s.length(); i++) {
                JSONObject item = (JSONObject) s.get(i);
                String n = (String) item.get(VALIDATOR_NAME);
                if (name.equals(n)) {
                    String clazzName = (String) item.get(VALIDATOR_CLASS);
                    return (Validator) Class.forName(clazzName).newInstance();
                }
            }
        }
        return null;
    }

    private static Validator getValidatorByName(String name, String configPath) throws Exception {
        JSONObject vs = A.getJsonConfigWithCacheOfClass(configPath);
        JSONArray s = (JSONArray) vs.get(VALIDATORS_ROOT);
        if (s != null) {
            for (int i = 0; i < s.length(); i++) {
                JSONObject item = (JSONObject) s.get(i);
                String n = (String) item.get(VALIDATOR_NAME);
                if (name.equals(n)) {
                    String clazz = (String) item.get(VALIDATOR_CLASS);
                    return (Validator) Class.forName(clazz).newInstance();
                }
            }
        }
        return null;
    }

}
