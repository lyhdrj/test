<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>菜单管理</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style1.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>
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
	<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/dtreemanage.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/validator.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.4.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/tableCtrl.js"></script>
<style>
.t1 td {background-color:#ffffff;}/* 交替行第一行的背景色 */
.t2 td {background-color:#DDE6EC;}/* 交替行第二行的背景色 */
.t3 td {background-color:lightblue;}/* 鼠标经过时的背景色 */
</style>
</head>
<%
	String menuShow= request.getContextPath()+"/page/sysmanage/menuManage!queryOneMenu?menuId=";
	String menuModify= request.getContextPath()+"/page/sysmanage/menuManage!modifyOneMenu?menuId=";
	String menuDelete= request.getContextPath()+"/page/sysmanage/menuManage!removeMenuInfo?menuId=";
%>
	<script type="text/javascript">
	
	function onCheck() {
	var test1 = document.getElementById("menuName");
	var test2 = document.getElementById("menuFunc");
	if (!checkNull(test1, '菜单名称')) {
		return false;
	}
	if (!checkNull(test2, '菜单功能')) {
		return false;
	}
	if(test1.value.indexOf(" ")>-1){
		alert("菜单名称不能有空格");
		return false;
	}
	if(test2.value.indexOf(" ")>-1){
		alert("菜单功能不能有空格");
		return false;
	}
	document.getElementById("addSubmit").disabled = "true";
	return true;
	}
	
	function isDelete(menuId){
		var flag = confirm("确定删除此菜单！");
		if(flag){	
			var url = "<%=menuDelete%>"+menuId;
			window.location.href = url;
		}else{
			return flag;
		}
	}
	
	function pageQuery(pageCurr){
		
		var totalPage = '<s:property value="%{pageBean.totalPage}"/>';
		var totalCount = '<s:property value="%{pageBean.totalCount}"/>';
		var curr = '<s:property value="%{pageBean.currentPage}"/>';
		var parentMenuId = '<s:property value="%{menuBean.parentMenuID}"/>';
		var url = "<%=menuShow %>" +  parentMenuId;
		var currentPage = parseInt(curr) + parseInt(pageCurr);
		if(pageCurr == 0){
			currentPage = 1;
		}else if(pageCurr ==99){
			currentPage = parseInt(totalPage);
		}else if(pageCurr == 100){
			var obj = document.getElementById("pageJump");
			currentPage = obj.value;
			var numFlag = checkInt(obj,"页数");
			var nullFlag = checkNull(obj,"页数");
			if(!numFlag ||!nullFlag){
				return false;
			}
			if(currentPage > totalPage){
				alert("您输入的页数不存在！");
				return false;
			}
			if(currentPage < 1){
				alert('请输入1~总页数的数字');
				return false;
			}
			if(isNaN(currentPage)){
   				alert("输入必须是数字");
   				return true;
			} 
		}
		url = url + "&pageBean.currentPage=" +currentPage  + "&pageBean.totalCount=" + totalCount;
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：菜单管理&raquo;菜单列表</span>
								</div>
								<div align="right">
								<a href="javascript:add();">显示添加菜单</a>
								<a href="javascript:yincang();">隐藏添加菜单</a>
								</div>		
								<div id="content">
		                  		<table id="addTab">
			<tr>
				<td width="15%" valign="top"><a href="javascript:history.go(0);">刷新</a>
					<script type="text/javascript">
				tree = new dTree('tree');
				tree.add(0,-1,'菜单功能设置',"<%=menuShow%>0&pageBean.currentPage=1&pageBean.totalCount=0","","");
				<s:iterator id="menuTreeList" value="#request.menuList">
				tree.add("<s:property value='#menuTreeList.menuID'/>","<s:property value='#menuTreeList.parentMenuID'/>","<s:property value='#menuTreeList.menuName'/>", "<%=menuShow%><s:property value='#menuTreeList.menuID'/>&pageBean.currentPage=1&pageBean.totalCount=0","","");
				</s:iterator>
				document.write(tree);
			</script>
</td>
<td width="84%" valign="top">
					
		<s:if test = "#request.menuAdd!='none'">
		<table cellspacing=0>
			<tr style="background: url('<%=request.getContextPath()%>/images/common/bg_th.gif'); height: 27px;">
													<th width="10%">
														序号
													</th>
													<th width="15%">
														上级菜单名称
													</th>
													<th width="15%">
														菜单名称
													</th>
													<th width="40%">
														菜单功能
													</th>
		<s:if test = "#session.userlogin!=null">
			<s:if test = '#session.userlogin.company=="1"'>
				<th width="10%">功能链接</th>
		    </s:if>
	    </s:if>
				<th width="10%">基本操作</th>
			</tr>
			<s:if test = "#request.subMenuList!=null">
			<tbody id="tab">
				<s:iterator id="subMenuList" value="#request.subMenuList">
					<tr>
					<td><center><s:property value="#subMenuList.menuNum"/></center></td>
					<s:if test="#subMenuList.parentMenuName==null">
					<td><center>&nbsp;</center></td>
					</s:if>
					<s:else>
					<td><center><s:property value="#subMenuList.parentMenuName"/></center></td>
					</s:else>
					<td><center><s:property value="#subMenuList.menuName"/></center></td>
						<s:if test = "#session.userlogin!=null">
							<s:if test = '#session.userlogin.company=="1"'>
							<s:if test="#subMenuList.menuFunc==null">
							<td><center>&nbsp;</center></td>
							</s:if>
							<s:else>
							<td><center><s:property value="#subMenuList.menuFunc"/></center></td>
							</s:else>
							</s:if>
					    </s:if>
					<td><center><s:property value="#subMenuList.status"/></center></td>
					<td><center>[<a href="<%=menuModify%><s:property value="#subMenuList.menuID"/>">修改</a>]
					[<a href="javascript:void(0);" onclick="isDelete('<s:property value="#subMenuList.menuID"/>')">删除</a>]</center></td>
					</tr>
				</s:iterator>
				</tbody>
				<tr align="right">
				<td colspan="3" style="border-right: none; text-align: left;">
				共<s:property value="%{pageBean.totalCount}"/>条数据&nbsp; 当前为第<s:property value="%{pageBean.currentPage}"/>/<s:property value="%{pageBean.totalPage}"/>页 &nbsp;&nbsp;
				</td>
				<td colspan="4" style="text-align: right;">
				<s:if test="%{pageBean.isFirstPage==false}">
				<a href="javascript:void(0);" onclick="pageQuery(0)">首页</a>&nbsp;
				<a href="javascript:void(0);" onclick="pageQuery(-1)">上一页</a>&nbsp;
				</s:if>
				<s:else>
					首页&nbsp;上一页&nbsp;
				</s:else>
				<s:if test="%{pageBean.isLastPage==false}">
				<a href="javascript:void(0);" onclick="pageQuery(1)">下一页</a>&nbsp;
				<a href="javascript:void(0);" onclick="pageQuery(99)">尾页</a>&nbsp;
				</s:if>
				<s:else>
					下一页&nbsp;尾页
				</s:else>
				&nbsp;转到第<input type="text" name="pageJump" class="textBox2" maxlength="3" size="3" id="pageJump"  onkeypress="if(event.keyCode==13){pageQuery(100);}" onkeyup="numberCheckNOChar(this)"/>页</td>
				</tr>
			
			</s:if>
			</table>
<div style="display: none;" id="addpanel">
	<s:if test = "#session.userlogin!=null">
		<s:if test = '#session.userlogin.company=="1"'>
			<s:form action="/page/sysmanage/menuManage!insertMenu" method="post" onsubmit="return onCheck(); ">
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
										上级菜单名称
									</td>

									<td>
							<input type="text" class="textBox1"  name="menuBean.parentMenuName" readonly="readonly" value="${menuBean.parentMenuName}" style="background-color: lightgray;"/>
							<s:hidden name="menuBean.parentMenuID" value="%{menuBean.parentMenuID}" />
							<s:hidden name="menuBean.userId" value="%{#session.userlogin.userid}" />
									</td>
								</tr>
								<tr>
									<td>
										菜单名称
									</td>
									<td>
										<input type="text" name="menuBean.menuName" maxlength="30"  id="menuName" class="textbox1"/>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										菜单功能
									</td>
									<td>
										<input type="text" class="textBox1" name="menuBean.menuFunc"  maxlength="60" id="menuFunc"/>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										功能链接
									</td>
									<td>
										<s:radio id="menuBean.status" name="menuBean.status" value="1" list="#{'1':'有效','0':'无效'}"/>
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
		</s:if>
	    </s:if>
		</div>
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
		<s:if test="#request.flag==1">
	<script>
		alert('删除菜单成功！');
	</script>
	</s:if>
	<s:elseif test="#request.flag==10">
	<script>
		alert('因此菜单存在关联，删除菜单失败！');
	</script>
	</s:elseif>
	</body>
</html>

	