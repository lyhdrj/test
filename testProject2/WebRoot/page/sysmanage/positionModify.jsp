<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>部门管理</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style1.css">
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
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/removeShotcut.js">
</script>
	<link rel="StyleSheet"
		href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/check.js">
</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/dtreemanage.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/validator.js">
</script>
	<script type="text/javascript">
function onCheck() {
	var test = document.getElementById("positionBean.positionName");
		if(!checkNull(test,'职位名称')){
			return false;
    	}
    	if(test.value.indexOf(" ")>-1){
			alert("职位名称不能有空格");
			return false;
    }
   		 if(test.value.length>10){
    		alert("职位名称不能超过10个汉字");
    		return false;
    }
	document.getElementById("addSubmit").disabled = "true";
	return true;
}
</script>
</head>
<%
	String positionShow = request.getContextPath()
			+ "/page/sysmanage/positionManage!queryOneInfo?positionBean.positionCode=";
%>
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：职位管理&raquo;修改职位</span>
								</div>
								<div id="content">
								<table id="addTab" cellspacing=0> 
								<tr >
									<td width="19%" valign="top"><a href="javascript:history.go(0);">刷新</a>
	<script type="text/javascript">
tree = new dTree('tree');
tree.add(0, -1, '职位管理');<s:iterator id="positionListPage" value="#request.positionList">
	<s:if test="#positionListPage.status==2">
     tree.add("<s:property value="positionListPage.positionCode"/>","<s:property value="#positionListPage.orgCode"/>","<s:property value="#positionListPage.positionName"/>", "<%=positionShow%><s:property value="#positionListPage.positionCode"/>","","");
	</s:if>
	<s:else>
     tree.add("<s:property value="#positionListPage.positionCode"/>","<s:property value="#positionListPage.orgCode"/>","<s:property value="#positionListPage.positionName"/>");
	</s:else>
</s:iterator>
       document.write(tree);
</script>
				</td>
				<td width="80%" valign="top">
						
						<s:form action="positionManage!updateOneInfo" method="post"
					onsubmit="return onCheck();">
						<table cellspacing="0">
							<tr>
								<td class="td_color">
									部门名称
								</td>

								<td>
									<input type="text" class="textBox1" value="${positionBean.orgName}"
										name="positionBean.OrgName" readonly="readonly" style="background-color: lightgray;"/>
								    <s:hidden name="positionBean.comCode" id="positionBean.comCode" />
								    <s:hidden name="positionBean.orgCode" id="positionBean.orgCode" />
								</td>
							</tr>
							<tr>
								<td>
									职位名称
								</td>
								<td>
									<input type="text" class="textBox1" value="${positionBean.positionName}" name="positionBean.positionName" id="positionBean.positionName" maxlength="30"/>
									<s:hidden name="positionBean.positionID"
									id="positionBean.positionID" /><font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									角色名称
								</td>
								<td>
								
									<s:select list="#request.roleList" listKey='roleID'
									listValue='roleName' name="positionBean.roleID"
									id="positionBean.roleID">
								</s:select>
								<font color="red">*</font>

								</td>
							</tr>
							<tr>
								<td>
									职位说明
								</td>
								<td>
									<input type="text" class="textBox1" value="${positionBean.memo}" maxlength="100" name="positionBean.memo"/>
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
						</TABLE>
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




							