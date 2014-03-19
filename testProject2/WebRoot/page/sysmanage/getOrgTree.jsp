<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">

<head>

	<title>用户管理</title>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
	<link rel="StyleSheet"
		href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
	<script language="javascript"
		src="<%=request.getContextPath()%>/js/ChooseDateLine.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/validator.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/check.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/page/sysmanage/orgdtree.js"></script>
	<script type="text/javascript">
	function click(name,code){
		result=[name,code];
		window.returnValue = result;
		window.close();
	}
  	</script>
</head>
<base target="_self">
<body>
	<hr>
	<script type="text/javascript">
 tree = new dTree('tree');
 
 <s:if test="#request.operatorDepartment=='admin'">
	 tree.add(0,-1,"所有部门","javascript:click('所有部门','<s:property value="#request.admin"/>')");
 </s:if>
 <s:else>
	 tree.add(0,-1,"所有部门");
</s:else>
 	<s:iterator id="userListPage" value="#request.userList">
	tree.add("<s:property value="#userListPage.code"/>","<s:property value="#userListPage.parentCode"/>",
	"<s:property value="#userListPage.name"/>","javascript:click('<s:property value="#userListPage.name"/>','<s:property value="#userListPage.code"/>')");
 	</s:iterator>
document.write(tree);
</script>
</body>
</html>
