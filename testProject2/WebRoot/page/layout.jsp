
<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<html>
   <head>
      <title>SSI_ϵͳ</title>
      <script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
   	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
   </head>
<body onkeydown="KeyDown()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="1" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="90" valign="top"><tiles:insert attribute="header"/></td>
  </tr>
  <tr> 
    <td valign="top"><tiles:insert attribute="content"/></td>
  </tr>
  <tr> 
    <td height="25" valign="top"><tiles:insert attribute="footer"/></td>
  </tr>
</table>
</body>
</html>