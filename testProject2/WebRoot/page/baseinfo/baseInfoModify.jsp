<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>修改基本信息</title>
        		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style1.css">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<script type="text/javascript" src="js/common/common.js"></script>
		<STYLE type="text/css">
#tablediv {
	font-size: 12px;
}

#layer{
	display: none;
	position: absolute;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 120%;
	filter: alpha(opacity =50);
	opacity: 0.5 !important;
	z-index: 100;
	background-color: #333;
}

#contents {
	display: none;
	position: absolute;
	left: 25%;
	top: 20%;
	width: 600px;
	height: 200px;
	z-index: 10;
	background: lightblue;
	z-index: 200;
}
#contents1 {
	display: none;
	position: absolute;
	left: 25%;
	top: 20%;
	width: 600px;
	height: 200px;
	z-index: 10;
	background: lightblue;
	z-index: 200;
}
</STYLE>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ChooseDateLine.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/validator.js"></script>
		<%
			String queryAction = request.getContextPath() + "/page/baseinfo/baseInfoManage!queryBaseInfo?pageBean.currentPage=1&pageBean.totalCount=0";
		%>
		<script type="text/javascript">
	function onCheck() {
	var test1 = document.getElementById("baseInfoBean.code");
	var test2 = document.getElementById("baseInfoBean.name");

	if (!checkNull(test1, '代码')) {
		return false;
	}
	if (!checkNull(test2, '名字')) {
		return false;
	}
	if(test2.value.indexOf(" ")>-1){
		alert("名字不能有空格！请修改！");
		return false;
	}
	document.getElementById("addSubmit").disabled = "true";
	return true;
}
			
			function jumpQuery(){
				window.location.href = "<%=queryAction %>";
			}
		</script>
	</head>

	<body>
		<div id="contents1"
			style="text-align: center; background-color: #374d6e;">
		</div>
		<DIV>
			<TABLE height="97%" cellSpacing=0 cellPadding=0 width="99%" border=0>
				<TR
					style="BACKGROUND-IMAGE: url(images/common/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
					height=47>
					<TD width=10>
						<SPAN
							style="FLOAT: left; BACKGROUND-IMAGE: url(images/common/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
					</TD>
					<TD>
					</TD>
					<TD
						style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(images/common/main_rc.gif)"
						width=10></TD>
				</TR>
				<TR>
					<TD style="BACKGROUND-IMAGE: url(images/common/main_ls.gif)">
						&nbsp;
					</TD>
					<TD style="BACKGROUND-COLOR: white" vAlign="middle" align="center">
						<div>
							<div id="current">
								<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：基本信息管理&raquo;修改基本信息</span>
							</div>
							<div id="content">
								<s:form action="baseInfoManage!updateBaseInfo" method="post" onsubmit="return onCheck();">
				<s:if test="#request.hintMsg!=null">
						<font color="red"><s:property value="#request.hintMsg"/></font>
				</s:if>
									<table cellspacing="0">
										<tr>
										<td>
												ID
											</td>
											<td style="text-align: left; padding-left: 20px;">
												<input class="textbox1"
													type="text" value="${baseInfoBean.id}" maxlength="20" name="baseInfoBean.id" style="background-color: lightgray;" readonly="readonly"/><font color="red">*</font>
											</td>
											<td>
												代码
											</td>
											<td style="text-align: left; padding-left: 20px;">
											<input class="textbox1" type="text" value="${baseInfoBean.code}" onkeypress="numAndDot(this)" maxlength="8" name="baseInfoBean.code" onkeyup="numberCheckNOChar(this)"/><font color="red">*</font>
											</td>
											
										</tr>
										<tr>
										<td>
												名字
											</td>
											<td style="text-align: left; padding-left: 20px;">
												<input class="textbox1"
													type="text" value="${baseInfoBean.name}" maxlength="20" name="baseInfoBean.name"/><font color="red">*</font>
											</td>
											<td>
												备注
											</td>
											<td style="text-align: left; padding-left: 20px;">
												<input class="textbox1"
													type="text" value="${baseInfoBean.remark}" maxlength="20" name="baseInfoBean.remark"/>
											</td>
										</tr>
										<tr>
											<td colspan="4" style="text-align: center;">
										<input type="submit" name="addSubmit" value="修改" class="input_img"/>
									<input type="button" onclick="window.history.back();" value="返回" class="input_img"/>
											</td>
										</tr>
									</table>
								</s:form>
							</div>
						</div>
					</TD>
					<TD style="BACKGROUND-IMAGE: url(images/common/main_rs.gif)"></TD>
				</TR>
				<TR
					style="BACKGROUND-IMAGE: url(images/common/main_fs.gif); BACKGROUND-REPEAT: repeat-x"
					height=10>
					<TD style="BACKGROUND-IMAGE: url(images/common/main_lf.gif)"></TD>
					<TD style="BACKGROUND-IMAGE: url(images/common/main_fs.gif)"></TD>
					<TD style="BACKGROUND-IMAGE: url(images/common/main_rf.gif)"></TD>
				</TR>
			</TABLE>
		</DIV>
	</body>
</html>