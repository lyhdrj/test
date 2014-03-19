<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>基本信息列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style1.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tableCtrl.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>
		
<%
String getInfoForM = request.getContextPath() + "/page/baseinfo/baseInfoManage!queryOneForUpdate?baseInfoBean.id=";
String deleteAction = request.getContextPath() + "/page/baseinfo/baseInfoManage!deleteBaseInfo?baseInfoBean.ids=";
String addAction =  request.getContextPath() + "/page/baseinfo/baseInfoAdd.jsp";
String doReport = request.getContextPath() + "/page/baseinfo/baseInfoManage!generateReport?reportType=";

 %>
		<s:if test="#request.hintMsg!=null">
			<script>
				alert(<s:property value="#request.hintMsg"/>);
			</script>
		</s:if>
		
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
			}
			document.getElementById("pageBean.currentPage").value = currentPage;
			document.getElementById("pageBean.totalCount").value = '<s:property value="#request.pageBean.totalCount"/>';
			document.forms[0].submit();
		}
		
		function isDelete(){
				var checkObj = document.getElementsByName("checkOne");
				var checkSize = checkObj.length;
				var checkCount = 0;
				for(var i=0;i<checkSize;i++){
					if(checkObj[i].checked){
						++checkCount;
					}
				}
				if(checkCount==0){
					alert("请选择要删除的数据！至少一条！");
					return false;
				}
				var flag = confirm("确定删除数据？");
				if(flag){	
					var delID = new Array();
					var k=0;
					for(var i=0;i<checkSize;i++){
						if(checkObj[i].checked){
							var rows = document.getElementById("showtab").getElementsByTagName("tr");
							var cols = rows[i+1].getElementsByTagName("td");
							var id = cols[2].innerHTML;
							delID[k++] = id;
							
						}
					}
					var url = "<%=deleteAction %>"+delID;
					window.location.href = url;
				}else{
					return flag;
				}
			}
		
		function isModify(){
			var checkObj = document.getElementsByName("checkOne");
			var checkSize = checkObj.length;
			var checkNum = 0;
			var checkCount = 0;
			for(var i=0;i<checkSize;i++){
				if(checkObj[i].checked){
					++checkCount;
					checkNum = i+1;
				}
			}
			if(checkCount != 1){
				alert("修改只允许对一条数据进行操作，请确认！");
				return false;
			} else {
				var rows = document.getElementById("showtab").getElementsByTagName("tr");
				var cols = rows[checkNum].getElementsByTagName("td");
				var id = cols[2].innerHTML;
				window.location.href = "<%=getInfoForM  %>" + id;
			}
		}
		
		function jumpAdd(){
			window.location.href = "<%=addAction%>";
		}
		
		function toSubmit(){
			document.forms[0].submit();
		}
		
		function checkAll(){
			var obj = document.getElementById("checkAll");
			var checkObj = document.getElementsByName("checkOne");
			var checkSize = checkObj.length;
			var checkStatic = obj.checked;
			for(var i=0;i<checkSize;i++){
				checkObj[i].checked = checkStatic;
			}
		}
		
		function doReport(type){
			
			var reportId = document.getElementById("reportName").value;
			var url = "<%=doReport %>" + type;
			url = url + "&reportId=" + reportId;
			window.location.href =url;
			
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

	<body onLoad="$()">
	
		<div id="layer">
		</div>
		<DIV>
			<TABLE height="97%" cellSpacing=0 cellPadding=0 width="99%" border=0>
				<TBODY>
					<TR
						style="BACKGROUND-IMAGE: url(images/common/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
						height=47>
						<TD width=10>
							<SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(images/common/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
						</TD>
						<TD>
						</TD>
						<TD
							style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(images/common/main_rc.gif)"
							width=10></TD>
					</TR>
					<TR>
						<TD style="BACKGROUND-IMAGE: url(images/common/main_ls.gif)">
							&nbsp;
						</TD>
						<TD
							style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white"
							vAlign=top align="center">
							<div>
								<div id="current">
									<span>&nbsp;&nbsp;&nbsp;&nbsp;当前位置：基本信息管理&raquo;基本信息列表</span>
								</div>
									<div id="content">
			<s:form action="baseInfoManage!queryBaseInfo" namespace="/page/baseinfo">
			 <table cellspacing="0">
	       <tr>
		        <td style="border-right: none; text-align: right;"><font size="2">代码</font>
		       <input type="text" name="baseInfoBean.code" maxlength="8" size="12" class="textBox1" onkeydown="if(event.keyCode==13){toSubmit();}" onkeyup="numberCheckNOChar(this)"/></td>
		        <td style="border-right: none; text-align: right;"><font size="2">名字</font>
		      <input type="text" name="baseInfoBean.name"  maxlength="20" size="12" class="textBox1" onkeydown="if(event.keyCode==13){toSubmit();}"/></td>
		      <td style="border-right: none; text-align: right;">
		      <input type="button" onclick="toSubmit()" value="查询" class="input_img"/>
		        </td>
		        <td style="display:none">
		        	<input type=hidden name="pageBean.totalCount" id="pageBean.totalCount" value="0"/>
		        	<input type=hidden name="pageBean.currentPage" id="pageBean.currentPage" value="1"/>
		        </td>
		        <td style="border-right: none; text-align: right;"><s:select id="reportName" list="#request.reportMap" listKey="key" listValue="value"></s:select ></td>
		        <td><font size="2">生成报表类型：</font>
		    <a onclick="doReport('word')"><img src="<%=request.getContextPath() %>/images/doc.gif" alt="WORD"/></a>
			<a onclick="doReport('excel')"><img src="<%=request.getContextPath() %>/images/xls.gif" alt="EXCEL"/></a>
			<a onclick="doReport('pdf')"><img src="<%=request.getContextPath() %>/images/pdf.gif" alt="PDF"/></a>
		        </td>
	       </tr>
    </table>
</s:form>
	
		
											<table cellspacing="0" id="showtab">
												<tr
													style="background: url('images/common/bg_th.gif'); height: 27px;" align="center">
													<th width="15%">
														<input type="checkbox" id="checkAll" onclick="checkAll()">
													</th>
													<th width="10%">
														序号
													</th>
													<th width="10%">
														ID
													</th>
													<th width="15%">
														代码
													</th>
													<th width="15%">
														名字
													</th>
													<th width="35%">
														备注
													</th>
												</tr>
		<s:if test="!#request.baseInfoList.isEmpty()">
				<tbody id="tab">
		<s:iterator id="baseInfo" value="#request.baseInfoList" >
				<tr>
					<td align="left"><input type="checkbox" name="checkOne"></td>
					<td align="left"><s:property value="#baseInfo.rowno"/></td>
					<td align="left"><s:property value="#baseInfo.id"/></td>
					<td align="left"><s:property value="#baseInfo.code"/></td>
					<td align="left"><s:property value="#baseInfo.name"/></td>
					<s:if test="#baseInfo.remark==null">
						<td align="left">&nbsp;</td>
					</s:if>
					<s:else>
						<td align="left"><s:property value="#baseInfo.remark"/></td>
					</s:else>
				</tr>
				</s:iterator>
				</tbody>
				<tr align=right>
					<td colspan=7>
						<s:include value="pageInfo.jsp"></s:include>
					</td>
				</tr>
		</s:if>
		<s:else>
			<tr>
				<td colspan=7>
					<center><font color=red>查询为空</font></center>
				</td>
			</tr>
		</s:else>
		</table>
		<br>
		<center>
			<input type="button" onclick="jumpAdd();" value="添加" class="input_img"/>
			<input type="button" onclick="isModify();" value="修改" class="input_img"/>
			<input type="button" onclick="isDelete();" value="删除" class="input_img"/>
		</center>	
		</div>
		</div>
		</TD>
		<TD style="BACKGROUND-IMAGE: url(images/common/main_rs.gif)"></TD>
		</TR>
		<TR
						style="BACKGROUND-IMAGE: url(images/common/main_fs.gif); BACKGROUND-REPEAT: repeat-x"
						height=10>
						<TD style="BACKGROUND-IMAGE: url(images/common/main_lf.gif)"></TD>
						<TD style="BACKGROUND-IMAGE: url(images/common/main_fs.gif)"></TD>
						<TD style="BACKGROUND-IMAGE: url(images/common/main_rf.gif)"></TD>
					</TR>
				</TBODY>
		</TABLE>
		</DIV>
		</body>
		</html>
			