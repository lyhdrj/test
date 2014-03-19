<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
<HEAD>
<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/common.js"></script>
		<STYLE type="text/css">
#tablediv {
	font-size: 12px;
}

#layer {
	display: none;
	position: absolute;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 120%;
	filter: alpha(opacity = 50);
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
	z-index: 300;
}

#addpanel table tr td {
	padding-left: 20px;
	text-align: left;
}
</STYLE>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>
<style>
.t1 td {background-color:#ffffff;}/* 交替行第一行的背景色 */
.t2 td {background-color:#DDE6EC;}/* 交替行第二行的背景色 */
.t3 td {background-color:lightblue;}/* 鼠标经过时的背景色 */
</style>
</HEAD>
<body>
<table cellspacing="0">
<tr>
													<td colspan="3" style="border-right: none; text-align: left;">
共<s:property value="#request.pageBean.totalCount"/>条数据
									<s:if test="#request.pageBean.totalPage==0">
										当前为第0/<s:property value="#request.pageBean.totalPage"/>页
									</s:if>
									<s:else>当前为第<s:property value="#request.pageBean.currentPage"/>/<s:property value="#request.pageBean.totalPage"/>页
									</s:else>
									</td>
									<td style="text-align: right;">
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
								&nbsp;
								转到第<input id="goCurrentPage" class="textBox2" onkeyup="numberCheckNOChar(this)" onkeypress="numAndDot(this);if(event.keyCode==13){pageQuery(document.getElementById('goCurrentPage').value,100);}" size=2/>页
</td>
</tr>
</table>
</body>
</html>
