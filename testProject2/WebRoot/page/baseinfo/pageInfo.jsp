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
.t1 td {background-color:#ffffff;}/* �����е�һ�еı���ɫ */
.t2 td {background-color:#DDE6EC;}/* �����еڶ��еı���ɫ */
.t3 td {background-color:lightblue;}/* ��꾭��ʱ�ı���ɫ */
</style>
</HEAD>
<body>
<table cellspacing="0">
<tr>
													<td colspan="3" style="border-right: none; text-align: left;">
��<s:property value="#request.pageBean.totalCount"/>������
									<s:if test="#request.pageBean.totalPage==0">
										��ǰΪ��0/<s:property value="#request.pageBean.totalPage"/>ҳ
									</s:if>
									<s:else>��ǰΪ��<s:property value="#request.pageBean.currentPage"/>/<s:property value="#request.pageBean.totalPage"/>ҳ
									</s:else>
									</td>
									<td style="text-align: right;">
								<s:if test="#request.pageBean.isFirstPage==true&&#request.pageBean.isLastPage==true">
									��ҳ
									��һҳ
									��һҳ
									βҳ
								</s:if>
								<s:elseif test="#request.pageBean.isFirstPage==true">
									��ҳ
									��һҳ
									<a href="javascript:;" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1);">��һҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">βҳ</a>
								</s:elseif>
								<s:elseif test="#request.pageBean.isLastPage==true">
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">��ҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">��һҳ</a>
									��һҳ
									βҳ
								</s:elseif>
								<s:else>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">��ҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">��һҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1)">��һҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">βҳ</a>
								</s:else>
								&nbsp;
								ת����<input id="goCurrentPage" class="textBox2" onkeyup="numberCheckNOChar(this)" onkeypress="numAndDot(this);if(event.keyCode==13){pageQuery(document.getElementById('goCurrentPage').value,100);}" size=2/>ҳ
</td>
</tr>
</table>
</body>
</html>
