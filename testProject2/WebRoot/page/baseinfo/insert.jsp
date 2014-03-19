<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<div id="dlg" class="easyui-dialog" style="width:650px;height:auto;padding:10px 20px"  
           closed="true" buttons="#dlg-buttons">  
       <div class="ftitle">添加基本信息</div>  
       <form id="fm" method="post">  
           <div class="fitem">  
               <label>代码:</label>  
               <input name="code" class="easyui-validatebox" data-options="required:true,validType:'length[1,8]'">  
           </div>  
           <div class="fitem">  
               <label>名字:</label>  
               <input name="name" class="easyui-validatebox" required="true" validType="letter">  
           </div>  
           <div class="fitem">  
              <label>备注:</label>  
              <input name="remark">  
           </div>
           <div class="fitem">
             <label>日期:</label>
             <input class="easyui-datebox"  formatter="YYYY/MM/dd">
           </div>
           <div class="fitem">
            <label>下拉:</label>
             <input class="easyui-combobox" data-options="
					url:'combobox_data1.json',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'
			">
           </div>
           <div class="fitem">
            <label>下拉选择:</label>
            <input class="easyui-combogrid"  data-options="
			panelWidth: 460,
			idField: 'id',
			textField: 'name',
			url: 'baseInfo!list',
			columns: [[
				{field:'id',title:'ID',width:8},
				{field:'name',title:'名字',width:30}
			]],
			fitColumns: true,pagination:true
		">
           </div>
           <div class="fitem">
            <label>下拉树</label>
            <input id="cc" class="easyui-combotree" data-options="url:'tree_data1.json'">
           </div>
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
           url = 'baseInfo!save';  
           
      }  
        function edit(){  
           var row = $('#dg').datagrid('getSelections'); 
           if (row){
        	   if(row.length>1){
        		   $.messager.alert('提示','一次只能修改一条记录!','warning');
        	   }else{
        		   $('#dlg').dialog('open').dialog('setTitle','修改');  
                   $('#fm').form('load',row[0]);  
                  url = 'baseInfo!update?id='+row[0].id; 
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