package com.xone.action.back.person;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xone.action.base.DefaultDispatchAction;
import com.xone.action.base.validation.ValidationContext;
import com.xone.action.utils.A;
import com.xone.action.utils.ReflectUtils;
import com.xone.model.hibernate.entity.Person;
import com.xone.service.app.PersonService;

public class PersonAction extends DefaultDispatchAction {
    private static final long serialVersionUID = -5998499942790505506L;
    private static Log log = LogFactory.getLog( PersonAction.class );
    protected PersonService personService;
    protected ValidationContext validationContext = new ValidationContext();
    protected PersonForm form = new PersonForm();
    protected Person person = new Person();
    protected List<Person> list = new ArrayList<Person>();
    
    public String list() {
        list = personService.findAll();
        return SUCCESS;
    }
    
    public String get() {
        Long id = person.getId();
        if(id != null)
            person = personService.findById(id);
        return SUCCESS;
    }
    
    public String create() {
        String p = A.class.getResource("").getPath();
        System.out.println("1:" + p);
        p = A.class.getResource("/").getPath();
        System.out.println("2:" + p);
        p = A.getClassLoader().getResource("").getPath();
        System.out.println("3:" + p);
//        PersonAction.class.getResource("Person-conditions.json").getPath();
        System.out.println(A.getFileRealPath(getClass()));
        
        
//        JSONObject personRulesConfig = A.getJsonConfigWithCacheOfWeb("/assets/data/action/person/Person-validation-rules.json");
//        JSONObject personValidatorsConfig = A.getJsonConfigWithCache("Person-validators.json", PersonAction.class);
//        try {
//            boolean pass = ValidationUtils.validate(form, validationContext, personRulesConfig, personValidatorsConfig);
//            System.out.println(pass);
//            if(validationContext.hasError()){
//                log.info("field errors:");
//                for (Iterator iterator = validationContext.getFieldErrors().iterator(); iterator.hasNext();) {
//                    NameValuePair fieldError = (NameValuePair) iterator.next();
//                    log.info("error field :" + fieldError.getName());
//                    log.info("error text :" + fieldError.getValue());
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
        // personService.save(person);
        return SUCCESS;
    }
    
    public String save() {
        Long id = person.getId();
        Person p = null;
        if(id != null)
            personService.findById(id);
        if(p == null){
            p = new Person();
        }
        ReflectUtils.copyPropertiesSafely(p, person);
        personService.saveOrUpdate(p);
        return SUCCESS;
    }
    
    public String deleted() {
        Long id = person.getId();
        personService.deleteById(id);
        return SUCCESS;
    }
    
    public Person getPerson() {
        return person;
    }
    public List<Person> getList() {
        return list;
    }
    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }
    public PersonForm getForm() {
        return form;
    }
    public ValidationContext getValidationContext() {
        return validationContext;
    }
    
    
}
