package com.fzy.action.app.person;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;

import com.fzy.action.base.DefaultRestAction;
import com.fzy.web.RestServlet;
import com.fzy.webtools.A;
import com.fzy.webtools.ActionUtils;
import com.fzy.webtools.ConditionUtils;
import com.fzy.webtools.D;
import com.xone.model.hibernate.entity.Person;

public class PersonAction extends DefaultRestAction {
    private static Log log = LogFactory.getLog(RestServlet.class);

    public Object execute(HttpServletRequest request, HttpServletResponse response) {
        Object result = null;
        List queryConditions = ConditionUtils.getConditionListFromRequest(request);
        JSONObject conditionConfig = A.getJsonConfigWithCache("Person-conditions.json", PersonAction.class);
        String queryConditionsSql = ConditionUtils.getConditionSql(queryConditions, conditionConfig);
        String[] queryParams = ConditionUtils.getConditionParamsFromRequest(request);
        
        String sql = "";
        sql += "select a.*, b.province_code from t_person a, t_address b where a.flag_status = '0' and b.flag_status = '0' and a.address_id = b.id";
        sql += queryConditionsSql;
        List resultList = D.query(sql, queryParams, new PersonListMapper());
        result = resultList;

        return result;
    }

    public Object get(HttpServletRequest request, HttpServletResponse response) {
        Object result = null;
        Long id = ActionUtils.getParamLong(request, "id");
        String sql = "";
        if (id != null) {
            result = D.get(Person.class, id);
        }
        return result;
    }

    public Object query(HttpServletRequest request, HttpServletResponse response) {
        Object result = null;

        List queryConditions = new ArrayList();
        List queryParamValueList = new ArrayList();
        JSONObject conditionConfig = A.getJsonConfigWithCache("Person-conditions.json", PersonAction.class);
        ConditionUtils.fillConditionsFromRequest(queryConditions, queryParamValueList, conditionConfig, request);

        // ActionUtils.setConditionOperator(queryConditions, "username", ActionUtils.LIKE);

        String queryConditionsSql = ConditionUtils.getConditionSql(queryConditions, conditionConfig);
        String[] queryParams = (String[]) queryParamValueList.toArray();

        String sql = "";
        sql += "select a.*, b.province_code from t_person a, t_address b where a.flag_status = '0' and b.flag_status = '0' and a.address_id = b.id";
        sql += queryConditionsSql;
        List resultList = D.query(sql, queryParams, new PersonListMapper());
        result = resultList;

        return result;
    }

    public Object save(HttpServletRequest request, HttpServletResponse response) {
        return saveOrUpdate(request);
    }

    public Object delete(HttpServletRequest request, HttpServletResponse response) {
        Person u = (Person) ActionUtils.getEntityByIdName(request, "id", Person.class);
        D.deleteEntity(u);
        return null;
    }

    private Object saveOrUpdate(HttpServletRequest request) {
        Person u = (Person) ActionUtils.getEntityByIdName(request, "id", Person.class);
        if (u == null) {
            u = new Person();
        }
        
        
//        ActionUtils.copyParameters(u, request);
//        D.saveEntity(u);
        return u;
    }

}
