<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${config.baseConfig.mapperApiPackage}.${meta.name}Mapper">

    <!-- 表名 -->
    <sql id="tableName">${meta.tableName}</sql>

    <!-- 表中所有的字段 -->
    <sql id="columns_all">
        <#list meta.fields as field>${field.columnName}<#if field_index != meta.fields?size-1>, </#if></#list>
    </sql>

    <!-- 主键in查询 -->
    <sql id="idList">
        <foreach collection="list" open="(" separator="," close=")" item="id">${r'#{id}'}</foreach>
    </sql>

    <!-- 结果集映射 -->
    <resultMap id="_${meta.name}" type="${config.baseConfig.entityPackage}.${meta.name}">
        <#list meta.fields as field>
            <#if (field.pkColumn?string('true','false'))=="true">
        <id column="${field.columnName}" property="${field.name}" />
            <#else>
        <result column="${field.columnName}" property="${field.name}" />
            </#if>
        </#list>
    </resultMap>
<#if (config.methodCreateConfig.save?string('true','false'))=="true">

    <!-- 保存单个实体 -->
    <insert id="save" useGeneratedKeys="true" keyProperty="id">
        insert <include refid="tableName"/>(
            <#list meta.fields as field>
                <if test="${field.name} ！= null">${field.columnName}<#if field_index != meta.fields?size-1>, </#if></if>
            </#list>
        )
        values (
        <#list meta.fields as field>
            <if test="${field.name} ！= null">${r'#{'}${field.name}}<#if field_index != meta.fields?size-1>, </#if></if>
        </#list>
        );
    </insert>
</#if>
<#if (config.methodCreateConfig.batchSave?string('true','false'))=="true">

    <!-- 保存多个实体 -->
    <insert id="batchSave" useGeneratedKeys="true" keyProperty="id">
        insert <include refid="tableName"/>(<include refid="columns_all"/>)
        values
        <foreach collection="list" separator="," item="entity">
            (<#list meta.fields as field>${r'#{entity.'}${field.name}}<#if field_index != meta.fields?size-1>, </#if></#list>)
        </foreach>
    </insert>
</#if>
<#if (config.methodCreateConfig.deleteById?string('true','false'))=="true">
    ${r'
    <!-- 根据id删除 -->
    <update id="deleteById">
        update <include refid="tableName"/>
        set is_del = 1, modified_stime = current_timestamp
        where id = #{id}
    </update>'}
</#if>
<#if (config.methodCreateConfig.batchDeleteByIds?string('true','false'))=="true">
    ${r'
    <!-- 批量删除: 根据主键id列表  -->
    <update id="batchDeleteByIds">
        update <include refid="tableName"/>
        set is_del = 1, modified_stime = current_timestamp
        where id in <include refid="idList"/>
    </update>'}
</#if>
<#if (config.methodCreateConfig.update?string('true','false'))=="true">
    <!-- 更新实体 -->
    <update id="update">
        update <include refid="tableName"/>
        set
            <#list meta.fields as field>
            <#if field.columnName != 'created_stime' && field.columnName != 'modified_stime'>${field.columnName} = ${r'#{'}${field.name}},</#if>
            </#list>
            modified_stime = current_timestamp
        where
            ${r'id = #{id}'}
    </update>
</#if>
<#if (config.methodCreateConfig.updateNotNull?string('true','false'))=="true">
    <!-- 更新非空属性 -->
    <update id="updateNotNull">
        update <include refid="tableName"/>
        <set>
            <#list meta.fields as field>
            <#if field.columnName != 'created_stime' && field.columnName != 'modified_stime'><if test="${field.name} != null">${field.columnName} = ${r'#{'}${field.name}}</if>,</#if>
            </#list>
            modified_stime = current_timestamp
        </set>
        where
            ${r'id = #{id}'}
    </update>
</#if>
<#if (config.methodCreateConfig.queryById?string('true','false'))=="true">

    <!-- 通过主键id 查询实体 -->
    <select id="queryById" resultMap="_${meta.name}">
        select <include refid="columns_all"/>
        from <include refid="tableName"/>
        where id = ${r'#{id}'} and is_del=0
    </select>
</#if>
<#if (config.methodCreateConfig.queryListInIds?string('true','false'))=="true">

    <!-- 通过主键id 查询实体 -->
    <select id="queryListInIds" resultMap="_${meta.name}">
        select <include refid="columns_all"/>
        from <include refid="tableName"/>
        where id in <include refid="idList"/>
        order by id desc
    </select>
</#if>
<#if (config.methodCreateConfig.queryList?string('true','false'))=="true" || (config.methodCreateConfig.queryPager?string('true','false'))=="true">

    <!-- 通过主键id 查询实体 -->
    <select id="queryList" resultMap="_${meta.name}">
        select <include refid="columns_all"/>
        from <include refid="tableName"/>
        where is_del=0
        order by id desc
    </select>
</#if>
</mapper>
