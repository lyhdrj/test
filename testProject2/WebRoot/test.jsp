<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>�ޱ����ĵ�</title>
<style>
html, body {
	width : 100%;
	height : 100%;
	padding : 0;
	margin : 0
}


</style>
<link rel="stylesheet" type="text/css" href="page/ext/resources/css/ext-all.css"/>
<script type="text/javascript" src="page/ext/ext-base.js"></script>
<script type="text/javascript" src="page/ext/ext-all.js"></script>
<script type="text/javascript">

/////////////////////////////////////////////////////////////////
var index = 0;
var tabPanel = new Ext.TabPanel({
    region:"center",//����tabpanel�ŵ�viewport���м�����ȥ
    enableTabScroll:true,//��ҳ����ʾ��tabҳ���೬����ʾ����󣬻��Զ����ּ�ͷ����֮ǰ��tabҳ
    items:[{title:"��ҳ",
    	html:'<iframe src="welcome.jsp" width="100%" align="center" height="100%"  id="dhc" name="dhc"  frameborder="0" scrolling="yes"></iframe>',
		closable:false}]
});
Ext.onReady(
function(){
    new Ext.Viewport({
        enableTabScroll:true,
        layout:"border",    //border����            
        items:[
        tabPanel
        ]
    });    
}
);
        
function addadd(titles,srcs,ids){
	if(titles.length>5){
		titles = titles.substring(0,5)+"...";
	}
	tabpanel.addTab({id:ids,title:titles, html:'<iframe src='+srcs+' width="100%" align="center" height="100%" id="'+ids+'" name="'+ids+'" frameborder="0" scrolling="auto"></iframe>',
    closable:true});
}
</script>
</head>

<body scroll="no">

<script type="text/javascript">
 
	function SetCwinHeight()
{
var cwin=document.getElementById("dhc");
if (document.getElementById)
{
if (cwin && !window.opera)
{
if (cwin.contentDocument && cwin.contentDocument.body.offsetHeight)
cwin.height = cwin.contentDocument.body.offsetHeight; 
else if(cwin.Document && cwin.Document.body.scrollHeight)
cwin.height = cwin.Document.body.scrollHeight;
}
}
}
function SetCwinHeight(obj)
{
  var cwin=obj;
  if (document.getElementById)
  {
    if (cwin && !window.opera)
    {
      if (cwin.contentDocument && cwin.contentDocument.body.offsetHeight)
        cwin.height = cwin.contentDocument.body.offsetHeight; 
      else if(cwin.Document && cwin.Document.body.scrollHeight)
        cwin.height = cwin.Document.body.scrollHeight;
    }
  }
}

function TuneHeight() {   
var frm = document.getElementById("cwin");   
var subWeb = document.frames ? document.frames["cwin"].document : frm.contentDocument;   
if(frm != null && subWeb != null) {
   frm.height = subWeb.body.scrollHeight;
}   
} 
</script>
<div id="tab" style="align:center;height:50px"></div>
</body>
</html>