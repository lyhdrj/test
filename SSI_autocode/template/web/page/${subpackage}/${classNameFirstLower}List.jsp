<#assign className = table.className>   
<#assign classNameLower = table.classNameFirstLower>

<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>  
<html>  
<head> 
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
   <meta name="keywords" content="jquery,ui,easy,easyui,web">  
   <meta name="description" content="easyui help you build your web page easily!">  
   <title>${pagetitle}</title>  
   <link rel="stylesheet" type="text/css" href="<s:url value="/easyui/themes/default/easyui.css"/>">  
    <link rel="stylesheet" type="text/css" href="<s:url value="/easyui/themes/icon.css"/>">
	<link rel="stylesheet" type="text/css" href="<s:url value="/easyui/form.css"/>">
     
   
   <script type="text/javascript" src="<s:url value="/js/jquery-1.6.4.min.js"/>"></script>  
   <script type="text/javascript" src="<s:url value="/easyui/jquery.easyui.min.js"/>"></script>  
   <script type="text/javascript" src="<s:url value="/easyui/locale/easyui-lang-zh_CN.js"/>" charset="gbk"></script>
</head>  
<body>

   <div class="easyui-panel" title="查询" style="width:auto;height:auto;padding:5px;"
			data-options="iconCls:'icon-search',collapsible:true,closable:false,collapsed:true">
             代码: 
	   <input id="codeid" name="code" style="line-height:20px;border:1px solid #ccc">  
	   名称:
	   <input id="nameid" name="name" style="line-height:20px;border:1px solid #ccc"> 
	   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a> 
	   </div>
   <div id="toolbar" style="padding:5px;width:auto;text-align:right">  
	   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">新增</a>  
       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">修改</a>  
       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="del()">删除</a>  
   </div>

   <table id="dg" title="基本信息列表" class="easyui-datagrid" style="width:auto;height:auto"  
            url="${classNameLower}Manage!query${className}"
            pagination="true" 
         rownumbers="true" fitColumns="true" singleSelect="false">  
        <thead> 
        
		   <tr>
			   <#-- columns START -->
			    <th data-options="field:'ck',checkbox:true"></th>
				<#list table.columns as column>
				 <#assign key = column.columnNameFirstLower>
				<#if column.pk>
				  <th field="${column.columnNameFirstLower}" width="30" hidden="true"></th>
				<#else>
				  <th field="${column.columnNameFirstLower}" width="30">${gg.getInputProperty(key)}</th>
				</#if> 
				</#list>
				
				<#-- columns END -->
               
           </tr>  
       </thead>  
    </table>
	


   <!--新增和修改的页面  -->
   <jsp:include page="insert.jsp"/>
     
   <script type="text/javascript">  
       //搜索
       function doSearch(){
    	 var queryParams = $('#dg').datagrid('options').queryParams;
    	 var code=  $('#codeid').val();
    	 var name=  $('#nameid').val();
    	 queryParams.code=code;
    	 queryParams.name=name;
           //$('#dg').datagrid('load',{code:code,name:name});    // reload the user data  
    	  $('#dg').datagrid('reload');
        }
      //删除
      function del(){  
           var row = $('#dg').datagrid('getSelections');  
          if (row && row.length>0){  
                 $.messager.confirm('操作确认','确定删除吗?',function(r){  
                   if (r){
                	   var delID = new Array();
                	   $.each(row,function(index,v){
                		   delID[index]=v.${table.pkColumn?lower_case};
                	   });
					    var params ={arrs:delID};
                       $.post('${classNameLower}Manage!delete${className}',jQuery.param(params,true),function(result){
                           if (result.success){  
                              $('#dg').datagrid('reload');    // reload the user data  
                          } else {  
                               $.messager.show({   // show error message  
                                  title: 'Error',  
                                  msg: result.errorMsg  
                              });  
                            }  
                       },'json');  
                   }  
               });  
            }else{
            	$.messager.alert('提示','请选择要删除的记录!','warning');
            }
       } 
      //初始化
      $(function(){
    	  //var queryParams = $('#dg').datagrid('options').queryParams;
    	  //queryparams.sortName = "id";
    	  //queryaParams.sortOrder = "asc";
			$('#dg').datagrid({queryParams:{sortName:'${table.pkColumn?lower_case}',sortOrder:'asc'},
				onSortColumn:function(sort,order){
					var queryParams = $('#dg').datagrid('options').queryParams;
					queryParams.sortName = sort;
					queryParams.sortOrder = order;
					$("#dg").datagrid('reload');
				}
			});
		});
      
      function forTips(val,row){
    	  var s='<div style="width:165px; height: 20px; overflow: hidden; text-overflow:ellipsis" title="'+val+'">';
              s+='<nobr>';
				s+=val;
			 s+=  '</nobr>';
		    s+='</div>';
		    return s;
      }
   </script>  
   
</body>  
</html>