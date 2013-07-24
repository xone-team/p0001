package com.xone.action.base.validation;

import java.io.StringReader;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.xone.action.base.ActionForm;
import com.xone.action.base.validators.Validator;
import com.xone.action.utils.A;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class ValidationUtils {
    private static Log log = LogFactory.getLog(ValidationUtils.class);

    public static final String VALIDATORS_ROOT = "validators";
    public static final String VALIDATOR_NAME = "name";
    public static final String VALIDATOR_CLASS_NAME = "className";
    public static final String VALIDATOR_CUSTOMIZED = "customized";
    public static final String VALIDATOR_SINGLETON = "singleton";
    public static final String VALIDATOR_TEXT_PATTERN = "textPattern";
    public static final String VALIDATOR_PARAM_TYPES = "paramTypes";

    public static final String VALIDATION_RULES_ROOT = "validationRules";
    public static final String VALIDATION_RULE_VALIDATOR_NAME = "validatorName";
    public static final String VALIDATION_RULE_TYPE = "type";
    public static final String VALIDATION_RULE_SUB_RULES = "subRules";
    public static final String VALIDATION_RULE_SHORTCUT = "shortcut";

    public static final String VALIDATION_RULE_FIELD = "field";
    public static final String VALIDATION_RULE_FIELD_TEXT = "fieldText";
    public static final String VALIDATION_RULE_PARAMS = "params";

    public static final String VALIDATION_RULE_TYPE_ACTION = "action";
    public static final String VALIDATION_RULE_TYPE_GROUP = "group";
    public static final String VALIDATION_RULE_TYPE_FIELD = "field";

    public static String getStringOfForm(String fieldName, ActionForm form) throws Exception {
        String result = null;
        Method m = form.getClass().getMethod("get" + StringUtils.capitalize(fieldName));
        result = (String) m.invoke(form);
        return result;
    }

    /** 读取所有验证规则配置
     * @param ruleConfig
     * @param validatorConfigArray
     * @return
     * @throws Exception
     */
    public static List ruleConfig2list(JSONObject ruleConfig, JSONObject[] validatorConfigArray) throws Exception {
        JSONObject commonValidatorsParamsConfig = A.getJsonConfigWithCacheOfWeb("/assets/data/validators-params.json");

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
                List fieldGroupList = new ArrayList();
                for (int j = 0; j < subRules.length(); j++) {
                    JSONObject subRule = subRules.getJSONObject(j);
                    String validatorName = subRule.getString(VALIDATION_RULE_VALIDATOR_NAME);
                    ValidatorConfig vc = getValidatorByNameOfConfigs(validatorName, validatorConfigArray, commonValidatorsParamsConfig);
                    if(vc == null){
                        throw new Exception("cannot find validatorName:" + validatorName + "\r\n at subRule:" + subRule);
                    }
//                    log.info(validatorName);
                    // VALIDATION_RULE_PARAMS is not required
                    JSONObject paramsConfig = ( JSONObject )A.getJsonValueSafely(subRule, VALIDATION_RULE_PARAMS);
                    Map params = null;
                    if(paramsConfig != null){
                    	params = paramsConfig2map(paramsConfig);
                    }
                    
                    String textPattern = vc.getTextPattern();
                    String text = null;
                    if(textPattern != null){
                        text = getTextByPatternAndParams(textPattern, fieldText, params);
                        log.error("text:" + text);
                    }
                    
                    // VALIDATION_RULE_SHORTCUT is not required
                    boolean isShortField = getBooleanFormJson(subRule, VALIDATION_RULE_SHORTCUT, isShort);
                    
                    ValidationRuleConfig validationRule = new ValidationRuleConfig();
                    validationRule.setField(field);
                    validationRule.setFieldText(fieldText);
                    validationRule.setType(type);
                    validationRule.setValidatorConfig(vc);
                    validationRule.setValidatorName(validatorName);
                    validationRule.setText(text);
                    validationRule.setParams(params);
                    validationRule.setShortcut(isShortField);
                    fieldGroupList.add(validationRule);
                }

                ValidationRuleGroupConfig validationRuleGroup = new ValidationRuleGroupConfig();
                validationRuleGroup.setType(type);
                validationRuleGroup.setField(field);
                validationRuleGroup.setShortcut(isShort);
                validationRuleGroup.setGroup(fieldGroupList);
                result.add(validationRuleGroup);
            }
            
            // group 
            if (VALIDATION_RULE_TYPE_GROUP.equals(type)) {
                // VALIDATION_RULE_SHORTCUT is not required
                boolean isShort = getBooleanFormJson(rule, VALIDATION_RULE_SHORTCUT, true);
                
                JSONArray subRules = (JSONArray) A.getJsonValue(rule, VALIDATION_RULE_SUB_RULES);
                List groupList = new ArrayList();
                for (int j = 0; j < subRules.length(); j++) {
                    JSONObject subRule = subRules.getJSONObject(j);
                    String validatorName = subRule.getString(VALIDATION_RULE_VALIDATOR_NAME);
                    ValidatorConfig vc = getValidatorByNameOfConfigs(validatorName, validatorConfigArray, commonValidatorsParamsConfig);
                    
                    // VALIDATION_RULE_SHORTCUT is not required
                    boolean isShortSub = getBooleanFormJson(subRule, VALIDATION_RULE_SHORTCUT, isShort);
                    
                    ValidationRuleConfig validationRule = new ValidationRuleConfig();
                    validationRule.setType(type);
                    validationRule.setValidatorConfig(vc);
                    validationRule.setValidatorName(validatorName);
                    validationRule.setShortcut(isShortSub);
                    groupList.add(validationRule);
                }

                ValidationRuleGroupConfig validationRuleGroup = new ValidationRuleGroupConfig();
                validationRuleGroup.setType(type);
                validationRuleGroup.setShortcut(isShort);
                validationRuleGroup.setGroup(groupList);
                result.add(validationRuleGroup);
            }
            
            // action 
            if (VALIDATION_RULE_TYPE_ACTION.equals(type)) {
                boolean isShort = true;
                
                String validatorName = rule.getString(VALIDATION_RULE_VALIDATOR_NAME);
                ValidatorConfig vc = getValidatorByNameOfConfigs(validatorName, validatorConfigArray, commonValidatorsParamsConfig);
                
                // VALIDATION_RULE_SHORTCUT is not required
                boolean isShortSub = getBooleanFormJson(rule, VALIDATION_RULE_SHORTCUT, isShort);
                
                ValidationRuleConfig validationRule = new ValidationRuleConfig();
                validationRule.setType(type);
                validationRule.setValidatorConfig(vc);
                validationRule.setValidatorName(validatorName);
                validationRule.setShortcut(isShortSub);
                result.add(validationRule);
            }
        }
        return result;
    }
    
    /** 生成验证提示信息
     * @param textPattern
     * @param fieldText
     * @param params
     * @return
     * @throws Exception
     */
    private static String getTextByPatternAndParams(String textPattern, String fieldText, Map params) throws Exception{
        String result = null;
    	Map m = new HashMap();
        m.put("fieldText", fieldText);
        m.put("params", params);
    	try {
			Configuration c = new Configuration();
			Template t = new Template(null, new StringReader(textPattern), null);
			StringWriter x = new StringWriter();
			t.process(m, x);
			result = x.toString();
		} catch (Exception e) {
			log.error("cannot read textPattern of fieldText : ["+fieldText+"].", e);
		}
        return result;
    }
    
    /** 简单的JSON对象转MAP
     * @param paramsConfig
     * @return
     */
    private static Map paramsConfig2map(JSONObject paramsConfig){
    	Map result = new HashMap();
    	for (Iterator iterator = paramsConfig.keys(); iterator.hasNext();) {
			String key = (String) iterator.next();
			Object value = null;
			try {
				value = paramsConfig.get(key);
			} catch (JSONException e) {
				log.error("Method [paramsConfig2map] config :" + paramsConfig);
				log.error("cannot find value of key : ["+key+"].", e);
			}
			result.put(key, value);
		}
    	return result;
    }
    
    /** 获取验证器配置（前后台通用的配置）
     * @param validatorName
     * @param validatorsParmsConfig
     * @return
     * @throws Exception
     */
    public static ValidatorConfig validatorParams2obj(String validatorName, JSONObject validatorsParmsConfig) throws Exception{
        ValidatorConfig result = null;
        JSONArray validators = validatorsParmsConfig.getJSONArray(VALIDATORS_ROOT);
        for (int i = 0; i < validators.length(); i++) {
            JSONObject validator = validators.getJSONObject(i);
            String name = validator.getString(VALIDATOR_NAME);
            if (name.equals(validatorName)) {
                String textPattern = validator.getString(VALIDATOR_TEXT_PATTERN);
                ValidatorConfig vc = new ValidatorConfig();
                vc.setName(name);
                vc.setTextPattern(textPattern);
                result = vc;
                break;
            }
        }
        return result;
    }

    private static ValidatorConfig getValidatorByNameOfConfigs(String validatorName, JSONObject[] validatorConfigs, JSONObject commonValidatorsParamsConfig) throws Exception {
        ValidatorConfig result = null;
        for (int i = 0; i < validatorConfigs.length; i++) {
            JSONObject c = validatorConfigs[i];
            result = getValidatorByNameOfConfig(validatorName, c, commonValidatorsParamsConfig);
            if (result != null) {
                break;
            }
        }
        return result;
    }

    private static ValidatorConfig getValidatorByNameOfConfig(String validatorName, JSONObject validatorConfig, JSONObject commonValidatorsParamsConfig) throws Exception {
        ValidatorConfig result = null;
        JSONArray validators = validatorConfig.getJSONArray(VALIDATORS_ROOT);
        for (int i = 0; i < validators.length(); i++) {
            JSONObject validator = validators.getJSONObject(i);
            String name = validator.getString(VALIDATOR_NAME);
            if (name.equals(validatorName)) {
                String className = validator.getString(VALIDATOR_CLASS_NAME);
                // VALIDATOR_SINGLETON is not required
                boolean isSingleton = getBooleanFormJson(validator, VALIDATOR_SINGLETON, true);
                Validator v = isSingleton ? A.getValidatorWithCache(className) : A.getValidator(className);
                // VALIDATOR_CUSTOMIZED is not required
                boolean isCustomized = getBooleanFormJson(validator, VALIDATOR_CUSTOMIZED, true);
                if(!isCustomized){
                    result = validatorParams2obj(validatorName, commonValidatorsParamsConfig);
                }
                if(result == null){
                    result = new ValidatorConfig();
                }
                result.setName(validatorName);
                result.setClassName(className);
                result.setCustomized(isCustomized);
                result.setSingleton(isSingleton);
                result.setValidator(v);
                break;
            }
        }
        return result;
    }

    private static boolean getBooleanFormJson(JSONObject jsonObject, String name, boolean defaultValue) throws Exception {
        if(jsonObject == null || StringUtils.isBlank(name))
            throw new Exception("METHOD [getBooleanFormJson] params is null");
        Boolean value = (Boolean) A.getJsonValueSafely(jsonObject, name);
        boolean result = defaultValue;
        if (value != null && !value.booleanValue()) {
            result = false;
        }
        return result;
    }

    public static boolean validate(ActionForm form, ValidationContext context, JSONObject rulesConfig, JSONObject validatorsConfig) {
        boolean result = true;
        
        try {
            JSONObject commonValidatorsConfig = A.getJsonConfigWithCacheOfClass("/conf-fzy/validators.json");
            JSONObject[] validatorConfigArray = new JSONObject[] { validatorsConfig, commonValidatorsConfig };
            
            List rules = ValidationUtils.ruleConfig2list(rulesConfig, validatorConfigArray);

            boolean isShortAtAll = false;
            for (Iterator iterator = rules.iterator(); iterator.hasNext();) {
                Object item = iterator.next();
                if(item instanceof ValidationRuleConfig){
                    ValidationRuleConfig rule = (ValidationRuleConfig) item;
                    Validator v = rule.getValidatorConfig().getValidator();
                    boolean pass = v.execute(form, context, rule);
                    if(!pass)
                        result = false;
                    if(!pass && isShortAtAll){
                        break;
                    }
                }
                if(item instanceof ValidationRuleGroupConfig){
                    ValidationRuleGroupConfig group = (ValidationRuleGroupConfig) item;
                    List subRules = group.getGroup();
                    boolean isShortInGroup = group.getShortcut().booleanValue();
                    boolean passGroup = true;
                    for (Iterator iterator2 = subRules.iterator(); iterator2.hasNext();) {
                        ValidationRuleConfig subRule = (ValidationRuleConfig) iterator2.next();
                        Validator v = subRule.getValidatorConfig().getValidator();
                        boolean pass = v.execute(form, context, subRule);
                        if(!pass){
                            passGroup = false;
                        }
                        if(!pass && isShortInGroup){
                            break;
                        }
                    }
                    if(!passGroup)
                        result = false;
                    if(!passGroup && isShortAtAll){
                        break;
                    }
                }
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            result = false;
        }
        
        return result;

    }

//    private static Validator getValidator(String func) throws Exception {
//        Validator v = getValidatorByName(func, "UserQuery-validation-beans.json", PersonAction.class);
//        if (v == null) {
//            v = getValidatorByName(func, "/conf/validation-beans.json");
//        }
//        return v;
//    }
//
//    private static Validator getValidatorByName(String name, String configPath, Class clazz) throws Exception {
//        JSONObject vs = A.getJsonConfigWithCache(configPath, clazz);
//        JSONArray s = (JSONArray) vs.get(VALIDATORS_ROOT);
//        if (s != null) {
//            for (int i = 0; i < s.length(); i++) {
//                JSONObject item = (JSONObject) s.get(i);
//                String n = (String) item.get(VALIDATOR_NAME);
//                if (name.equals(n)) {
//                    String clazzName = (String) item.get(VALIDATOR_CLASS_NAME);
//                    return (Validator) Class.forName(clazzName).newInstance();
//                }
//            }
//        }
//        return null;
//    }
//
//    private static Validator getValidatorByName(String name, String configPath) throws Exception {
//        JSONObject vs = A.getJsonConfigWithCacheOfClass(configPath);
//        JSONArray s = (JSONArray) vs.get(VALIDATORS_ROOT);
//        if (s != null) {
//            for (int i = 0; i < s.length(); i++) {
//                JSONObject item = (JSONObject) s.get(i);
//                String n = (String) item.get(VALIDATOR_NAME);
//                if (name.equals(n)) {
//                    String clazz = (String) item.get(VALIDATOR_CLASS_NAME);
//                    return (Validator) Class.forName(clazz).newInstance();
//                }
//            }
//        }
//        return null;
//    }

}
