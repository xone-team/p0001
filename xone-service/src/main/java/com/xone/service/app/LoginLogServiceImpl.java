package com.xone.service.app;

import java.text.ParseException;
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

import com.xone.model.hibernate.app.LoginLogDao;
import com.xone.model.hibernate.entity.LoginLog;
import com.xone.model.hibernate.support.Pagination;

public class LoginLogServiceImpl implements LoginLogService {
	private static final Log log = LogFactory.getLog(LoginLogServiceImpl.class);

	@Autowired
	protected LoginLogDao loginLogDao;

	@Override
	public LoginLog save(LoginLog entity) {
		return getLoginLogDao().save(entity);
	}
	
	@Override
	public LoginLog update(LoginLog entity) {
		return getLoginLogDao().update(entity);
	}
	
	@Override
	public void delete(LoginLog entity) {
		getLoginLogDao().deleteById(entity.getId());
	}

	@Override
	public LoginLog findById(Long id) {
		return getLoginLogDao().findById(id);
	}
	
	@Override
    public LoginLog findByMap(Map<String, String> params) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(LoginLog.class);
        List<LoginLog> l = getLoginLogDao().findListByDetachedCriteria(detachedCriteria, 0, 1);
        if (null == l) {
            return new LoginLog();
        }
        return l.get(0);
    }

	@Override
	public List<LoginLog> findAllByMap(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(LoginLog.class);
        detachedCriteria.addOrder(Order.desc("dateCreated"));
		return getLoginLogDao()
				.findListByDetachedCriteria(detachedCriteria, 0, 10);
	}
	
	public Pagination findByParams(Map<String, String> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(LoginLog.class);
		int pageSize = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageSize"), 20);
		int startIndex = com.xone.model.utils.MyModelUtils.parseInt(params.get("pageNo"), 0);
		return getLoginLogDao().findByDetachedCriteria(detachedCriteria, pageSize, startIndex);
	}

	public LoginLogDao getLoginLogDao() {
		return loginLogDao;
	}

	public void setLoginLogDao(LoginLogDao loginLogDao) {
		this.loginLogDao = loginLogDao;
	}
	
}
