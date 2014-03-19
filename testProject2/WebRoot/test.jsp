<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>无标题文档</title>
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
    region:"center",//将此tabpanel放到viewport的中间区域去
    enableTabScroll:true,//当页面显示的tab页过多超过显示区域后，会自动出现箭头隐藏之前的tab页
    items:[{title:"主页",
    	html:'<iframe src="welcome.jsp" width="100%" align="center" height="100%"  id="dhc" name="dhc"  frameborder="0" scrolling="yes"></iframe>',
		closable:false}]
});
Ext.onReady(
function(){
    new Ext.Viewport({
        enableTabScroll:true,
        layout:"border",    //border布局            
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