<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>职位管理</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style1.css">
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
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/removeShotcut.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>
		<link rel="StyleSheet"
			href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/check.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/dtreemanage.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/validator.js">
</script>

		<script type="text/javascript">
function onCheck() {
	var test = document.getElementById("positionBean.orgName");
	var test1 = document.getElementById("positionBean.positionName");
	var test3 = document.getElementById("positionBean.positionName");
	if(!checkNull(test1,'职位名称')){
			return false;
    	}
   	if(test1.value.indexOf(" ")>-1){
		alert("职位名称不能有空格");
		return false;
    }
    if(test1.value.length>10){
    	alert("职位名称不能超过10个汉字");
    	return false;
    }	
	if (flag == true) {
		document.getElementById("addSubmit").disabled = "true";
	}

	return flag;
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
	<%
		String positionShow = request.getContextPath()

				+ "/page/sysmanage/positionManage!queryOneInfo?positionBean.orgCode=";

		String positionModify = request.getContextPath()

				+ "/page/sysmanage/positionManage!modifyOneInfo?positionBean.positionID=";

		String positionDelete = request.getContextPath()

				+ "/page/sysmanage/positionManage!deletePosition?positionBean.positionID=";

		Integer curr = (Integer) request.getAttribute("currentPage");
		Integer totalPage = (Integer) request.getAttribute("totalPage");
	%>
	<script type="text/javascript">
function isDelete(positionID) {
	var flag = confirm("确定删除此职位！");
	if (flag) {
		var url = "<%=positionDelete%>" + positionID;
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
		}
		var url = "<%=positionShow%>"+document.getElementById("positionBean.orgCode").value;
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：职位管理&raquo;职位列表</span>
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
tree.add(0, -1, '职位管理');
<s:if test="#request.userDepartment=='no'">
	tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}" />","","","");
</s:if>
<s:else>
	<s:iterator id="positionListPage" value="#request.positionList">
 		<s:if test="#positionListPage.status==2">
     	tree.add("<s:property value="#positionListPage.positionCode"/>","<s:property value="#positionListPage.orgCode"/>","<a href='<%=positionShow%><s:property value="#positionListPage.positionCode"/>&pageBean.currentPage=1&pageBean.totalCount=0'><s:property value="#positionListPage.positionName"/></a>");
 		</s:if>
 		<s:else>
 		 tree.add("<s:property value="#positionListPage.positionCode"/>","<s:property value="#positionListPage.orgCode"/>","<s:property value="#positionListPage.positionName"/>");
 		</s:else>
 	</s:iterator>
</s:else>
       document.write(tree);
</script>
</td>
				<td width="74%" valign="top">

					<s:if test="#request.funShow!='none'">
						<table cellspacing=0>
							<tr
													style="background: url('<%=request.getContextPath()%>/images/common/bg_th.gif'); height: 27px;">
													<th width="20%">
														序号
													</th>
													<th width="25%">
														部门名称
													</th>
													<th width="25%">
														职位名称
													</th>
													<th width="30%">
														基本操作
													</th>
												</tr>
								<s:if test="#request.subPositionList!=null">

						
							<s:if test="#request.subPositionList!=null">

								<tbody id="tab">
									<s:iterator id="subPositionList"
										value="#request.subPositionList">
										<tr>
											<td>
												<center><s:property value="#subPositionList.number" /></center>
											</td>
											<td><center><%=(String) request.getAttribute("orgName")%></center></td>
											<td>
												<center><s:property value="#subPositionList.positionName" /></center>
											</td>
											<td><center>
											
												[<a
													href="<%=positionModify%><s:property value="#subPositionList.positionID"/>">修改</a>]
												[<a href="javascript:void(0);"
													onclick="isDelete('<s:property value="#subPositionList.positionID"/>')">删除</a>]</center>
											</td>
										</tr>
									</s:iterator>
								</tbody>
								<tr>
									<td colspan="2" style="border-right: none; text-align: left;">
														共<span id="total"><s:property value="#request.pageBean.totalCount" /></span>条数据&nbsp;
														当前为第<s:property value="%{pageBean.currentPage}" />/<s:property value="%{pageBean.totalPage}" />页
													</td>
													<td colspan="2" style="text-align: right;">
													
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
							</s:if>
						</table>
							<div style="display: none;" id="addpanel">
							<s:form action="positionManage!insertPosition" method="post"
							namespace="/page/sysmanage" onsubmit="return onCheck();">
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
										部门名称
									</td>

									<td>
										<input type="text" class="textBox1" value="${positionBean.orgName}"
											id="positionBean.orgName" readonly="readonly" style="background-color: lightgray;"/>
										<s:hidden name="positionBean.orgCode"
											id="positionBean.orgCode" value="%{positionBean.orgCode}"></s:hidden>
										<s:hidden name="positionBean.orgID" id="positionBean.orgID"></s:hidden>
										<s:hidden name="positionBean.comCode"
											id="positionBean.comCode"></s:hidden>
									</td>
								</tr>
								<tr>
									<td>
										职位名称
									</td>
									<td>
										<input type="text" class="textBox1" name="positionBean.positionName" id="positionBean.positionName" maxlength="30"/>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										角色名称
									</td>
									<td>
										<s:select list="#request.roleList" listKey='roleID'
											listValue="roleName" name="positionBean.roleID"
											id="positionBean.roleID">
										</s:select>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										职位说明
									</td>
									<td>
										<input type="text" class="textBox1" name="positionBean.memo" id="positionBean.memo" maxlength="100"/>
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
alert('保存职位信息成功！');
</script>
						</s:if>
						<s:elseif test="#request.flag==false">
							<script language="javascript">
alert('保存职位信息失败！');
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
