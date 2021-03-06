<#list tableInfoList as tableInfo>

create table `${tableInfo.name}`(
    <#list tableInfo.columnInfoList as columnInfo>
    `${columnInfo.name}` ${columnInfo.type}<#if columnInfo.defaultValue??> default <#if columnInfo.defaultValue!="CURRENT_TIMESTAMP">'</#if>${columnInfo.defaultValue}<#if columnInfo.defaultValue!="CURRENT_TIMESTAMP">'</#if></#if><#if (columnInfo.notNull?string('true','false'))=="true"> not</#if> null<#if (columnInfo.unique?string('true','false'))=="true"> unique</#if><#if (columnInfo.autoCreate?string('true','false'))=="true"> auto_increment</#if> comment '${columnInfo.comment}'<#if (columnInfo.pk?string('true','false'))=="true"> primary key</#if><#if columnInfo_index != tableInfo.columnInfoList?size-1>, </#if>
    </#list>
) comment '${tableInfo.comment}' ENGINE=${tableInfo.engine} charset=${tableInfo.charSet};
</#list>