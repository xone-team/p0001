package com.fzy.webtools;

import java.lang.reflect.Field;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.fzy.core.parser.ConditionItem;
import com.fzy.core.parser.ParseException;
import com.fzy.core.parser.SearchLogic;

public class ActionUtils {

    public static Map getParameters(ServletRequest request) {
        Map params = new TreeMap();
        if (request == null)
            return params;
        Enumeration paramNames = request.getParameterNames();
        while (paramNames != null && paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();
            String[] values = request.getParameterValues(paramName);
            if (values == null || values.length == 0) {
                // Do nothing, no values found at all.
            } else if (values.length > 1) {
                params.put(paramName, values);
            } else {
                params.put(paramName, values[0]);
            }
        }
        return params;
    }

    public static Long getParamLong(HttpServletRequest request, String paramName) {
        Long result = null;
        String paramString = request.getParameter(paramName);
        if (StringUtils.isBlank(paramString))
            return result;
        result = NumberUtils.createLongSafely(paramString);
        return result;
    }

    public static Object getEntityByIdName(HttpServletRequest request,
            String idName, Class klass) {
        Object result = null;
        Long id = getParamLong(request, idName);
        if (id == null)
            return result;
        result = D.get(klass, id);
        return result;
    }

}
