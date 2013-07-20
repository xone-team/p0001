package com.xone.action.back.person;

import java.util.ArrayList;
import java.util.List;

import com.xone.action.base.Action;
import com.xone.model.hibernate.entity.Person;
import com.xone.service.app.PersonService;

public class PersonAction extends Action {

    private static final long serialVersionUID = -5998499942790505506L;
    protected PersonService personService;
    protected Person person = new Person();
    protected List<Person> list = new ArrayList<Person>();
    public String list() {
        list = personService.findAllByPerson(person);
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
    
}
