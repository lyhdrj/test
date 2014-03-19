<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>单位修改</title>
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
			src="<%=request.getContextPath()%>/js/dtreemanage.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/validator.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/check.js">
</script>
		<script type="text/javascript">
function onCheck() {

	var test1 = document.getElementById("companyBean.companyName");
	var test2 = document.getElementById("companyBean.companyCode");
	
	if(test1.value.indexOf(" ")>-1){
		alert("单位名称不能有空格");
		return false;
	}
	if(test2.value.indexOf(" ")>-1){
		alert("单位代码不能有空格");
		return false;
	}
	if (!checkNull(test1, '单位名称')) {
		return false;
	}
	if (!checkNull(test2, '单位代码')) {
		return false;
	}
	document.getElementById("addSubmit").disabled = "true";
	return true;
}

</script>

	</head>
	<%
		String companyShow = request.getContextPath()
				+ "/page/sysmanage/companyManage!queryCompanyInfo?companyBean.comCode=";
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：单位管理&raquo;修改单位</span>
								</div>
								<div id="content">
								<div>
								<s:if test="#hintMsg!=null">
				<font color="red"><s:property value="hintMsg" />
				</font>
			</s:if>
								</div>
								<table id="addTab" cellspacing=0> 
								<tr >
									<td width="19%" valign="top"><a href="javascript:history.go(0);">刷新</a>
										<script type="text/javascript">
tree = new dTree('tree');
<s:if test="#request.userDepartment=='admin'" >
	tree.add(0,-1,'单位管理',"<%=companyShow%>0&pageBean.currentPage=1&&pageBean.totalCount=0","","");
</s:if>
<s:if test="#request.userDepartment!='admin'" >
	tree.add(0,-1,'单位管理',"","","");
</s:if>
<s:if test="#request.userDepartment=='no'" >
	tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}" />","","","");
</s:if>
<s:if test="#request.userDepartment!='no'" >
	<s:if test="#request.userDepartment==2" >
		tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}" />","","","");
	</s:if>
	<s:else>
		<s:iterator id="companyList" value="#request.companyList" >
	     	tree.add("<s:property value="#companyList.companyCode"/>","<s:property value="#companyList.parentComCode"/>","<s:property value="#companyList.companyName"/>");
		</s:iterator>
	</s:else>
</s:if>
    document.write(tree);
</script>
				</td>
				<td width="80%" valign="top">
						
						<s:form action="companyManage!updateCompanyInfo"
						onsubmit="return onCheck();" namespace="/page/sysmanage">
						<table cellspacing="0">
							<tr>
								<td class="td_color">
									单位名称
								</td>
								<td>
									<input type="text" class="textBox1" value="${companyBean.companyName}"
										name="companyBean.companyName" maxlength="10"/>
									<s:hidden name="companyBean.companyCode"
										id="companyBean.companyCode"></s:hidden><font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									单位电话
								</td>
								<td>
									<input type="text" class="textBox1" value="${companyBean.phone}" name="companyBean.phone" maxlength="15"/>
								</td>
							</tr>
							<tr>
								<td>
									单位传真
								</td>
								<td>
									<input type="text" class="textBox1" value="${companyBean.fax}" maxlength="15"
									name="companyBean.fax"/>
								</td>
							</tr>
							<tr>
								<td>
									单位地址
								</td>
								<td>
									<input type="text" class="textBox1" value="${companyBean.address}" maxlength="40"
										name="companyBean.address"/>
								</td>
							</tr>
						
							<tr>
								<td>
								邮政编码
								</td>
								<td>
									<input type="text" class="textBox1" value="${companyBean.zipcode}" name="companyBean.zipcode"
									maxlength="16" onkeyup="numberCheckNOChar(this)" onkeypress="numAndDot(this)"/>
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
				<s:if test="#request.flag=='true'">
			<script language="javascript">
alert('修改单位信息成功！');
</script>
		</s:if>
		<s:if test="#request.flag=='false'">
			<script language="javascript">
alert('修改单位信息失败！');
</script>
		</s:if>
	</body>
</html>