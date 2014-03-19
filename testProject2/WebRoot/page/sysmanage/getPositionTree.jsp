<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">

	<head>

		<title>职位</title>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/removeShotcut.js">
</script>
		<link rel="StyleSheet"
			href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/ChooseDateLine.js"
			type="text/javascript">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/validator.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/check.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/page/sysmanage/orgdtree.js">
</script>
		<script type="text/javascript">
function click(name, code) {
	result = [ name, code ];
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
tree.add(0, -1, '职位管理');<s:if test="#request.userDepartment=='no'">
	tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}"/>","","","");
 </s:if>
 <s:else>
 	<s:iterator id="positionListPage" value="#request.positionList">
 		<s:if test="#positionListPage.status==3">
     	tree.add("<s:property value="#positionListPage.positionCode"/>","<s:property value="#positionListPage.orgCode"/>",
     	"<s:property value="#positionListPage.positionName"/>","javascript:click('<s:property value="#positionListPage.positionName"/>','<s:property value="#positionListPage.positionCode"/>')");
 		</s:if>
 		<s:elseif test="#positionListPage.status==2">
     	tree.add("<s:property value="#positionListPage.positionCode"/>","<s:property value="#positionListPage.orgCode"/>",
     	"<s:property value="#positionListPage.positionName"/>","","","");
 		</s:elseif>
 		<s:elseif test="#positionListPage.status==1">
     	tree.add("<s:property value="#positionListPage.positionCode"/>","<s:property value="#positionListPage.orgCode"/>",
     	"<s:property value="#positionListPage.positionName"/>");
 		</s:elseif>
 	</s:iterator>
 </s:else>
			       document.write(tree);
				</script>
	</body>
</html>
