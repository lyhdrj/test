<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
<head>

	<title>用户管理</title>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
       <script type="text/javascript" src="<%=request.getContextPath()%>/js/tableCtrl.js"></script>
	
	<link rel="StyleSheet"
		href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style1.css">
	<script language="javascript"
		src="<%=request.getContextPath()%>/js/ChooseDateLine.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/validator.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/check.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/dtreemanage.js"></script>
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
<script type="text/javascript">  
	function add(){
		   document.getElementById('addpanel').style.display = "";    
		   }   
	
	function yincang(){
		   document.getElementById('addpanel').style.display = "none";    
		   } 
		   </script>  
		   <script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>

<%
	String userShow = request.getContextPath()
				+ "/page/sysmanage/userManage!getAllUserInfo?userBean.positionID=";
		String userModify = request.getContextPath()
				+ "/page/sysmanage/userManage!modifyOneInfo?userBean.userID=";
		String userResetPwd = request.getContextPath()
				+ "/page/sysmanage/userManage!resetUserPwd?userBean.userID=";
		String userPositionModify = request.getContextPath()
				+ "/page/sysmanage/userManage!modifyUserPosition?userBean.userID=";
		String userDelete = request.getContextPath()
				+ "/page/sysmanage/userManage!deleteUserInfo?userBean.userID=";
%>
	<script type="text/javascript">
	function pageQuery(currentPage,type){
		if(type == '0'){
			currentPage = 1;
		}else if(type == '-1'){
			currentPage--;
		}else if(type == '1'){
			currentPage++;
		}else if(type == '99'){
			currentPage=<s:property value="#request.pageBean.totalPage"/>;
		}else{
			if(currentPage > <s:property value="#request.pageBean.totalPage"/>||
				currentPage < 1){
				alert('请输入1~总页数的数字');
				return false;
			}
			if(currentPage.indexOf('.') > -1){
				alert('请输入有效的数字');
				return false;
			}
			if(isNaN(currentPage)){
   				alert("输入必须是数字");
   				return true;
			} 
		var url = "<%=userShow %>p"+document.getElementById("userBean.positionID").value;
		url += "&pageBean.currentPage="+currentPage+"&pageBean.totalCount="+<s:property value="#request.pageBean.totalCount"/>;
		window.location.href = url;
	}
	}
	function isDelete(userID){
			var flag = confirm("确定删除此用户！");
			if(flag){	
				var url = "<%=userDelete%>"+userID;
				window.location.href = url;
			}else{
				return flag;
			}
		}
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
			}else{
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
	    var permission = document.getElementsByName("permissionRadio");
		if(permission[1].checked&&document.getElementById("departmentName").value==""){
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
		if(test5.value.indexOf(" ")>-1){
		alert("联系地址不能有空格");
		return false;
	}
		document.getElementById("addSubmit").disabled = "true";
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
 
 
	function checkLoginName()// 提交到后台
	{
	   var loginName=document.getElementById("userBean.userName").value;
	   
		if(loginName==""||loginName==null){
			;
		}else{
			send_request("<%=request.getContextPath()%>/page/sysmanage/userManage!checkLoginName?loginName="+loginName);
		}
	   
	} 
	function setSelectObj(obj)
	{
		var returnVal=obj;
		var strArray=returnVal.split('$');
		if(strArray.length>1){//重设密码结果
		    if(strArray[0]=="true"){
		    	alert('用户初始密码设置成功！');	
		    }else{
		    	alert('用户初始密码设置失败！');
		    }
		}else{//登录名校验结果
			if(obj=="false"){
				alert('登录名称已存在，请重新输入！');	
				document.getElementById("userBean.userName").value="";		
				document.getElementById("userBean.userName").focus();
				return false;
			}
		}
		
		
	}
	
	function resetUserPwd(userId)// 提交到后台
	{
		if(userId==null||userId==""){
		}else{
			send_request("<%=request.getContextPath()%>/page/sysmanage/userManage!resetUserPwd?userBean.userID="+userId);
		}
	   
	} 
function refresh(){
	window.location.reload();
}
	</script>
<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>
<style>
.t1 td {background-color:#ffffff;}/* 交替行第一行的背景色 */
.t2 td {background-color:#DDE6EC;}/* 交替行第二行的背景色 */
.t3 td {background-color:lightblue;}/* 鼠标经过时的背景色 */
</style>
</head>

<body onkeydown="KeyDown()" onLoad="$()">
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：用户管理&raquo;用户列表</span>
								</div>
								<div align="right">
								<a href="javascript:add();">显示添加菜单</a>
								<a href="javascript:yincang();">隐藏添加菜单</a>
								</div>		
								<div id="content">
		                  		<table id="addTab">
			<tr>
				<td width="20%" valign="top"><a href="javascript:history.go(0);">刷新</a>
									<script type="text/javascript">
 tree = new dTree('tree');
 tree.add(0,-1,'用户管理');
 <s:if test="#request.userDepartment=='no'">
	tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}"/>","","","");
 </s:if>
 <s:else>
 	<s:iterator id="userListPage" value="#request.userList">
 		<s:if test="#userListPage.status==3">
     	tree.add("<s:property value="#userListPage.code"/>","<s:property value="#userListPage.parentCode"/>","<a href='<%=userShow%><s:property value="#userListPage.code"/>&pageBean.currentPage=1&pageBean.totalCount=0'><s:property value="#userListPage.name"/></a>");
 		</s:if>
 		<s:else>
 		 tree.add("<s:property value="#userListPage.code"/>","<s:property value="#userListPage.parentCode"/>","<s:property value="#userListPage.name"/>");
 		</s:else>
 	</s:iterator>
 </s:else>
       document.write(tree);      
</script>
</td>
				<td width="79%" valign="top">
				<s:if test="#request.funShow!='none'">
				
					<table cellspacing=0>
						<tr
													style="background: url('<%=request.getContextPath()%>/images/common/bg_th.gif'); height: 27px;">
													<th width="10%">
														序号
													</th>
													<th width="10%">
														职位名称
													</th>
													<th width="10%">
														登录名称
													</th>
													<th width="10%">
														真实姓名
													</th>
													<th width="10%">
														拼音名称
													</th>
													<th width="10%">
														人员维护权限
													</th>
													<s:if test="#session.userlogin.rightsB=='true'">
								                    <th width="10%">
									                    A-B类
								                    </th>
							                        </s:if>
													<th width="10%">
														基本操作
													</th>
													<th width="10%">
														职位调动
													</th>
													<th width="10%">
														密码重置
													</th>
												</tr>
						<s:if test="#request.subUserList!=null">
                        <tbody id="tab">
							<s:iterator id="subUserList" value="#request.subUserList">
								<tr>
									<td>
										<center><s:property value="#subUserList.number"/></center>
									</td>
									<td><center><s:property value="#request.positionName"/></center></td>
									<td>
										<center><s:property value="#subUserList.userName"/></center>
									</td>
									<td>
										<center><s:property value="#subUserList.realName"/></center>
									</td>
									<td>
										<center><s:property value="#subUserList.pinYinName"/></center>
									</td>
									<td>
										<center><s:property value="#subUserList.managementName"/></center>
									</td>
									<s:if test="#session.userlogin.rightsB=='true'">
										<td align="center"><center>
											<s:property value="#subUserList.rights"/></center>
										</td>
									</s:if>
									<td><center>
										[<a href="<%=userModify%><s:property value="#subUserList.userID"/>">修改</a>]
										[<a href="javascript:void(0);" onclick="isDelete(<s:property value="#subUserList.userID"/>)">删除</a>]</center>
									</td>
									<td>
										<center>[<a href="<%=userPositionModify%><s:property value="#subUserList.userID"/>">调动</a>]</center>
									</td>
									<td><center>
										<input type="button" onClick="resetUserPwd(<s:property value="#subUserList.userID"/>)" value="重置" class="input_img"></center>
									</td>
								</tr>
							</s:iterator>
							 </tbody>
							<tr>
								<td colspan=4 style="border-right: none; text-align: left;">
									共<s:property value="#request.pageBean.totalCount"/>条数据
									&nbsp;
									<s:if test="#request.pageBean.totalPage==0">
										当前为第0/<s:property value="#request.pageBean.totalPage"/>页
									</s:if>
									<s:else>当前为第<s:property value="#request.pageBean.currentPage"/>/<s:property value="#request.pageBean.totalPage"/>页
									</s:else>
									&nbsp;
									&nbsp;
									</td>
								    <td colspan="5" style="text-align: right;">
								<s:if test="#request.pageBean.isFirstPage==true&&#request.pageBean.isLastPage==true">
									首页
									上一页
									下一页
									尾页
								</s:if>
								<s:elseif test="#request.pageBean.isFirstPage==true">
									首页
									上一页
									<a href="javascript:;" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1);">下一页</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">尾页</a>
								</s:elseif>
								<s:elseif test="#request.pageBean.isLastPage==true">
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">首页</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">上一页</a>
									下一页
									尾页
								</s:elseif>
								<s:else>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">首页</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">上一页</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1)">下一页</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">尾页</a>
								</s:else>
								转到第<input id="goCurrentPage" class="textBox2" onkeyup="numberCheckNOChar(this)" onkeypress="numAndDot(this);if(event.keyCode==13){pageQuery(document.getElementById('goCurrentPage').value,100);}" size=2/>页
								</td>
							</tr>
						</s:if>
					</table>
					<div style="display: none;" id="addpanel">
					<s:form action="userManage!addUserInfo" method="post" namespace="/page/sysmanage"
						onsubmit="return onCheck();">
							<table cellspacing=0>
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
										onkeypress="charsShuru();" 
										onblur="checkLoginName();" id="userBean.userName"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									真实姓名
								</td>

								<td>
									<input type="text" class="textBox1" name='userBean.realName' maxlength="10"
										 id="userBean.realName"/>
										<font color="red">*</font>
								</td>

							</tr>

							<tr>
								<td>
									拼音名称
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.pinYinName" maxlength="20"
										onkeypress="charsShuru();"  id="userBean.pinYinName"/>
										<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									用户性别
								</td>
								<td>
								<s:select list="#{'男':'男','女':'女'}" name="userBean.sex"
										id="userBean.sex"></s:select>
								</td>
							</tr>
							<tr>
								<td>
									出生日期
								</td>
								<td>
									 <input type="text" class="textBox1" name="userBean.birthday"
										onclick="fPopCalendar(this)" readonly="readonly"
										 id="userBean.birthday"/>
									<font color="red">*</font></td>
							</tr>
							<tr>
								<td>
									手机号码
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.mobilePhone" maxlength="12"
										id="userBean.mobilePhone" onkeypress="numAndDot(this)" onblur="CheckNum(this, '手机')" onkeyup="numberCheckNOChar(this)"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td class="td_color">
									电子邮件
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.email" maxlength="120"
										id="userBean.email"/>
								</td>
							</tr>
							<tr>
								<td class="td_color">
									邮政编码
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.zipcode" onkeypress="numAndDot(this)"
										onblur="CheckNum(this, '邮政编码')" 
										maxlength="10" id="userBean.zipcode"/>
								</td>
							</tr>
							<tr>
								<td class="td_color">
									联系地址
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.address" maxlength="150"
										id="userBean.address"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td class="td_color">
									登录系统权限
								</td>
								<td>
									<s:radio id="userBean.isLogin" list="#{'1':'可以登录','0':'不可以登录'}" name="userBean.isLogin" value="1"></s:radio>
								</td>
							</tr>

							<s:if test="#request.userDepartment=='admin'">
								<tr>
									<td class="td_color">
										人员维护权限
									</td>
									<td>
									<input type="radio" name="permissionRadio" id="permissionRadio" value="0"
											onclick="noPermission()" checked />
										无
										<input type="radio" name="permissionRadio" id="permissionRadio" value="1"
											onclick="getOrgTree()" />
										权限部门：
										<input type="text" name="departmentName" class="textBox1" value="" readonly />
										<s:hidden id="userBean.managementCode" name="userBean.managementCode" value="no"></s:hidden>
									</td>
								</tr>
							</s:if>
							<s:if test="#request.userDepartment=='1'">
								<tr>
									<td class="td_color">
										人员维护权限
									</td>
									<td>
										<input type="radio" name="permissionRadio" id="permissionRadio" value="0"
											onclick="noPermission()" checked />
										无
										<input type="radio" name="permissionRadio" id="permissionRadio" value="1"
											onclick="getOrgTree()" />
										权限部门：
										<input type="text" name="departmentName" class="textBox1" value="" readonly />
										<s:hidden id="userBean.managementCode" name="userBean.managementCode" value="no"></s:hidden>
									</td>
								</tr>
							</s:if>
							<s:if test="#session.userlogin.rightsB=='true'">
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
									<input type="submit" name="addSubmit" value="添加" class="input_img"/>
									<input type="button" onclick="window.history.back();" value="返回" class="input_img"/>
								</td>
								</tr>
							</table>
						</s:form>
						</div>
						</s:if>
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
							
						
	