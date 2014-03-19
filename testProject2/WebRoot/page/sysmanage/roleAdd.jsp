<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>角色管理</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style1.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/common.<%=request.getContextPath()%>/js"></script>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/validator.js"></script>
	<%
			String queryAction = request.getContextPath() + "/page/sysmanage/roleManage.jsp";
		%>
	<script type="text/javascript">
		function onCheck(){
			var subFlag =true;
			var roleName = document.getElementById('roleName');
			subFlag = checkNull(roleName,"角色名称");
			if(subFlag){
				subFlag = checkSpace(roleName,"角色名称");
			}
			return subFlag; 
		} 
		
	</script>
  </head>

  
  <body onkeydown="KeyDown()">
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：角色管理&raquo;添加角色</span>
								</div>
								<div id="content">
								<div><s:if test="#request.hintMsg!=null">
   	 <font color="red"><s:property value="#request.hintMsg"/></font>
   </s:if></div>
								<table id="addTab" cellspacing=0> 
								<tr >
									
				<td width="99%">
						<s:form action="roleManage!insertRole" method="post" onsubmit="return onCheck();" namespace="/page/sysmanage">
								<table cellspacing="0" id="mytable">
								
												<tr
													style="background: url('images/common/bg_th.gif'); height: 27px;">
													
													<td>角色名称</td>
													<td>
														<input type="text" class="textBox1" name="roleBean.roleName" id="roleName" maxlength="10"/><font color="red">*</font>
													</td>
													</tr>
														<tr>
	  		<td colspan="2">
	  		<input type="submit" name="addSubmit" value="添加" class="input_img"/>
									<input type="button" onclick="window.history.back();" value="返回" class="input_img"/>
	  		</td>
	  	</tr>
	  </table>
	</s:form> 
	<s:if test="#request.flag=='true'">
   <script language="javascript">
   	alert('增加角色成功！');
   </script>
   </s:if>
   <s:elseif test="#request.flag=='false'">
   <script language="javascript">
   	alert('增加角色失败！');
   </script>
   </s:elseif>
 <script language="javascript">
	document.getElementById("roleBean.roleOrder").value="";
	document.getElementById("roleBean.roleName").value="";
 </script>
													
								
						</td>
						</TABLE>
		</div></TD>
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
