<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD 3.0//EN" 
	"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">
<hibernate-mapping>
	<class name="com.xone.model.hibernate.entity.${tableName}" table="${dbTableName}">
<#list tableProperties as p>
	<#if p.autoIncrement == '1'>
	<id name="${p.javaVarName}" type="${p.columnClassName}">
		<column name="${p.columnName}" length="${p.columnDisplaySize}" not-null="true"/>
		<generator class="increment" />
	</id>
	<#else>
	<property name="${p.javaVarName}" type="${p.columnClassName}">
		<column name="${p.columnName}" length="${p.columnDisplaySize}"/>
	</property>
	</#if>
</#list>
	</class>
</hibernate-mapping>
