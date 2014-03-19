<%@ page language="java" import="java.util.*,com.nasoft.sysmanage.model.MenuBean" pageEncoding="GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>角色管理</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style1.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<STYLE type="text/css">
#tablediv {
	font-size: 12px;
}

#content table {
	font-size: 12px;
	width: 100%;
	border-left: 1px solid #009ED2;
	border-top: 1px solid #009ED2;
}

#content table th {
	border-right: 1px solid #009ED2;
	border-bottom: 1px solid #009ED2;
}

#content table td {
	border-right: 1px solid #009ED2;
	border-bottom: 1px solid #009ED2;
	text-align: left;
}
</STYLE>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
	<%
 	String webroot=request.getContextPath();
    %>
  </head>
  <body onkeydown="KeyDown()" >
		<DIV>
			<TABLE height="95%" cellSpacing=0 cellPadding=0 width="99%" border=0>
				<TBODY>
					<TR
						style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
						height=47>
						<TD width=10>
							<SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
						</TD>
						<TD>
						</TD>
						<TD
							style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_rc.gif)"
							width=10></TD>
					</TR>
					<TR>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_ls.gif)">
							&nbsp;
						</TD>
						<TD
							style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white"
							vAlign=top align="center">
								<div id="current">
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：角色管理&raquo;设置权限</span>
								</div>
								<div id="content">
								<form action="<%=request.getContextPath()%>/page/sysmanage/roleManage!updateRoleMenu" method="post">
  <table border="0" cellspacing="0" class="small" cellpadding="3" align="center">
		<tr class="TableContent">
	<% 
		List rolePrivilList=(ArrayList)request.getAttribute("rolePrivilList");
		String menuID,parentMenuID,menuName,menuLevel,menuIDTemp="",menuType;
		int queryNum=0,columnNum=0;
		MenuBean menuBean;
		StringBuffer menuArr=new StringBuffer();
		String menuStr;
		for(int i=0;i<rolePrivilList.size();i++){
			queryNum++;
			menuBean=(MenuBean)rolePrivilList.get(i);
			menuID=menuBean.getMenuID();
			menuType=menuBean.getMenuType();
			menuName=menuBean.getMenuName();
			parentMenuID=menuBean.getParentMenuID();
			menuLevel=menuBean.getMenuLevel();
			menuArr.append("\""+menuID+"*"+parentMenuID+"\",");
	%>
		<% 
			if(menuLevel.equalsIgnoreCase("1")){
				columnNum++;
				if(queryNum==1){
		%>
				<td valign="top">
				<table class="TableBlock" align="center">
				<tr class="TableHeader" title="<%=menuName %>">
					      <td nowrap>						      
					      <input type="hidden" name="roleId"   value=<%=(String)request.getAttribute("roleID")%>>			      	
					        <input type="checkbox" name="MENU_01" id="MENU_01" onClick="rolecheck(this)" value="<%=menuID %>" <%=menuType.equalsIgnoreCase("true")?"checked":""%> >
					        <img src="<%=webroot%>/images/mytable.gif"  height="16" width="16"> <label for="MENU_01_1"><b><%=menuName %></b></label>
					      </td>
		    	 </tr>
			<% 
				}else{
				%>
			</table>
			</td>
				<td valign="top">
				<table class="TableBlock" align="center">
				<tr class="TableHeader" title="<%=menuName %>">
					      <td nowrap>
					      <%
					      	for(int m=0;m<Integer.parseInt(menuLevel)-1;m++){
					      		%>
					      		&nbsp;&nbsp;
					      		<% 
					      	}
					       %>	
					        <input type="checkbox" name="MENU_01" id="MENU_01" onClick="rolecheck(this)" value="<%=menuID %>" <%=menuType.equalsIgnoreCase("true")?"checked":""%>>
					        <img src="<%=webroot%>/images/mytable.gif" height="16" width="16">
					        
					         	<label for="MENU_01_1"><b><%=menuName %></b></label>
					        
					      </td>
		    	 </tr>
				<% 
				}
			}else{
		%>
				 <tr title="<%=menuName %>">
				  <td class="TableData" nowrap>
				  <%
					      	for(int m=0;m<Integer.parseInt(menuLevel)-1;m++){
					      		%>
					      		&nbsp;&nbsp;
					      		<% 
					      	}
					       %>	
				  <input type="checkbox" name="MENU_01" id="MENU_01" onClick="rolecheck(this)" value="<%=menuID %>"  <%=menuType.equalsIgnoreCase("true")?"checked":""%>>
				        <img src="<%=webroot%>/images/mytable.gif"  height="16" width="16"> 
				        
					         	<label for="MENU_01_1"><b><%=menuName %></b></label>
					         
				  </td >
				  </tr>
		<% 
			}
			}
			menuStr=menuArr.toString();
			menuStr=menuStr.substring(0,menuStr.length()-1);
		%>
	  		</table>
	  		</td>
	  	</tr>	
	  	<tr>
			  <td colspan="<%=columnNum %>">
			  <center>
			  <input type="submit" name="addSubmit" value="保存" class="input_img"/>
			  <input type="button" value="返回" class="input_img" onclick="window.history.go(-1)"/>
			  </center>
			  </td>
  		</tr>
	  </table>  
	 </form>
   <script language="javascript">
  var	arrayCheck=new Array(<%=menuStr%>);
  	function rolecheck(obj){
  		var menuid=obj.value;
  		if(obj.checked==true){
  			checkup(menuid);
  			checkdown(menuid);
  		}else{
  			nocheckdown(menuid);
  		}
  	}
  	//选择父菜单项
  	function checkup(menuid){
  		var menuobj=document.all.MENU_01;
  		var parentid;
  		for(var i=0;i<arrayCheck.length;i++){
  			var val=arrayCheck[i].split('*');
  			if(val[0]==menuid){
  				for(var j=0;j<menuobj.length;j++){
  					if(menuobj[j].value==val[1]){
  						menuobj[j].checked=true;
  						checkup(val[1]);
  					}
  				}
  			}
  		}  		
  	}
  	//选择子菜单项
  	function checkdown(menuid){
  		var menuobj=document.all.MENU_01;
  		var parentid;
  		for(var i=0;i<arrayCheck.length;i++){
  			var val=arrayCheck[i].split('*');
  			if(val[1]==menuid){
  				for(var j=0;j<menuobj.length;j++){
  					if(menuobj[j].value==val[0]){
  						menuobj[j].checked=true;
  						checkdown(val[0]);
  					}
  				}
  				 
  			}
  			
  		}
  	}
  	//不选择子菜单项
  	function nocheckdown(menuid){
  		var menuobj=document.all.MENU_01;
  		var parentid;
  		for(var i=0;i<arrayCheck.length;i++){
  			var val=arrayCheck[i].split('*');
  			
  			if(val[1]==menuid){
  	
  				for(var j=0;j<menuobj.length;j++){
  					if(menuobj[j].value==val[0]){
  						menuobj[j].checked=false;
  						nocheckdown(val[0]);
  					}
  				}
  				 
  			}
  			
  		}
  	}
  </script>
	
						
		</DIV></TD>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_rs.gif)"></TD>
						</TR>
					<TR
						style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_fs.gif); BACKGROUND-REPEAT: repeat-x"
						height=10>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_lf.gif)"></TD>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_fs.gif)"></TD>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_rf.gif)"></TD>
					</TR>
		</TBODY>
		</TABLE>
		</DIV>	
	</body>
</html>
  