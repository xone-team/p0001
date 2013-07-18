/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fzy.web;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.fzy.action.base.RestAction;
import com.fzy.webtools.A;
import com.fzy.webtools.StringUtils;
import com.fzy.webtools.U;

/**
 *
 * @author chandler
 */
public class RestServlet extends HttpServlet {
    private static Log log = LogFactory.getLog( RestServlet.class );
    private static final String METHOD_DELETE = "DELETE";
    private static final String METHOD_HEAD = "HEAD";
    private static final String METHOD_GET = "GET";
    private static final String METHOD_OPTIONS = "OPTIONS";
    private static final String METHOD_POST = "POST";
    private static final String METHOD_PUT = "PUT";
    private static final String METHOD_TRACE = "TRACE";

    private static final String HEADER_IFMODSINCE = "If-Modified-Since";
    private static final String HEADER_LASTMOD = "Last-Modified";
    
    private static final String METHOD_NAME = "method";
    
    private static final Class[] types = { HttpServletRequest.class, HttpServletResponse.class };
	
	private String encoding;
	
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

    public void init() throws ServletException {
    	encoding = this.getInitParameter("encoding");
		super.init();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doSomething(req, resp, METHOD_GET);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	this.doSomething(req, resp, METHOD_POST);
    }
    
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doSomething(req, resp, METHOD_PUT);
	}

	protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doSomething(req, resp, METHOD_DELETE);
	}

	private void doSomething(HttpServletRequest req, HttpServletResponse resp, String method) throws ServletException, IOException{
		if (encoding != null && req.getCharacterEncoding() == null) {
			req.setCharacterEncoding(encoding);
			resp.setCharacterEncoding(encoding);
		}
        
        // get path info
        String pathInfo = req.getPathInfo();
        boolean isPathInfoEmpty = true;
        if (pathInfo != null) {
            pathInfo = myReplaceAll(pathInfo, "/+", "/");
            // delete the last '/'
            if (!pathInfo.equals("/") && pathInfo.lastIndexOf("/") == (pathInfo.length() - 1)) {
                pathInfo = pathInfo.substring(0, pathInfo.length() - 1);
            }
            isPathInfoEmpty = pathInfo == null || StringUtils.isBlank(pathInfo) || pathInfo.equals("/");
        }
        String actionName = A.getActionSafelyFromMapping(pathInfo);
        if (isPathInfoEmpty || actionName == null) {
            resp.sendError(400, "Bad Request");
            return;
        }

        // get action
        boolean isActionAvailable = true;
        Object action = null;
        if (actionName == null || actionName.trim().length() == 0) {
            isActionAvailable = false;
        } else {
            actionName = actionName.trim();
            action = loadAction(actionName);
        }
        if (!isActionAvailable && action == null) {
            resp.sendError(500, "Bad action name in mappings");
            return;
        }

        //
        RestAction ha = (RestAction) action;
        Object result = null;
        
        String methodNameAvalible = A.getStringSafelyFromApplication("methodName");
        if(methodNameAvalible == null){
            methodNameAvalible = METHOD_NAME;
        }
        String methodAvalible = req.getParameter(methodNameAvalible);
        try {
            Method m = null;
            if(methodAvalible != null){
                methodAvalible = methodAvalible.trim();
                m = ha.getClass().getMethod(methodAvalible, types);
            }
            if(m != null){
                result = m.invoke(ha, new Object[]{req, resp});
            }else{
                result = ha.execute(req, resp); 
            }
        } catch (Exception e) {
            log.error(e);
        }
        if(METHOD_POST.equals(method)){
          resp.setCharacterEncoding(encoding);
        }
        
        String jsonBody = serialize(result);
        String callbackFunctionName = req.getParameter("_callback");
        if(StringUtils.isBlank(callbackFunctionName))
        	callbackFunctionName = "_FZY_Callback";
       
        jsonBody = callbackFunctionName + "("+ jsonBody +");";
        
//        String scriptTag = req.getParameter("_scripttag");
//        if("1".equals(scriptTag))
//        	jsonBody = "<script type=\"text/javascript\">"+jsonBody+"</script>";
        
        resp.getWriter().write(jsonBody);
    }

    private String serialize(Object obj) {
        String result = "";
        if (obj == null) {
            return result;
        }
        if(obj instanceof List){
        	obj = ((List)obj).toArray();
        }
        if (obj.getClass().isArray()) {
            try {
				JSONArray ja = new JSONArray(obj);
				result = ja.toString();
			} catch (JSONException e) {
				log.error(e);
			}
        } else {
            JSONObject jo = new JSONObject(obj);
            result = jo.toString();
        }

        return result;
    }

    private Object loadAction(String actionName) {
        Object result = null;
        try {
            Class actionClass = A.getClassLoader().loadClass(actionName);
            if (actionClass != null) {
                result = actionClass.newInstance();
            }
        } catch (Exception e) {
            log.error(e);
        } 
        return result;
    }

    private String myReplaceAll(String source, String regex, String replacement) {
        if (source == null) {
            return null;
        }
        Pattern.compile(regex).matcher(source).replaceAll(replacement);
        return source;
    }

}
