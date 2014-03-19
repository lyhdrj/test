<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>菜单管理</title>
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
	<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/dtreemanage.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/validator.js"></script>
	<script type="text/javascript">
		function onCheck(){
    var test1 = document.getElementById("menuBean.menuName");
	var test2 = document.getElementById("menuBean.menuFunc");
	if (!checkNull(test1, '菜单名称')) {
		return false;
	}
	if (!checkNull(test2, '菜单功能')) {
		return false;
	}
	if(test1.value.indexOf(" ")>-1){
		alert("菜单名称不能有空格");
		return false;
	}
	if(test2.value.indexOf(" ")>-1){
		alert("菜单功能不能有空格");
		return false;
	}
	document.getElementById("addSubmit").disabled = "true";
	return true;
		}
	</script>
</head>
<%
	String menuShow=request.getContextPath()+"/page/sysmanage/menuManage!queryOneMenu?menuId=";
%>
	
	
<body onkeydown="KeyDown()">
		<DIV>
			<TABLE height="97%" cellSpacing=0 cellPadding=0 width="99%" border=0>
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
							<div>
								<div id="current">
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：菜单管理&raquo;菜单修改</span>
								</div>
									
								<div id="content">
		                  		<table id="addTab">
			<tr>
				<td width="15%" valign="top"><a href="javascript:history.go(0);">刷新</a>
			 <script type="text/javascript">
		 tree = new dTree('tree');
		 tree.add(0,-1,'菜单功能设置',"<%=menuShow%>0","","");
		 <s:if test="#request.menuList!=null">
		 <s:iterator id="menuList" value="#request.menuList">
		 tree.add("<s:property value="#menuList.menuID"/>","<s:property value="#menuList.parentMenuID"/>","<s:property value="#menuList.menuName"/>", "<%=menuShow%><s:property value="#menuList.menuID"/>","","");
		 </s:iterator>
		 </s:if>
		 document.write(tree);
</script>
</td>
<td width="84%" valign="top">
		<s:form action="/page/sysmanage/menuManage!updateOneMenu" method="post" onsubmit="return onCheck();">
		<table cellspacing=0>
							<tr>
								</tr>
								<tr>
									<td>
										上级菜单名称
									</td>

									<td>
							<input type="text" class="textBox1"  name="menuBean.parentMenuName" readonly="readonly" value="${menuBean.parentMenuName}" style="background-color: lightgray;"/>
							<s:hidden name="menuBean.parentMenuID" value="%{menuBean.parentMenuID}" />
									</td>
								</tr>
								<tr>
									<td>
										菜单名称
									</td>
									<td>
										<input type="text" id="menuBean.menuName" name="menuBean.menuName" maxlength="30"  value="${menuBean.menuName}" class="textbox1"/>
										<s:hidden name="menuBean.menuID" value="%{menuBean.menuID}"/><font color="red">*</font>
									</td>
								</tr>
									<s:if test = "#session.userlogin!=null">
					<s:if test = "#session.userlogin.company=='1'">
								<tr>
									<td>
										菜单功能
									</td>
									<td>
										<input type="text" class="textBox1" name="menuBean.menuFunc" id="menuBean.menuFunc" maxlength="60" value="${menuBean.menuFunc}"/>
										<font color="red">*</font>
									</td>
								</tr>
								 </s:if>
				  <s:if test = "#session.userlogin.company!='1'">
					<s:hidden name="menuBean.menuFunc"/>
				  </s:if>
	     	    </s:if>
								<tr>
									<td>
										功能链接
									</td>
									<td>
										<s:radio id="menuBean.status" name="menuBean.status" value="%{menuBean.status}" list="#{'1':'有效','0':'无效'}"/>
									</td>
								</tr>

								<tr>
									<td colspan="4" align="center">
										<input type="submit" name="addSubmit" value="修改" class="input_img"/>
									<input type="button" onclick="window.history.back();" value="返回" class="input_img"/>
									</td>
								</tr>
							</table>
						</s:form>
				</td>
			</tr>
		</table>
								</div>
							</div>
						</TD>
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