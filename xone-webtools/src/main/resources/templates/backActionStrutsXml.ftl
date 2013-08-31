<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE struts PUBLIC 
    "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
    "http://struts.apache.org/dtds/struts-2.0.dtd">
<struts>
	<package name="${packageName}" namespace="/${packageName}" extends="default">
	    <global-results>
            <result name="error">/WEB-INF/jsp/login-error.jsp</result>  
        </global-results>
		<action name="${tableVarName}List" class="${tableVarName}BackAction" method="${tableVarName}List">
			<result name="success">/WEB-INF/jsp/${jspName}-back-list.jsp</result>
		</action>
		<action name="${tableVarName}Create" class="${tableVarName}BackAction" method="${tableVarName}Create">
			<result name="success">/WEB-INF/jsp/${jspName}-back-create.jsp</result>
		</action>
		<action name="${tableVarName}Save" class="${tableVarName}BackAction" method="${tableVarName}Save">
			<result name="success">/WEB-INF/jsp/${jspName}-back-item.jsp</result>
		</action>
		<action name="${tableVarName}Edit" class="${tableVarName}BackAction" method="${tableVarName}Edit">
			<result name="success">/WEB-INF/jsp/${jspName}-back-edit.jsp</result>
		</action>
		<action name="${tableVarName}Update" class="${tableVarName}BackAction" method="${tableVarName}Update">
			<result name="success">/WEB-INF/jsp/${jspName}-back-item.jsp</result>
			<result name="list" type="chain">
			    <param name="actionName">${tableVarName}List</param> 
    			<param name="namespace">/${packageName}</param>
			</result>
		</action>
		<action name="${tableVarName}Item" class="${tableVarName}BackAction" method="${tableVarName}Item">
			<result name="success">/WEB-INF/jsp/${jspName}-back-item.jsp</result>
		</action>
	</package>
</struts>
