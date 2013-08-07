<resultMap id="${tableVarName}ResultMap" type="com.xone.model.hibernate.entity.${tableName}">
<#list tableProperties as p>
	<#if p.autoIncrement == '1'>
	<id property="id" column="${p.columnName}" />
	<#else>
	<result property="${p.javaVarName}" column="${p.columnName}"/>
	</#if>
</#list>
</resultMap>
