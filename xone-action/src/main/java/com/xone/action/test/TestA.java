package com.xone.action.test;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import junit.framework.TestCase;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;

import com.xone.action.back.person.PersonAction;
import com.xone.action.back.person.PersonForm;
import com.xone.action.back.person.PersonQuery;
import com.xone.action.base.entity.NameValuePair;
import com.xone.action.base.query.ConditionUtils;
import com.xone.action.base.validation.ValidationContext;
import com.xone.action.base.validation.ValidationUtils;
import com.xone.action.utils.A;

public class TestA extends TestCase {
	Log log = LogFactory.getLog(getClass());
	public void test5(){
	    String comments="所在地(reference:address.id)";
        int kuohaoIndex = comments.indexOf("(");
        if(kuohaoIndex > -1){
            comments = comments.substring(0, kuohaoIndex);
        }
        System.out.println(comments);
	}
	public void b_test4(){
	    PersonQuery q = new PersonQuery();
	    q.setEmail("vi");
        List queryConditions = new ArrayList();
        List queryParamValueList = new ArrayList();
        JSONObject conditionConfig = A.getJsonConfigWithCache("Person-conditions.json", PersonAction.class);
        ConditionUtils.fillConditions(queryConditions, queryParamValueList, conditionConfig, q);

        String queryConditionsSql = ConditionUtils.getConditionSql(queryConditions, conditionConfig);
        System.out.println(queryConditionsSql);
        for (Iterator iterator = queryParamValueList.iterator(); iterator.hasNext();) {
            String v = (String) iterator.next();
            System.out.println(v);
        }
	}
	
	public void b_test3() throws UnsupportedEncodingException{
		String value = "1234512345";
		int i = value.toString().getBytes("UTF-8").length;
		System.out.println(i);
	}
	public void b_test2(){
		System.out.println(A.getAppPath());
	}
	
	public void b_test1(){
        JSONObject personRulesConfig = A.getJsonConfigWithCacheOfWeb("/assets/data/action/person/Person-validation-rules.json");
        JSONObject personValidatorsConfig = A.getJsonConfigWithCache("Person-validators.json", PersonAction.class);
        JSONObject commonValidatorsParamsConfig = A.getJsonConfigWithCacheOfWeb("/assets/data/validators-params.json");

        PersonForm form = new PersonForm();
        form.setUsername("一二三四五一二三四五一二二三四五一二三四五");
        form.setPassword("233");

        ValidationContext context = new ValidationContext();

        try {
            boolean pass = ValidationUtils.validate(form, context, personRulesConfig, personValidatorsConfig);
            System.out.println(pass);
            if (context.hasError()) {
                System.out.println("field errors:");
                for (Iterator iterator = context.getFieldErrors().iterator(); iterator.hasNext();) {
                    NameValuePair fieldError = (NameValuePair) iterator.next();
                    System.out.println("error field :" + fieldError.getName());
                    System.out.println("error text :" + fieldError.getValue());
                }
            }        	
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
