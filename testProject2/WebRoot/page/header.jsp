<%@page contentType="text/html; charset=GBK" pageEncoding="GBK" import="com.nasoft.sysmanage.model.UserLoginBean" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html>
<head>
<SCRIPT language=JavaScript type=text/JavaScript>
function openHelp(){
alert("抱歉，该功能暂未开放！");
}

function logOut(){
	if(confirm("您确认退出系统吗？")){
		window.location.href="<%=request.getContextPath()%>/userLogin.jsp";
		return true;
	}else
		return false;
}
</SCRIPT>
		<link style="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/top.css">
		<script language="javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/clock.js"></script>
		<style type="text/css">
* {
	FONT-SIZE: 12px;
	COLOR: white
}

#logo {
	COLOR: white
}

#logo A {
	COLOR: white
}
</style>
	</head>		
	<body
		style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/index/bg.gif); MARGIN: 0px; BACKGROUND-REPEAT: repeat-x">
		<%
UserLoginBean bean = (UserLoginBean)session.getAttribute("userlogin");
 %>
		<div id=logo
			style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/index/logo.png); BACKGROUND-REPEAT: no-repeat">
			<div
				style="PADDING-RIGHT: 50px; BACKGROUND-POSITION: right 50%; DISPLAY: block; PADDING-LEFT: 0px; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/index/bg_banner_menu.gif); PADDING-BOTTOM: 0px; PADDING-TOP: 3px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 30px; TEXT-ALIGN: right">
				<a href="#" onclick="openHelp();"><img src="<%=request.getContextPath()%>/images/index/nav_help.gif" align="middle" border=0>帮助说明</A>
				<img src="<%=request.getContextPath()%>/images/index/menu_seprator.gif" align="middle" >
				<a href="<%=request.getContextPath()%>/page/sysmanage/userResetPwd.jsp"><img src="<%=request.getContextPath()%>/images/index/nav_resetPassword.gif" align="middle" border=0>修改密码</A>
				<img src="<%=request.getContextPath()%>/images/index/menu_seprator.gif" align="middle" >
				<a href="#" onclick="logOut();"><img src="<%=request.getContextPath()%>/images/index/001_05.gif" align="middle" border=0>安全退出</A>
			</div>
			<div style="HEIGHT: 54px;position: absolute;left:300px;top:20px;font-size: 30px;font-family: Arial, Helvetica, sans-serIf;">
              PineapplePie
<span style="font-size: 14px;">version 5.1build130114</span>
<div style="font-size: 12px;"></div>
			</div>
						<div style="HEIGHT: 54px;">
			</div>
			<div
				style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/index/bg_nav.gif); BACKGROUND-REPEAT: repeat-x; HEIGHT: 30px">
				<table cellSpacing=0 cellPadding=0 width="100%">
					<tbody>
						<tr>
							<td>
								<div>
									&nbsp;&nbsp;&nbsp;&nbsp;欢迎用户
									<SPAN id=lblDep>[<%=bean.getRealName() %>]</SPAN>登录本系统！
								</div>
							</td>
							<td align=right width="50%">
								<SPAN style="PADDING-RIGHT: 50px"><A
									href="javascript:history.go(-1);"><img
											src="<%=request.getContextPath()%>/images/index/nav_back.gif" align="middle" border=0>后退</A>
									<A href="javascript:history.go(1);"><img
											src="<%=request.getContextPath()%>/images/index/nav_forward.gif" align="middle" border=0>前进</A>
									<A href="javascript:history.go(0);"><img
											src="<%=request.getContextPath()%>/images/index/nav_changePassword.gif" align="middle"
											border=0>刷新</A> 
									<img src="<%=request.getContextPath()%>/images/index/menu_seprator.gif" align="middle">
									<SPAN id="clock"></SPAN></SPAN>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<script type=text/javascript>
	var clock = new Clock();
	clock.display(document.getElementById("clock"));
</script>
	</body>
	</html>

