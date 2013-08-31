package com.xone.service.app;

import java.text.ParseException;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.xone.model.hibernate.app.PersonDao;
import com.xone.model.hibernate.app.RolesDao;
import com.xone.model.hibernate.app.UserRolesDao;
import com.xone.model.hibernate.entity.Person;
import com.xone.model.hibernate.entity.Roles;
import com.xone.model.hibernate.entity.UserRoles;
import com.xone.model.hibernate.support.Pagination;
import com.xone.service.app.utils.EncryptRef;

public class PersonServiceImpl implements PersonService {
    private static final Log log = LogFactory.getLog(PersonServiceImpl.class);

    @Autowired
    protected PersonDao personDao;
    
    @Autowired
    protected RolesDao rolesDao;
    
    @Autowired
    protected UserRolesDao userRolesDao;

    @Override
    public Person save(Person entity) {
    	Date date = new Date();
    	entity.setDateApply(date);
    	entity.setFlagDeleted(Person.FlagDeleted.NORMAL.getValue());
    	if(entity.getPassword() != null){
    		entity.setPassword(EncryptRef.SHA1(entity.getPassword()));
    	}
    	
    	personDao.save(entity);
    	
    	handleRoles(entity);
    	
    	return entity;
    }
    
    private void handleRoles(Person entity){
       	addRole(entity.getId(), "MEMBER");
    	if(Person.Credit.YES.getValue().equals(entity.getCredit())){
    		addRole(entity.getId(), "MEMBER-CREDIT");
    	}
    	deleteRole(entity.getId(), "MEMBER-C");
    	deleteRole(entity.getId(), "MEMBER-B");
    	deleteRole(entity.getId(), "MEMBER-A");
    	if(Person.UserLevel.A.getValue().equals(entity.getCredit())){
    		addRole(entity.getId(), "MEMBER-A");
    	}
    	if(Person.UserLevel.B.getValue().equals(entity.getCredit())){
    		addRole(entity.getId(), "MEMBER-B");
    	}
    	if(Person.UserLevel.C.getValue().equals(entity.getCredit())){
    		addRole(entity.getId(), "MEMBER-C");
    	}
    }
    
    private void addRole(Long userId, String roleName){
    	Roles roleToAdd = rolesDao.findUniqueByProperty("name", roleName);
    	DetachedCriteria c = DetachedCriteria.forClass(UserRoles.class);
    	c.add(Restrictions.eq("userId", userId));
    	c.add(Restrictions.eq("roleId", roleToAdd.getId()));
    	List<UserRoles> memberUserRoles = userRolesDao.findListByDetachedCriteria(c, -1, -1);
    	if(memberUserRoles.size() < 1){
        	UserRoles userRoles = new UserRoles();
        	userRoles.setUserId(userId);
        	userRoles.setRoleId(roleToAdd.getId());
        	userRoles.setEnable(UserRoles.Enable.YES.getValue());
        	userRolesDao.save(userRoles);
    	}
    }
    
    private void deleteRole(Long userId, String roleName){
    	Roles roleToDelete = rolesDao.findUniqueByProperty("name", roleName);
    	DetachedCriteria c = DetachedCriteria.forClass(UserRoles.class);
    	c.add(Restrictions.eq("userId", userId));
    	c.add(Restrictions.eq("roleId", roleToDelete.getId()));
    	List<UserRoles> memberUserRoles = userRolesDao.findListByDetachedCriteria(c, -1, -1);
    	if(memberUserRoles.size() > 0){
    		for (Iterator iterator = memberUserRoles.iterator(); iterator
					.hasNext();) {
				UserRoles userRoles = (UserRoles) iterator.next();
				userRolesDao.delete(userRoles);
			}
    	}
    }

    @Override
    public Person update(Person entity) {
        if(entity.getRepassword() != null){
            entity.setPassword(EncryptRef.SHA1(entity.getRepassword()));
        }
        getPersonDao().update(entity);
        handleRoles(entity);
        return entity;
    }

    @Override
    public void delete(Person entity) {
        getPersonDao().deleteById(entity.getId());
    }

    @Override
    public Person findById(Long id) {
        // fix system created user bug.
        if(id == null || id < 1){
            return null;
        }
        return getPersonDao().findById(id);
    }
    
    @Override
    public List<Person> findAll() {
        return personDao.findAll();
    }

    @Override
    public List<Person> findAllByPerson(Person person) {
        if (null == person) {
            return Collections.emptyList();
        }
        return personDao.findAllByName(person.getUsername(), 0, 1);
    }
    @Override
    public Person findByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Person.class);

        handleCriteriaByParams(detachedCriteria, params);
        
        List<Person> l = getPersonDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
        if (null == l) {
            return new Person();
        }
        return l.get(0);
    }
    
    @Override
    public List<Person> findAllByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Person.class);

        handleCriteriaByParams(detachedCriteria, params);

        return getPersonDao().findListByDetachedCriteria(detachedCriteria, 0, 10);
    }

    public Pagination findByParams(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Person.class);

        handleCriteriaByParams(detachedCriteria, params);

        int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
        int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
        return getPersonDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
    }

    protected void handleCriteriaByParams(DetachedCriteria criteria, Map<String, String> params) {
        String id = params.get("id");
        if (!StringUtils.isBlank(id)) {
            criteria.add(Restrictions.eq("id", Long.parseLong(id)));
        }
        String idMin = params.get("idMin");
        if (!StringUtils.isBlank(idMin)) {
            criteria.add(Restrictions.ge("id", Long.parseLong(idMin)));
        }
        String idMax = params.get("idMax");
        if (!StringUtils.isBlank(idMax)) {
            criteria.add(Restrictions.le("id", Long.parseLong(idMax)));
        }
        String username = params.get("username");
        if (!StringUtils.isBlank(username)) {
            criteria.add(Restrictions.like("username", "%" + username + "%"));
        }
        String password = params.get("password");
        if (!StringUtils.isBlank(password)) {
            criteria.add(Restrictions.like("password", "%" + password + "%"));
        }
        String nickName = params.get("nickName");
        if (!StringUtils.isBlank(nickName)) {
            criteria.add(Restrictions.like("nickName", "%" + nickName + "%"));
        }
        String cellphone = params.get("cellphone");
        if (!StringUtils.isBlank(cellphone)) {
            criteria.add(Restrictions.like("cellphone", "%" + cellphone + "%"));
        }
        String contactor = params.get("contactor");
        if (!StringUtils.isBlank(contactor)) {
            criteria.add(Restrictions.like("contactor", "%" + contactor + "%"));
        }
        String qq = params.get("qq");
        if (!StringUtils.isBlank(qq)) {
            criteria.add(Restrictions.like("qq", "%" + qq + "%"));
        }
        String email = params.get("email");
        if (!StringUtils.isBlank(email)) {
            criteria.add(Restrictions.like("email", "%" + email + "%"));
        }
        String address = params.get("address");
        if (!StringUtils.isBlank(address)) {
            criteria.add(Restrictions.like("address", "%" + address + "%"));
        }
        String credit = params.get("credit");
        if (!StringUtils.isBlank(credit)) {
            criteria.add(Restrictions.like("credit", "%" + credit + "%"));
        }
        String userLevel = params.get("userLevel");
        if (!StringUtils.isBlank(userLevel)) {
            criteria.add(Restrictions.like("userLevel", "%" + userLevel + "%"));
        }
        String userApply = params.get("userApply");
        if (!StringUtils.isBlank(userApply)) {
            criteria.add(Restrictions.eq("userApply", Long.parseLong(userApply)));
        }
        String userApplyMin = params.get("userApplyMin");
        if (!StringUtils.isBlank(userApplyMin)) {
            criteria.add(Restrictions.ge("userApply", Long.parseLong(userApplyMin)));
        }
        String userApplyMax = params.get("userApplyMax");
        if (!StringUtils.isBlank(userApplyMax)) {
            criteria.add(Restrictions.le("userApply", Long.parseLong(userApplyMax)));
        }
        String dateApplyMin = params.get("dateApplyMin");
        if (!StringUtils.isBlank(dateApplyMin)) {
            try {
                criteria.add(Restrictions.ge("dateApply", DateUtils.parseDate(dateApplyMin, "yyyy-MM-dd")));
            } catch (ParseException e) {
                log.error("[dateApplyMin] parsed exception :", e);
            }
        }
        String dateApplyMax = params.get("dateApplyMax");
        if (!StringUtils.isBlank(dateApplyMax)) {
            try {
                criteria.add(Restrictions.lt("dateApply", DateUtils.addDays(DateUtils.parseDate(dateApplyMax, "yyyy-MM-dd"), 1)));
            } catch (ParseException e) {
                log.error("[dateApplyMax] parsed exception :", e);
            }
        }
        String userCheck = params.get("userCheck");
        if (!StringUtils.isBlank(userCheck)) {
            criteria.add(Restrictions.eq("userCheck", Long.parseLong(userCheck)));
        }
        String userCheckMin = params.get("userCheckMin");
        if (!StringUtils.isBlank(userCheckMin)) {
            criteria.add(Restrictions.ge("userCheck", Long.parseLong(userCheckMin)));
        }
        String userCheckMax = params.get("userCheckMax");
        if (!StringUtils.isBlank(userCheckMax)) {
            criteria.add(Restrictions.le("userCheck", Long.parseLong(userCheckMax)));
        }
        String dateCheckMin = params.get("dateCheckMin");
        if (!StringUtils.isBlank(dateCheckMin)) {
            try {
                criteria.add(Restrictions.ge("dateCheck", DateUtils.parseDate(dateCheckMin, "yyyy-MM-dd")));
            } catch (ParseException e) {
                log.error("[dateCheckMin] parsed exception :", e);
            }
        }
        String dateCheckMax = params.get("dateCheckMax");
        if (!StringUtils.isBlank(dateCheckMax)) {
            try {
                criteria.add(Restrictions.lt("dateCheck", DateUtils.addDays(DateUtils.parseDate(dateCheckMax, "yyyy-MM-dd"), 1)));
            } catch (ParseException e) {
                log.error("[dateCheckMax] parsed exception :", e);
            }
        }
        String flagDeleted = params.get("flagDeleted");
        if (!StringUtils.isBlank(flagDeleted)) {
            criteria.add(Restrictions.like("flagDeleted", "%" + flagDeleted + "%"));
        }
        String userCreated = params.get("userCreated");
        if (!StringUtils.isBlank(userCreated)) {
            criteria.add(Restrictions.eq("userCreated", Long.parseLong(userCreated)));
        }
        String userCreatedMin = params.get("userCreatedMin");
        if (!StringUtils.isBlank(userCreatedMin)) {
            criteria.add(Restrictions.ge("userCreated", Long.parseLong(userCreatedMin)));
        }
        String userCreatedMax = params.get("userCreatedMax");
        if (!StringUtils.isBlank(userCreatedMax)) {
            criteria.add(Restrictions.le("userCreated", Long.parseLong(userCreatedMax)));
        }
        String dateCreatedMin = params.get("dateCreatedMin");
        if (!StringUtils.isBlank(dateCreatedMin)) {
            try {
                criteria.add(Restrictions.ge("dateCreated", DateUtils.parseDate(dateCreatedMin, "yyyy-MM-dd")));
            } catch (ParseException e) {
                log.error("[dateCreatedMin] parsed exception :", e);
            }
        }
        String dateCreatedMax = params.get("dateCreatedMax");
        if (!StringUtils.isBlank(dateCreatedMax)) {
            try {
                criteria.add(Restrictions.lt("dateCreated", DateUtils.addDays(DateUtils.parseDate(dateCreatedMax, "yyyy-MM-dd"), 1)));
            } catch (ParseException e) {
                log.error("[dateCreatedMax] parsed exception :", e);
            }
        }
        String userUpdated = params.get("userUpdated");
        if (!StringUtils.isBlank(userUpdated)) {
            criteria.add(Restrictions.eq("userUpdated", Long.parseLong(userUpdated)));
        }
        String userUpdatedMin = params.get("userUpdatedMin");
        if (!StringUtils.isBlank(userUpdatedMin)) {
            criteria.add(Restrictions.ge("userUpdated", Long.parseLong(userUpdatedMin)));
        }
        String userUpdatedMax = params.get("userUpdatedMax");
        if (!StringUtils.isBlank(userUpdatedMax)) {
            criteria.add(Restrictions.le("userUpdated", Long.parseLong(userUpdatedMax)));
        }
        String lastUpdatedMin = params.get("lastUpdatedMin");
        if (!StringUtils.isBlank(lastUpdatedMin)) {
            try {
                criteria.add(Restrictions.ge("lastUpdated", DateUtils.parseDate(lastUpdatedMin, "yyyy-MM-dd")));
            } catch (ParseException e) {
                log.error("[lastUpdatedMin] parsed exception :", e);
            }
        }
        String lastUpdatedMax = params.get("lastUpdatedMax");
        if (!StringUtils.isBlank(lastUpdatedMax)) {
            try {
                criteria.add(Restrictions.lt("lastUpdated", DateUtils.addDays(DateUtils.parseDate(lastUpdatedMax, "yyyy-MM-dd"), 1)));
            } catch (ParseException e) {
                log.error("[lastUpdatedMax] parsed exception :", e);
            }
        }

        criteria.addOrder(Order.desc("dateCreated"));
    }

    public PersonDao getPersonDao() {
        return personDao;
    }

    public void setPersonDao(PersonDao personDao) {
        this.personDao = personDao;
    }

	public RolesDao getRolesDao() {
		return rolesDao;
	}

	public void setRolesDao(RolesDao rolesDao) {
		this.rolesDao = rolesDao;
	}

	public UserRolesDao getUserRolesDao() {
		return userRolesDao;
	}

	public void setUserRolesDao(UserRolesDao userRolesDao) {
		this.userRolesDao = userRolesDao;
	}
    
}
