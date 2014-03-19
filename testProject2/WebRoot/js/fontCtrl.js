/*-----------------------------------------------------------------------*/
//描  述:生成字体控制菜单
/*-----------------------------------------------------------------------*/
with(document){
	write("<a onclick=zoomIn(); href=\"javascript:\">放大<img src=\"../../images/zoomin.gif\" border=0 align=absMiddle></a>&nbsp;&nbsp;");
	write("<a onclick=zoomOut(); href=\"javascript:\">缩小<img src=\"../../images/zoomout.gif\" border=0 align=absMiddle></a>&nbsp;&nbsp;");
	write("<a onclick=zoomDefault(); href=\"javascript:\">默认<img src=\"../../images/zoomact.gif\" border=0 align=absMiddle></a>");
}

