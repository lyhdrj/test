<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>部门管理</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">


		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/removeShotcut.js">
</script>
		<link rel="StyleSheet"
			href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
		<link rel="StyleSheet"
			href="<%=request.getContextPath()%>/css/style1.css" type="text/css" />
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
<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>
	</head>
<%
		String companyShow = request.getContextPath()
				+ "/page/sysmanage/orgManage!queryOneInfo?orgBean.orgCode=";
		String companyModify = request.getContextPath()
				+ "/page/sysmanage/orgManage!modifyOneInfo?orgBean.orgCode=";
		String companyDelete = request.getContextPath()
				+ "/page/sysmanage/orgManage!deleteOneInfo?orgBean.orgCode=";
		String parentOrgCode = (String) request
				.getAttribute("orgBean.parentOrgCode");
	%>
<script type="text/javascript">
function isDelete(orgCode) {
	var flag = confirm("您确认删除该部门吗？如果删除，该部门下的职位和职位对应的角色及用户将一并删除！");
	if (flag) {
		var url = "<%=companyDelete%>" + orgCode;
		window.location.href = url;
	} else {
		return flag;
	}
}

function pageQuery(currentPage, type) {
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
				alert('请输入1到总页数的数字');
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
		}
		var url = "<%=companyShow + parentOrgCode%>";
		url += "&pageBean.currentPage="+currentPage+"&pageBean.totalCount="+<s:property value="#request.pageBean.totalCount"/>;
		window.location.href = url;
	}
function refresh(){
	window.location.reload();
}
	</script>
	
	<script type="text/javascript">  
	function add(){
		   document.getElementById('addpanel').style.display = "";    
		   }   
	
	function yincang(){
		   document.getElementById('addpanel').style.display = "none";    
		   } 
		   </script>  
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：部门管理&raquo;部门列表</span>
								</div>
								<div align="right">
								<a href="javascript:add();">显示添加菜单</a>
								<a href="javascript:yincang();">隐藏添加菜单</a>
								</div>	
								<div id="content">
		                  		<table id="addTab">


			<tr>
				<td width="25%" valign="top"><a href="javascript:history.go(0);">刷新</a>
					<script type="text/javascript">
tree = new dTree('tree');
tree.add(0, -1, '部门管理');<s:if test="#request.userDepartment=='no'">
	tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}" />","","","");
</s:if>
<s:else>
	<s:iterator id="orgList" value="#request.orgList">
	     tree.add("<s:property value="#orgList.orgCode"/>","<s:property value="#orgList.parentOrgCode"/>","<s:property value="#orgList.orgName"/>", "<%=companyShow%><s:property value="#orgList.orgCode"/>&pageBean.currentPage=1&pageBean.totalCount=0","","");
	     </s:iterator>
</s:else>
       document.write(tree);
</script>
</td>
				<td width="74%" valign="top">

					<s:if test="#request.funShow!='none'">

						<table cellspacing=0>
							<tr align="center"
													style="background: url('<%=request.getContextPath()%>/images/common/bg_th.gif'); height: 27px;">
													<th width="15%">
														序号
													</th>
													<th width="20%">
														单位名称
													</th>
													<th width="20%">
														部门名称
													</th>
													<th width="15%">
														部门代码
													</th>
													<th width="30%">
														基本操作
													</th>
												</tr>


						

							<s:if test="#request.subOrgList!=null">
								<tbody id="tab">
									<s:iterator id="subOrgList" value="#request.subOrgList">
										   <tr>
											<td>
												<center><s:property value="#subOrgList.number" /></center>
											</td>
											<td><center><%=(String) request.getAttribute("parentOrgName")%></center></td>
											<td>
												<center><s:property value="#subOrgList.orgName" /></center>
											</td>
											<td>
												<center><s:property value="#subOrgList.orgCode" /></center>
											</td>
											<td><center>
												[<a
													href="<%=companyModify%><s:property value="#subOrgList.orgCode"/>">修改</a>]
												[<a href="javascript:void(0);"
													onclick="isDelete('<s:property value="#subOrgList.orgCode"/>')">删除</a>]
											</center></td>
										</tr>
									</s:iterator>
								</tbody>
								<tr>
									<td colspan="3" style="border-right: none; text-align: left;">
														共<span id="total"><s:property value="#request.pageBean.totalCount" /></span>条数据&nbsp;
														当前为第<s:property value="%{pageBean.currentPage}" />/<s:property value="%{pageBean.totalPage}"/>页
													</td>
													<td colspan="4" style="text-align: right;">
													
															<s:if
											test="#request.pageBean.isFirstPage==true&&#request.pageBean.isLastPage==true">
											首页
											上一页
											下一页
											尾页
									</s:if>
										<s:elseif test="#request.pageBean.isFirstPage==true">
											首页
											上一页
											<a href="javascript:;"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1);">下一页</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">尾页</a>
										</s:elseif>
										<s:elseif test="#request.pageBean.isLastPage==true">
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">首页</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">上一页</a>
											下一页
											尾页
									</s:elseif>
										<s:else>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">首页</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">上一页</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1)">下一页</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">尾页</a>
										</s:else>
										转到第<input id="goCurrentPage" onkeyup="numberCheckNOChar(this)"
											onkeypress="numAndDot(this);if(event.keyCode==13){pageQuery(document.getElementById('goCurrentPage').value,100);}"
											size=5 class="textBox2"/>页
									</td>
								</tr>
							</s:if>
						</table>
						<div>
						<s:if test="#request.hintMsg!=null">
											<font color="red"><s:property value="#request.hintMsg" /></font>
						</s:if>
						</div>
						<div style="display: none;" id="addpanel">
						<s:form action="orgManage!insertOrg" method="post"
							namespace="/page/sysmanage" onsubmit="return onCheck();">
							<table cellspacing=0>
							<tr>
									<td colspan="2">
										带<font color="red">*</font>号为必填字段&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										单位名称
									</td>

									<td>
										<input type="text" class="textBox1" value="${orgBean.parentOrgName}"
											id="orgBean.parentOrgName" maxlength="60" readonly="readonly" style="background-color: lightgray;"/>
										<s:hidden name="orgBean.parentOrgCode"
											id="orgBean.parentOrgCode"></s:hidden>
										<s:hidden name="orgBean.comCode" id="orgBean.comCode"></s:hidden>
									</td>
								</tr>
								<tr>
									<td>
										部门名称
									</td>
									<td>
										<input type="text" name="orgBean.orgName" id="orgBean.orgName"
											maxlength="10" onblur="checkInfo(this);"
											onkeydown="enterkey();" class="textbox1"/>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										部门代码
									</td>
									<td>
										<input type="text" class="textBox1" name="orgBean.orgCode" id="orgBean.orgCode"
											onkeyup="numberCheckNOChar(this)" onkeydown="enterkey();"
											onblur="checkNumLength(this,'部门代码',2),checkInfo(this);"
											maxlength="2"/>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										部门说明
									</td>
									<td>
										<input type="text" class="textBox1" name="orgBean.remark" id="orgBean.remark"
											onkeydown="enterkey();" maxlength="100"/>
									</td>
								</tr>

								<tr>
									<td colspan="4" align="center">
									<input type="submit" name="addSubmit" value="添加" class="input_img"/>
									<input type="button" onclick="window.history.back();" value="返回" class="input_img"/>
									</td>
								</tr>
							</table>
						</s:form>
						</div>
						<s:if test="#request.flag==true">
							<script language="javascript">
alert('保存部门信息成功！');
</script>
						</s:if>
						<s:elseif test="#request.flag==false">
							<script language="javascript">
alert('保存部门信息失败！');
</script>
						</s:elseif>
					</s:if>
				</td>
			</tr>
		</table>
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
