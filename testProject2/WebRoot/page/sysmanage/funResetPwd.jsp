
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html >
<head>


	<title>用户</title><script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
	<LINK href="<%=request.getContextPath()%>/css/style.css" type=text/css rel=stylesheet>
	<LINK href="<%=request.getContextPath()%>/css/table.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/validator.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>


	<script type="text/javascript">
	function onCheck()
	{
	var flag=true;
	var funName=document.getElementById("userResetPwdVO.funName");
	var oldPwd=document.getElementById("userResetPwdVO.oldPwd");
	var newPwd=document.getElementById("userResetPwdVO.newPwd");
	var checkPwd=document.getElementById("userResetPwdVO.checkPwd");
	 if(funName.value=='none'){
    	alert('请选择功能名称！');
    	flag=false;
    }
    if(oldPwd.value==""&&flag==true){
    	alert('原密码不能为空！');
    	oldPwd.focus();
    	flag=false;
    }
   	if(newPwd.value==""&&flag==true){
    	alert('新密码不能为空！');
    	newPwd.focus();
    	flag=false;
    }
    if(checkPwd.value==""&&flag==true){
    	alert('校验新密码不能为空！');
    	checkPwd.focus();
    	flag=false;
    }
    if(!(newPwd.value==checkPwd.value)&&flag==true){
    	alert('两次输入的新密码不一致，请重新输入！');
    	newPwd.focus();
    	flag=false;
    }
	return flag;   
	}
	


	
	</script>
	
</head>


<body onkeydown="KeyDown()" >
    <div class="head"><p>功能密码重设</p><span></span></div>
	<br/>
		
		<html:form action="/funResetPwd.do?method=resetPwd" method="post" onsubmit="return onCheck();">
			<table  border="0" width="350" align="center">
				<tr>
					<td class="td_color"> 
						名称
					</td>
				
					<td>
						<html:select  property="userResetPwdVO.funName">
							<html:option value="none">--请选择--</html:option>
							<html:options collection="funNameList" property="value" labelProperty="description"/>
						</html:select>
						
					</td>
				</tr>
				<tr>
					<td class="td_color"> 
						原密码
					</td>
				
					<td>
						<html:password property="userResetPwdVO.oldPwd" maxlength="20"/>
						
					</td>
				</tr>
				<tr>
					<td class="td_color">新密码</td>
					<td><html:password property="userResetPwdVO.newPwd" maxlength="20"/></td>
				</tr>
				<tr>
					<td class="td_color">重新输入新密码</td>
					
					<td><html:password property="userResetPwdVO.checkPwd" maxlength="20"/></td> 
					
				</tr>
				
				
				<tr>
					<td colspan="2" align="center">
						<html:submit value="重  设" styleClass="input_img"></html:submit>
					</td>
				</tr>
			</table>
			</html:form>
			
			
<logic:equal name="resetFlag" value="true">
	<script>
		alert('密码重设成功！');
	</script>
</logic:equal>
<logic:equal name="resetFlag" value="false">
	<script>
		alert('原密码输入错误，请重新输入！');
	</script>
</logic:equal>
</body>
</html:html>
