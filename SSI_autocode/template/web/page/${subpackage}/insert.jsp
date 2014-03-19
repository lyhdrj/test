<#assign className = table.className>   
<#assign classNameLower = table.classNameFirstLower> 
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<div id="dlg" class="easyui-dialog" style="width:650px;height:auto;padding:10px 20px"  
           closed="true" buttons="#dlg-buttons">  
       <div class="ftitle">添加基本信息</div>  
       <form id="fm" method="post"> 
	   <#list table.notPkColumns as column>	
	   <#assign key = column.columnNameFirstLower>
	    <#if column.isDateTimeColumn>
		 <div class="fitem">
             <label>${gg.getInputProperty(key)}:</label>
             <input class="easyui-datebox"  formatter="YYYY/MM/dd">
           </div>
		
		<#else>
		 <div class="fitem">  
               <label>${gg.getInputProperty(key)}:</label>  
               <input name="${column.columnNameLower}" class="easyui-validatebox" data-options="required:true,validType:'length[1,8]'">  
           </div>
		</#if>
	   </#list>
        </form>  
    </div>
    <div id="dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">Save</a>  
       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>  
   </div>
<script type="text/javascript">  
       var url;  
       function add(){  
            $('#dlg').dialog('open').dialog('setTitle','新增');  
           $('#fm').form('clear');  
           url = '${classNameLower}Manage!add${className}';  
           
      }  
        function edit(){  
           var row = $('#dg').datagrid('getSelections'); 
           if (row){
        	   if(row.length>1){
        		   $.messager.alert('提示','一次只能修改一条记录!','warning');
        	   }else{
        		   $('#dlg').dialog('open').dialog('setTitle','修改');  
                   $('#fm').form('load',row[0]);  
                  url = '${classNameLower}Manage!update${className}?id='+row[0].${table.pkColumn?lower_case}; 
        	   }
                
           }  
       }
        function save(){  
            $('#fm').form('submit',{  
                url: url,  
                onSubmit: function(){  
                     return $(this).form('validate');  
                },  
               success: function(result){
                    var result = eval('('+result+')');  
                    if (result.errorMsg){  
                        $.messager.show({  
                            title: 'Error',  
                            msg: result.errorMsg  
                        });  
                    } else {  
                        $('#dlg').dialog('close');      // close the dialog  
                        $('#dg').datagrid('reload');    // reload the user data  
                    }  
              }  
            });  
        } 
        
</script>