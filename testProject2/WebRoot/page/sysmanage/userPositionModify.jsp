<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>用户管理</title>
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
	<link rel="StyleSheet"
		href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
	<script language="javascript"
		src="<%=request.getContextPath()%>/js/ChooseDateLine.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/validator.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/check.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/dtreemanage.js"></script>

	<script type="text/javascript">
	function getPositionTree(){
		var str = window.showModalDialog("<%=request.getContextPath()%>/page/sysmanage/userManage!queryPosition","_blank","dialogWidth=200PX;dialogHeight=350px;scroll:auto;center:yes;status:no");
			if(str != null){
				if(str[0]!= null && str[0].length>0){
					document.getElementById("newPositionName").value=str[0];
				}
				if(str[1]!= null && str[1].length>0){
					document.getElementById("userBean.positionID").value=str[1];
				}
			}
	}
	function checkNew(){
		var pid=document.getElementById('newPositionName').value;
		if(pid==''){
			alert('请选择目标职位！');
			return false;
		}
	}
	</script>

</head>
<%
	String userShow = request.getContextPath()
				+  "/page/sysmanage/userManage!getAllUserInfo?userBean.positionID=";
%>
<body>
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：用户管理&raquo;修改职位</span>
								</div>
									
								<div id="content">
		                  		<table>
			<tr>
				<td width="20%" valign="top">
								<script type="text/javascript">
 tree = new dTree('tree');
 tree.add(0,-1,'用户管理');

 	<s:iterator id="userListPage" value="#request.userList">
 		<s:if test="#userListPage.status==3">
     	tree.add("<s:property value="#userListPage.code"/>","<s:property value="#userListPage.parentCode"/>","<s:property value="#userListPage.name"/>","<%=userShow%><s:property value="#userListPage.code"/>&pageBean.currentPage=1&pageBean.totalCount=0","","");
 		</s:if>
 		<s:else>
 		 tree.add("<s:property value="#userListPage.code"/>","<s:property value="#userListPage.parentCode"/>","<s:property value="#userListPage.name"/>");
 		</s:else>
 	</s:iterator>

       document.write(tree);
</script>
</td>
				<td width="79%" valign="top">

					<s:form action="userManage!updateUserPosition" method="post" namespace="/page/sysmanage"
									onsubmit="return checkNew();">
							<table cellspacing=0>
								<tr>
									<td>
										真实姓名
									</td>

									<td>
								<input type="text" class="textBox1" name='userBean.realName' maxlength="10"
									onkeydown="enterkey();" value="${userBean.realName}" readonly="true" style="background-color: lightgray;"/>
									</td>
								</tr>
								<tr>
									<td>
										原职位名称
									</td>
									<td>
										<input type="text" class="textBox1" name="userBean.positionName" value="${userBean.positionName}" readonly="true" style="background-color: lightgray;"/>
									<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										新职位名称
									</td>
									<td>
								<input type="text" class="textBox1" name="newPositionName" id="newPositionName" readonly="true" onclick="getPositionTree()"/>
								<s:hidden name="userBean.positionID" id="userBean.positionID"></s:hidden><font color="red">*</font>
								<s:hidden name="userBean.userID" id="userBean.userID"></s:hidden>
								</td>
								</tr>
								<tr>
									<td colspan="4" align="center">
											<input type="submit" name="addSubmit" value="调动" class="input_img"/>
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
		</DIV></body>
</html>
