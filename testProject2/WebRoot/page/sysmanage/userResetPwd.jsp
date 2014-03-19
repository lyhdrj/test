<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>密码重置</title>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/validator.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>
	<script type="text/javascript">
		function checkValues() {
			var _oldPwd=document.getElementById("userResetPwdVO.oldPwd");
			var _newPwd=document.getElementById("userResetPwdVO.newPwd");
			var _checkPwd=document.getElementById("userResetPwdVO.checkPwd");
			if(!(checkSame(_oldPwd,"原密码")&&checkSame(_newPwd,"新密码")&&checkSame(_checkPwd,"重新输入新密码"))) {
				return false;
			}
			if(_newPwd.value!=_checkPwd.value) {
				alert("两次输入的新密码不一致，请检查后重新输入！");
				return false;
			} else {
				return true;
			}
		}
		
		function checkSame($obj,tipMessage) {
		
			if($obj.value=="") {
				alert("“"+tipMessage+"”不能为空。");
				$obj.focus();
				$obj.select();
				return false;
			}
			if($obj.value.search(/\s+/g)!=-1) {
				alert("“"+tipMessage+"”不能包含空格、制表符、回车符、换行符等空白字符。")
				$obj.focus();
				$obj.select();
				return false;
			}
			if(!/^[a-zA-Z0-9_]+$/.test($obj.value)) {
				alert("“"+tipMessage+"”格式不正确，密码只允许由字母数字下划线组成。");
				$obj.focus();
				$obj.select();
				return false;
			}
			return true;
		}
	</script>	
	</head>
	<body onkeydown="KeyDown()" onload="timeStart()">
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
							<SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN><SPAN
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">
								修改密码
							</SPAN>
							<SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：修改密码</span>
								</div>
								<div id="content">
								<table id="addTab" cellspacing=0> 
								<tr >
									<td width="99%" valign="top">
				
							<s:form action="userResetPwd!resetPwd" onsubmit="return checkValues();" namespace="/page/sysmanage">
						<table cellspacing="0">
						<tr>
									<td colspan="2">
										带
										<font color="red">*</font>号为必填字段&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<s:if test="#request.hintMsg!=null">
											<font color="red"><s:property value="#request.hintMsg" />
											</font>
										</s:if>
									</td>
								</tr>
							<tr>
								<td>
									原密码
								</td>

								<td>
									<input type="password" class="textBox1" name="userResetPwdBean.oldPwd" id="userResetPwdVO.oldPwd" maxlength="20"/>
								    <font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									输入新密码
								</td>
								<td>
									<input type="password" class="textBox1" name="userResetPwdBean.newPwd" id="userResetPwdVO.newPwd" maxlength="20"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									重复新密码
								</td>
								<td>
									<input type="password" class="textBox1" name="userResetPwdBean.checkPwd" id="userResetPwdVO.checkPwd" maxlength="20"/>
									<font color="red">*</font>
								</td>
							</tr>
							
							
							<tr>
								<td colspan="4" align="center">
									  <input type="submit" name="addSubmit" value="保存" class="input_img"/>
									<input type="button" onclick="window.history.back();" value="返回" class="input_img"/>
								</td>
							</tr>
						</table>
					</s:form>
											
								
						</td>
						</TABLE>
		</div>
			<div style="display: none;" id="addpanel">
						<span style="font-size: 12px; color: gray;"> <label
											id="second" style="color: red;"></label> 秒后自动跳转到首页,如果浏览器不支持跳转,请
										<a href="javascript:void(0);" onclick="goTo();">点击这里</a></span>
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
		<s:if test="#request.resetFlag==true">
	<script>
		alert('密码重置成功！请重新登录系统！');
		document.getElementById('content').style.display = "none"; 
		document.getElementById('addpanel').style.display = ""; 
	var index = 5;
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
</s:if>
<s:else>
	<script>
		alert('原密码输入错误，请重新输入！');
	</script>
</s:else>
	</body>
</html>
			
