<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>��λ����</title>
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
		<link rel="StyleSheet"
			href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/validator.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/check.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/dtreemanage.js">
</script>
		<script type="text/javascript">
function check_validate(value) {    
    var reg = /^(\d{3,4})-(\d{7,8})/;    
    if( value.constructor === String ){        
    var re = value.match( reg );        
    return true;    
    }    
    return false;
    }
function onCheck() {
	var test1 = document.getElementById("companyBean.companyName");
	var test2 = document.getElementById("companyBean.companyCode");
	
	if(test1.value.indexOf(" ")>-1){
		alert("��λ���Ʋ����пո�");
		return false;
	}
	if(test2.value.indexOf(" ")>-1){
		alert("��λ���벻���пո�");
		return false;
	}
	if (!checkNull(test1, '��λ����')) {
		return false;
	}
	if (!checkNull(test2, '��λ����')) {
		return false;
	}
	document.getElementById("addSubmit").disabled = "true";
	return true;
}

function checkNumLength(obj, name, len) {
	var str = obj.value;
	
		if (str.length == len || str.length == 0) {
	
		} else {
			alert(name + 'Ϊ' + len + 'λ����');
			obj.value = '';
			obj.focus();
		}
   
}
function refresh(){
	window.location.reload();
}
</script>
<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>
<style>
.t1 td {background-color:#ffffff;}/* �����е�һ�еı���ɫ */
.t2 td {background-color:#DDE6EC;}/* �����еڶ��еı���ɫ */
.t3 td {background-color:lightblue;}/* ��꾭��ʱ�ı���ɫ */
</style>
	</head>
	<%
		String companyShow = request.getContextPath()
				+ "/page/sysmanage/companyManage!queryCompanyInfo?companyBean.parentComCode=";

		String companyModify = request.getContextPath()
				+ "/page/sysmanage/companyManage!modifyCompanyInfo?companyBean.companyCode=";
		String companyDelete = request.getContextPath()
				+ "/page/sysmanage/companyManage!deleteCompanyInfo?companyBean.companyCode=";
	%>
	<script type="text/javascript">
function isDelete(companyCode) {
	var flag = confirm("ȷ��ɾ������?");
	if (flag) {
		var url = "<%=companyDelete%>" + companyCode;
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
			currentPage='<s:property value="#request.pageBean.totalPage"/>';
		}else{
			if(currentPage > '<s:property value="#request.pageBean.totalPage"/>'||
				currentPage < 1){
				alert('������1����ҳ��������');
				return false;
			}
			if(currentPage.indexOf('.') > -1){
				alert('��������Ч������');
				return false;
			}
			if(isNaN(currentPage)){
   				alert("�������������");
   				return true;
			} 
		}
		
		var url = "<%=companyShow%>"+"0";
		url += "&pageBean.currentPage="+currentPage+"&pageBean.totalCount="+'<s:property value="#request.pageBean.totalCount"/>';
		window.location.href = url;
	}


function checkInfo(obj)// �ύ����̨
{
	/**
	  var companyName=obj.name;
	  var inputval=obj.value;
	  var companyCode=document.getElementById("companyBean.companyCode").value;
	  var companyOrder=document.getElementById("companyBean.companyOrder").value;
	if(companyName=="companyBean.companyName"&&inputval!=""){
		
		send_request("<%=request.getContextPath()%>/page/sysmanage/companyManage!checkInfo?checkval="+inputval+"&type=companyname&companycode="+companyCode+"&companyOrder="+companyOrder);
	}
	if(companyName=="companyBean.companyName"&&inputval!=""){
	
		send_request("<%=request.getContextPath()%>/page/sysmanage/companyManage!checkInfo?checkval="+inputval+"&type=companycode&companyOrder="+companyOrder);
	}
	 */
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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;��ǰλ�ã���λ����&raquo;��λ�б�</span>
								</div>
								<div align="right">
								<a href="javascript:add();">��ʾ��Ӳ˵�</a>
								<a href="javascript:yincang();">������Ӳ˵�</a>
								</div>		
								<div id="content">
		                  		<table id="addTab">
		                  		<tr>
<td width="25%" valign="top"><a href="javascript:history.go(0);">ˢ��</a>
					<script type="text/javascript">
tree = new dTree('tree');
<s:if test="#request.userDepartment=='admin'" >
	tree.add(0,-1,'��λ����',"<%=companyShow%>0&pageBean.currentPage=1&&pageBean.totalCount=0","","");
</s:if>
<s:if test="#request.userDepartment!='admin'" >
	tree.add(0,-1,'��λ����',"","","");
</s:if>
<s:if test="#request.userDepartment=='no'" >
	tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}" />","","","");
</s:if>
<s:if test="#request.userDepartment!='no'" >
	<s:if test="#request.userDepartment==2" >
		tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}" />","","","");
	</s:if>
	<s:else>
		<s:iterator id="companyList" value="#request.companyList" >
	     	tree.add("<s:property value="#companyList.companyCode"/>","<s:property value="#companyList.parentComCode"/>","<s:property value="#companyList.companyName"/>");
		</s:iterator>
	</s:else>
</s:if>
    document.write(tree);
</script>
</td>
				<td width="74%" valign="top">

					<s:if test="#request.funShow!='none'">
						<table cellspacing=0>
							<tr
													style="background: url('<%=request.getContextPath()%>/images/common/bg_th.gif'); height: 27px;">
													<th width="20%">
														���
													</th>
													<th width="30%">
														��λ����
													</th>
													<th width="20%">
														��λ����
													</th>
													
													<th width="30%">
														��������
													</th>
												</tr>
							<s:if test="#request.subCompanyList!=null">
								<tbody id="tab">
									<s:iterator id="subCompanyList" value="#request.subCompanyList">
										<tr>
											<td>
												<center><s:property value="#subCompanyList.number" /></center>
											</td>
											<td>
											<center><s:property value="#subCompanyList.companyName" /></center>
											</td>
											<td>
												<center><s:property value="#subCompanyList.companyCode" /></center>
											</td>
											
											<td><center>
												[<a
													href="<%=companyModify%><s:property value="#subCompanyList.companyCode"/>">�޸�</a>]
												[<a href="javascript:void(0);"
													onclick="isDelete('<s:property value="#subCompanyList.companyCode"/>')">ɾ��</a>]
											</center></td>
										</tr>
									</s:iterator>
								</tbody>
								<tr>
									<td colspan="2" style="border-right: none; text-align: left;">
														��<s:property value="#request.pageBean.totalCount" />������&nbsp;��ǰΪ��
									<s:property value="%{pageBean.currentPage}" />/<s:property value="%{pageBean.totalPage}" />ҳ</td>
										<td colspan="2" style="text-align: right;">
										<s:if
											test="#request.pageBean.isFirstPage==true&&#request.pageBean.isLastPage==true">
											��ҳ
											��һҳ
											��һҳ
											βҳ
									</s:if>
										<s:elseif test="#request.pageBean.isFirstPage==true">
											��ҳ
											��һҳ
											<a href="javascript:;"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1);">��һҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">βҳ</a>
										</s:elseif>
										<s:elseif test="#request.pageBean.isLastPage==true">
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">��ҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">��һҳ</a>
											��һҳ
											βҳ
									</s:elseif>
										<s:else>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">��ҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">��һҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1)">��һҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">βҳ</a>
										</s:else>
										ת����<input id="goCurrentPage" onkeyup="numberCheckNOChar(this)"
											onkeypress="numAndDot(this);if(event.keyCode==13){pageQuery(document.getElementById('goCurrentPage').value,100);}"
											size=5 class="textBox2"/>ҳ
									</td>
								</tr>
							</s:if>
						</table>
						<div>
						<s:if test="#request.hintMsg!=null">
											<font color="red"><s:property value="#request.hintMsg" />
											</font>
										</s:if>
						</div>
						<div style="display: none;" id="addpanel">
					<s:form action="companyManage!addCompanyInfo" method="post"
							namespace="/page/sysmanage" onsubmit="return onCheck();">
							<table cellspacing=0>
							<tr>
									<td colspan="2">
										��
										<font color="red">*</font>��Ϊ�����ֶ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
									</td>
								</tr>
								<tr>
									<td>
										��λ����
									</td>

									<td>
										<input type="text" class="textBox1" id="companyBean.companyName"
											name="companyBean.companyName"
											maxlength="10" onblur="checkInfo(this);"
											onkeydown="enterkey();"/>
											<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										��λ����
									</td>
									<td>
										<input type="text" name="companyBean.companyCode"
											id="companyBean.companyCode"
											 maxlength="2" onblur="checkNumLength(this,'��λ����',2),checkInfo(this);" class="textbox1" onkeyup="numberCheckNOChar(this)" onkeydown="enterkey();"/>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										��λ�绰
									</td>
									<td>
										<input type="text" class="textBox1" name="companyBean.phone" id="companyBean.phone"
											 maxlength="15"/>
									</td>
								</tr>
								<tr>
									<td>
										��λ����
									</td>
									<td>
										<input type="text" class="textBox1" name="companyBean.fax" id="companyBean.fax"
											maxlength="15"/>
									</td>
								</tr>
								<tr>
									<td>
										��λ��ַ
									</td>
									<td>
										<input type="text" class="textBox1" name="companyBean.address"
											id="companyBean.address" maxlength="40"/>
									</td>
								</tr>
								<tr>
									<td class="td_color">
										��������
									</td>
									<td>
										<input type="text" class="textBox1" name="companyBean.zipcode"
											id="companyBean.zipcode" onkeyup="numberCheckNOChar(this)"
											onkeypress="numAndDot(this)" maxlength="16"/>
									</td>
								</tr>
								<tr>
									<td colspan="4" align="center">
										<input type="submit" name="addSubmit" value="���" class="input_img"/>
									<input type="button" onclick="window.history.back();" value="����" class="input_img"/>
									</td>
								</tr>
							</table>
						</s:form>
						</div>
						<s:if test="#request.flag==true">
							<script language="javascript">
alert('���浥λ��Ϣ�ɹ���');
</script>
						</s:if>
						<s:elseif test="#request.flag==false">
							<script language="javascript">
alert('���浥λ��Ϣʧ�ܣ�');
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