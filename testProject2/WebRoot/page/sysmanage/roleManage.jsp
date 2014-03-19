<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>roleManage.jsp</title><script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>

	
  </head>
  
  <body onkeydown="KeyDown()" >
    <table width="100%" height="100%" border="0" align="center" cellspacing="0" >
		<!--<tr>
			<td height="40"><iframe src="<%=request.getContextPath()%>/page/sysmanage/roleTop.jsp" id="role_top" name="role_top" height="100%" scrolling="no" width="100%" frameborder="0" ></iframe>	</td>
		</tr>
		--><tr>
			<td><iframe src="<%=request.getContextPath()%>/page/sysmanage/roleManage!modifyRole?firstFlag=100" id="role_main" name="role_main" height="100%" scrolling="yes" width="100%" frameborder="0" ></iframe>	</td>
		</tr>
	</table>
  </body>
</html>
