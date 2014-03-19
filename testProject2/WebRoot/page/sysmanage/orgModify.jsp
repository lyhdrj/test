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
			src="<%=request.getContextPath()%>/js/validator.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/check.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/dtreemanage.js">
</script>
		<script type="text/javascript">
function onCheck() {
	var test1 = document.getElementById("orgBean.orgName");
	var test2 = document.getElementById("orgBean.orgCode");
	if (!checkNull(test1, '部门名称')) {
		return false;
	}
	if (!checkNull(test2, '部门代码')) {
		return false;
	}
	if(test1.value.indexOf(" ")>-1){
		alert("部门名称不能有空格");
		return false;
	}
	document.getElementById("addSubmit").disabled = "true";
	return true;
}

function checkInfo(obj)// 提交到后台
{
	/**
	  var orgName=obj.name;
	  var inputval=obj.value;
	  var comCode=document.getElementById("orgBean.comCode").value;
	  var parentOrgCode=document.getElementById("orgBean.parentOrgCode").value;
	if(orgName=="orgBean.orgName"&&inputval!=""){
		
		send_request("<%=request.getContextPath()%>/page/sysmanage/orgManage!checkInfo?checkval="+inputval+"&type=orgname&comcode="+comCode+"&parentcode="+parentOrgCode);
	}
	if(orgName=="orgBean.orgCode"&&inputval!=""){
	
		send_request("<%=request.getContextPath()%>/page/sysmanage/orgManage!checkInfo?checkval="+inputval+"&type=orgcode&comcode="+comCode);
	}
	 */
}
function setSelectObj(obj) {
	var infoArr = obj.split('@');
	if (infoArr[1] != "true") {
		if (infoArr[0] == "orgname") {
			alert(infoArr[1]);
			document.getElementById("orgBean.orgName").value = "";
			document.getElementById("orgBean.orgName").focus();
			return false;
		}
		if (infoArr[0] == "orgcode") {
			alert(infoArr[1]);
			document.getElementById("orgBean.orgCode").value = "";
			document.getElementById("orgBean.orgCode").focus();
			return false;
		}
	}

}

function checkNumLength(obj, name, len) {
	var str = obj.value;
	if (str.length == len || str.length == 0) {

	} else {
		alert(name + '为' + len + '位数字');
		obj.value = '';
		obj.focus();
	}

}
</script>
	</head>
<%
		String orgShow = request.getContextPath()
				+ "/page/sysmanage/orgManage!queryOneInfo?orgBean.orgCode=";
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：部门管理&raquo;修改部门</span>
								</div>
								<div id="content">
								<table id="addTab" cellspacing=0> 
								<tr >
									<td width="19%" valign="top"><a href="javascript:history.go(0);">刷新</a>
					<script type="text/javascript">
tree = new dTree('tree');
tree.add(0, -1, '部门管理');<s:iterator id="orgList" value="#request.orgList">
       tree.add("<s:property value="#orgList.orgCode"/>","<s:property value="#orgList.parentOrgCode"/>","<s:property value="#orgList.orgName"/>", "<%=orgShow%><s:property value="#orgList.orgCode"/>&pageBean.currentPage=1&pageBean.totalCount=0","","");
</s:iterator>
       document.write(tree);
</script>

				</td>
				<td width="80%" valign="top">
							<s:form action="orgManage!updateOneInfo"
						onsubmit="return onCheck();" namespace="/page/sysmanage">
						<table cellspacing="0">
							<tr>
								<td class="td_color">
									单位名称
								</td>

								<td>
									<input type="text" class="textBox1" value="${orgBean.parentOrgName}"
										name="orgBean.parentOrgName" readonly="readonly" style="background-color: lightgray;"/>
									<s:hidden name="orgBean.parentOrgCode"
										id="orgBean.parentOrgCode"></s:hidden>
								</td>
							</tr>
							<tr>
								<td>
									部门名称
								</td>
								<td>
									<input type="text" class="textBox1" value="${orgBean.orgName}" name="orgBean.OrgName" maxlength="10"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									部门代码
								</td>
								<td>
									<input type="text" class="textBox1" value="${orgBean.orgCode}"
										onkeyup="value=value.replace(/[^0-9\.]/gi,'');"
										readonly="readonly" style="background-color: lightgray;" name="orgBean.OrgCode"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									部门说明
									</td>
								<td>
									<input type="text" class="textBox1" value="${orgBean.remark}" maxlength="100" name="orgBean.remark"/>
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



