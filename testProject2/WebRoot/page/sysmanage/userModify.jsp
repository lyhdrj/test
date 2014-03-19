<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>用户管理</title>
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
	function noPermission(){
		document.getElementById("departmentName").value="";
		document.getElementById("userBean.managementCode").value="<s:property value="#request.user"/>";
	}
	function getOrgTree(){
		var str = window.showModalDialog("<%=request.getContextPath()%>/page/sysmanage/userManage!getOrgTree?userBean.comCode="+document.getElementById("userBean.comCode").value,"_blank","dialogWidth=200PX;dialogHeight=350px;scroll:auto;center:yes;status:no");
			if(str != null){
				if(str[0]!= null && str[0].length>0){
					document.getElementById("departmentName").value=str[0];
				}
				if(str[1]!= null && str[1].length>0){
					document.getElementById("userBean.managementCode").value=str[1];
				}
			}
			
	}
	
	function onCheck() {
		var test=document.getElementById("userBean.userName");
		var test1=document.getElementById("userBean.realName");
		var test2=document.getElementById("userBean.pinYinName");
		var test3=document.getElementById("userBean.mobilePhone");
		var test5=document.getElementById("userBean.address");
		var test6=document.getElementById("userBean.birthday");
		var test7=document.getElementById("userBean.zipcode");
		var test8=document.getElementById("userBean.email");
	    var array=new Array(test,test1,test2,test3,test5,test6);
	    
    	if(!checkSpace(test1, '真实姓名')){
    		return false;
    	}
		
	    if(!checkNull(test,'登录名称')){
			return false;
    	}
    	if(!checkNull(test1,'真实姓名')){
			return false;
    	}
    	if(!checkNull(test3,'手机号码')){
			return false;
    	}
    	if(!checkNull(test5,'联系地址')){
			return false;
    	}
    	if(!checkNull(test6,'出生日期')){
			return false;
    	}
		if(!/^[a-zA-z]{1,20}$/.test(test2.value)) {
			alert("拼音名称格式不正确，拼音名称由1-20位字母组成");
			test2.select();
			return false;
		}
	    if (test8.value!="") { 
	    	if(!/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(test8.value)) {
		    	alert("电子邮件格式不正确");
				test8.select();
		    	return false;
		    }
	    }
	    if(test7.value!="") {
	    	if(!/^\d{6}$/.test(test7.value)) {
	    		alert("邮政编码格式不正确");
				test7.select();
	    		return false;
	    	}
	    }
		if(document.forms[0].permissionRadio[1].checked&&document.getElementById("departmentName").value==""){
			alert("请设置人员维护权限");
			return false;
		}
		
		if(test.value.indexOf(" ")>-1){
		alert("登录名称不能有空格");
		return false;
	}
		
		if(test1.value.indexOf(" ")>-1){
		alert("真实姓名不能有空格");
		return false;
	}
		
		if(test2.value.indexOf(" ")>-1){
		alert("拼音名称不能有空格");
		return false;
	}
		return true; 
	}
	
	// 不让拼音名称输入中文
	function IsChar(s)
	{ 
	 var Number = "0123456789.abcdefghijklmnopqrstuvwxyz-\/ABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()_";
	 for (i = 0; i < s.length;i++)
	    {   
	        // Check that current character isn't whitespace.
	        var c = s.charAt(i);
	        if (Number.indexOf(c) == -1)
	        return false;
	    }
	 return true;
	}
function CheckPinyin(theField)
{
 
 if (!IsChar(theField.value))
  theField.value="";
  alert("该区域只能输入英文及数字，请不要输入中文！");
}

	
	</script>
	</head>
<%
	String userShow = request.getContextPath()
				+ "/page/sysmanage/userManage!getAllUserInfo?userBean.positionID=";
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：用户管理&raquo;修改用户</span>
								</div>
									
								<div id="content">
		                  		<table id="addTab">
			<tr>
				<td width="20%" valign="top"><a href="javascript:history.go(0);">刷新</a>
								<script type="text/javascript">
 tree = new dTree('tree');
 tree.add(0,-1,'用户管理');


 	<s:iterator id="userListPage" value="#request.userList">
 		<s:if test="#userListPage.status==3">
     	tree.add("<s:property value="#userListPage.code"/>","<s:property value="#userListPage.parentCode"/>","<s:property value="#userListPage.name"/>", "<%=userShow%><s:property value="#userListPage.code"/>","","");
 		</s:if>
 		<s:else>
 		 tree.add("<s:property value="#userListPage.code"/>","<s:property value="#userListPage.parentCode"/>","<s:property value="#userListPage.name"/>");
 		</s:else>
 	</s:iterator>
       document.write(tree);
</script>
</td>

			<td width="79%" valign="top">
					<s:form action="userManage!updateUserInfo" onsubmit="return onCheck();" namespace="/page/sysmanage">
							<table cellspacing=0>
						<tr>
							<td>
								职位名称
							</td>

							<td>
								<input type="text" class="textBox1" value="${userBean.positionName}" id="userBean.positionName" readonly="true" style="background-color: lightgray;"/>
								<s:hidden name="userBean.positionID" id="userBean.positionID"></s:hidden>
								<s:hidden name="userBean.comCode" id="userBean.comCode"></s:hidden>
							</td>
						</tr>
						<tr>
							<td>
								登录名称
							</td>
							<td>
									<input type="text" class="textBox1" name="userBean.userName" maxlength="10"
										onkeypress="charsShuru();" readonly="readonly"
										onblur="checkLoginName();" value="${userBean.userName}" style="background-color: lightgray;"/>
									<font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td>
								真实姓名
							</td>

							<td>
									<input type="text" class="textBox1" name='userBean.realName' maxlength="10"
										 value="${userBean.realName}"/>
										<font color="red">*</font>
							</td>

						</tr>

						<tr>
							<td>
								拼音名称
							</td>
							<td>
									<input type="text" class="textBox1" name="userBean.pinYinName" maxlength="20"
										onkeypress="charsShuru();"  value="${userBean.pinYinName}"/>
										<font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td>
								用户性别
							</td>
							<td>
								<s:select list="#{'男':'男','女':'女'}" name="userBean.sex"
										id="userBean.sex" value="%{userBean.sex}"></s:select>
							</td>
						</tr>
						<tr>
							<td>
								出生日期
							</td>
							<td>
									 <input type="text" class="textBox1" name="userBean.birthday"
										onclick="fPopCalendar(this)" readonly="readonly"
										 value="${userBean.birthday}"/>
									<font color="red">*</font></td>
						</tr>
						<tr>
							<td class="td_color">
								手机号码
							</td>
							<td>
									<input type="text" class="textBox1" name="userBean.mobilePhone" maxlength="12"
										value="${userBean.mobilePhone}" onkeypress="numAndDot(this)" onblur="CheckNum(this, '手机')" onkeyup="numberCheckNOChar(this)"/>
									<font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td class="td_color">
								电子邮件
							</td>
							<td>
									<input type="text" class="textBox1" name="userBean.email" maxlength="120"
										value="${userBean.email}"/>
							</td>
						</tr>
						<tr>
							<td class="td_color">
								邮政编码
							</td>
							<td>
									<input type="text" class="textBox1" name="userBean.zipcode" onkeypress="numAndDot(this)"
										onblur="CheckNum(this, '邮政编码')" 
										maxlength="10" value="${userBean.zipcode}"/>
							</td>
						</tr>
						<tr>
							<td class="td_color">
								联系地址
							</td>
							<td>
									<input type="text" class="textBox1" name="userBean.address" maxlength="150"
										value="${userBean.address}" onkeydown="enterkey();"/>
									<font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td class="td_color">
								登录系统权限
							</td>
							<td>
									<s:radio id="userBean.isLogin" list="#{'1':'可以登录','0':'不可以登录'}" name="userBean.isLogin"></s:radio>
								<s:hidden id="userBean.managementCode" name="userBean.managementCode" value="no"></s:hidden>
							</td>
						</tr>
						<s:if test="#request.userDepartment=='admin'">
							<s:if test="#request.managementCode=='no'">
								<tr>
									<td class="td_color">
										人员维护权限
									</td>
									<td>
										<input type="radio" name="permissionRadio" value="0"
											onclick="noPermission()" checked />
										无
										<input type="radio" name="permissionRadio" value=""
											onclick="getOrgTree()" />
										权限部门：
										<input type="text" class="textBox1" name="departmentName" value="<s:property value="#request.permissionDepartment"/>" readonly />
									</td>
								</tr>
							</s:if>
							<s:else>
								<tr>
									<td class="td_color">
										人员维护权限
									</td>
									<td>
										<input type="radio" name="permissionRadio" value="0"
											onclick="noPermission()" />
										无
										<input type="radio" name="permissionRadio" value=""
											onclick="getOrgTree()" checked />
										权限部门：
										<input type="text" class="textBox1" name="departmentName" value="<s:property value="#request.permissionDepartment"/>" readonly />
										
									</td>
								</tr>
								</s:else>
						</s:if>
						<s:elseif test="#request.userDepartment=='1'">
							<s:if test="#request.managementCode!='admin'">
							<s:if test="#request.managementCode=='no'">
									<tr>
										<td class="td_color">
											人员维护权限
										</td>
										<td>
											<input type="radio" name="permissionRadio" value="0"
												onclick="noPermission()" checked />
											无
											<input type="radio" name="permissionRadio" value=""
												onclick="getOrgTree()" />
											权限部门：
												<input type="text" name="departmentName" class="textBox1"
												value="<bean:write name="permissionDepartment"/>" readonly />
											
										</td>
									</tr>
								</s:if>
								<s:else>
									<tr>
										<td class="td_color">
											人员维护权限
										</td>
										<td>
											<input type="radio" name="permissionRadio" value="0"
												onclick="noPermission()" />
											无
											<input type="radio" name="permissionRadio" value=""
												onclick="getOrgTree()" checked />
											权限部门：
											<input type="text" name="departmentName" class="textBox1"
												value="<bean:write name="permissionDepartment"/>" readonly />
											
										</td>
									</tr>
								</s:else>
							</s:if>
						</s:elseif>
						<s:if test="#session.userlogin.rightsB==true">
							<tr>
								<td class="td_color">
									操作权限
								</td>
								<td>
									<s:radio id="userBean.rights" list="#{'A':'A类','B':'B类'}" name="userBean.rights"
										value="A"></s:radio>
									</td>
							</tr>
						</s:if>
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
		<s:if test="#request.modifyMsg=='true'">
		<script type="text/javascript">
			alert('保存信息成功！');
		</script>
	</s:if>
	<s:elseif test="#request.modifyMsg=='false'">
		<script>
			alert('保存信息失败，请与系统管理员联系！');
		</script>
	</s:elseif>
	<s:if test="#request.modifyPosition=='false'">
		<script>
			alert('用户信息修改失败，请与系统管理员联系！');
		</script>
	</s:if>
	<s:elseif test="#request.modifyPosition=='true'">
		<script>
			alert('用户信息修改成功！');
		</script>
	</s:elseif>
	
	
	<s:if test="#request.deleteUser==false">
		<script>
			alert('用户信息删除失败，请与系统管理员联系！');
		</script>
	</s:if>
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