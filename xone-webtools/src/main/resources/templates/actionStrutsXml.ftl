<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE struts PUBLIC 
    "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
    "http://struts.apache.org/dtds/struts-2.0.dtd">
<struts>
	<package name="${packageName}" namespace="/${packageName}" extends="default">
	    <global-results>
            <result name="error">/WEB-INF/jsp/login-error.jsp</result>  
        </global-results>
		<action name="${tableVarName}List" class="${tableVarName}WebAction" method="${tableVarName}List">
			<result name="success">/WEB-INF/jsp/${jspName}-list.jsp</result>
		</action>
		<action name="${tableVarName}Create" class="${tableVarName}WebAction" method="${tableVarName}Create">
			<result name="success">/WEB-INF/jsp/${jspName}-create.jsp</result>
		</action>
		<action name="${tableVarName}Save" class="${tableVarName}WebAction" method="${tableVarName}Save">
			<result name="success">/WEB-INF/jsp/${jspName}-item.jsp</result>
		</action>
		<action name="${tableVarName}Edit" class="${tableVarName}WebAction" method="${tableVarName}Edit">
			<result name="success">/WEB-INF/jsp/${jspName}-edit.jsp</result>
		</action>
		<action name="${tableVarName}Update" class="${tableVarName}WebAction" method="${tableVarName}Update">
			<result name="success">/WEB-INF/jsp/${jspName}-item.jsp</result>
			<result name="list" type="chain">
			    <param name="actionName">${tableVarName}List</param> 
    			<param name="namespace">/${packageName}</param>
			</result>
		</action>
		<action name="${tableVarName}Item" class="${tableVarName}WebAction" method="${tableVarName}Item">
			<result name="success">/WEB-INF/jsp/${jspName}-item.jsp</result>
		</action>
	</package>
</struts>
