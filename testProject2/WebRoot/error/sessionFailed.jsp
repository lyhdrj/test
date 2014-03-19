<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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

		<title>提示</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<style type="text/css">
body {
	text-align: center;
}

#content {
	font-size: 15px;
}
</style>
		<script language="javascript">
	var index = 10;
	var t;
	function timeStart() {
		document.getElementById("second").innerHTML = index;
		if (index <= 1) {
			window.location.href="<%=request.getContextPath()%>/userLogin.jsp";
		}
		index--;
		t = setTimeout("timeStart()", 1000);
	}

	function goTo() {
		window.location.href="<%=request.getContextPath()%>/userLogin.jsp";
	}
</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
</head>
<body onload="timeStart()">
		<script>
	history.go(1);
</script>
		<DIV>
			<TABLE height="97%" cellSpacing=0 cellPadding=0 width="99%" border=0>
				<TBODY>
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
						<TD style="COLOR: #566984; BACKGROUND-COLOR: white;"
							vAlign="middle" align="center">
							<div id="content">
								<div style="text-align: center; height: 12px;">
									对不起，会话失效！请重新登录！
								</div>
								<hr color="lightblue" size="1" />
								<div align="center" style="height: 50px;">
									<br />
									<s:property value='#request.errorMessage'/>
									<span style="font-size: 15px; color: red;"><s:actionerror />
									</span>
									<br />
									<br />
									<span style="font-size: 12px; color: gray;"> <label
											id="second" style="color: red;"></label> 秒后自动跳转,如果浏览器不支持跳转,请
										<a href="javascript:void(0);" onclick="goTo();">点击这里</a> </span>
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
				</TBODY>
			</TABLE>
		</DIV>
	</body>
</html>