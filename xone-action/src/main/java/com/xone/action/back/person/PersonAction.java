package com.xone.action.back.person;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;

import com.xone.action.base.DefaultDispatchAction;
import com.xone.action.base.query.ConditionUtils;
import com.xone.action.base.validation.ValidationContext;
import com.xone.action.base.validation.ValidationUtils;
import com.xone.action.utils.A;
import com.xone.action.utils.ReflectUtils;
import com.xone.model.hibernate.entity.Person;
import com.xone.service.app.PersonService;

public class PersonAction extends DefaultDispatchAction {
    private static final long serialVersionUID = -5998499942790505506L;
    private static Log log = LogFactory.getLog(PersonAction.class);
    protected PersonService personService;
    protected ValidationContext validationContext = new ValidationContext();
    protected PersonForm f = new PersonForm();
    protected PersonQuery q = new PersonQuery();
    protected Person o = new Person();
    protected List<Person> list = new ArrayList<Person>();

    public String list() {
        List queryConditions = new ArrayList();
        List queryParamValueList = new ArrayList();
        JSONObject conditionConfig = A.getJsonConfigWithCache("Person-conditions.json", PersonAction.class);
        ConditionUtils.fillConditions(queryConditions, queryParamValueList, conditionConfig, q);

        String queryConditionsSql = ConditionUtils.getConditionSql(queryConditions, conditionConfig);

        String sql = "";
        sql += "from Person where 1=1 ";
        sql += queryConditionsSql;

        list = personService.findHql(sql, queryParamValueList);

        return SUCCESS;
    }

    public String get() {
        Long id = new Long(f.getId());
        if (id != null)
            o = personService.findById(id);
        return SUCCESS;
    }

    public String create() {
        // JSONObject personRulesConfig =
        // A.getJsonConfigWithCacheOfWeb("/assets/data/action/person/Person-validation-rules.json");
        // JSONObject personValidatorsConfig =
        // A.getJsonConfigWithCache("Person-validators.json",
        // PersonAction.class);
        // boolean pass = ValidationUtils.validate(f, validationContext,
        // personRulesConfig, personValidatorsConfig);
        // if (!pass) {
        // return SUCCESS;
        // }
        
        ReflectUtils.copyPropertiesSafely(o, f);
        personService.save(o);

        return SUCCESS;
    }

    public String save() {
        // JSONObject personRulesConfig =
        // A.getJsonConfigWithCacheOfWeb("/assets/data/action/person/Person-validation-rules.json");
        // JSONObject personValidatorsConfig =
        // A.getJsonConfigWithCache("Person-validators.json",
        // PersonAction.class);
        // boolean pass = ValidationUtils.validate(f, validationContext,
        // personRulesConfig, personValidatorsConfig);
        // if(!pass){
        // return SUCCESS;
        // }

        Long id = new Long(f.getId());
        if (id != null)
            o = personService.findById(id);
        if (o == null) {
            o = new Person();
        }
        ReflectUtils.copyPropertiesSafely(o, f);
        personService.saveOrUpdate(o);
        return SUCCESS;
    }

    public String deleted() {
        Long id = new Long(f.getId());
        personService.deleteById(id);
        return SUCCESS;
    }

    public Person getO() {
        return o;
    }

    public List<Person> getList() {
        return list;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public PersonForm getF() {
        return f;
    }

    public ValidationContext getValidationContext() {
        return validationContext;
    }

    public PersonQuery getQ() {
        return q;
    }

}
