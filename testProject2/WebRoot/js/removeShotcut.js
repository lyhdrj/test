function KeyDown(){  
	
	if ((window.event.altKey)&&((window.event.keyCode==37)||(window.event.keyCode==39))) //屏蔽 Alt+ 方向键 → 屏蔽 Alt+ 方向键 ← 
	{ 
		alert("不准你使用ALT+方向键前进或后退网页！"); 
		event.returnValue=false; 
	} 
	//(event.keyCode==8)|| //屏蔽退格删除键 
	if (event.keyCode==116) //屏蔽 F5 刷新键 
	{ 
		event.keyCode=0; 
		event.returnValue=false; 
	} 
	if ((event.ctrlKey)&&(event.keyCode==78)) //屏蔽 Ctrl+n 
	{ 
		event.returnValue=false; 
	} 

	if ((event.shiftKey)&&(event.keyCode==121)){ //屏蔽 shift+F10 
		event.returnValue=false; 
	} 
	if (event.keyCode==122){ //屏蔽 F11 
	event.returnValue=false; 
	}
	
	
} 
//---------------屏蔽右键----
if (window.event){
	//document.captureEvents(event.MOUSEUP);
	}
function nocontextmenu()
{
	event.cancelBubble=true;
	event.returnValue=false;
	return false;
}
function norightclick()
{
	if (window.event)
	{
		if (event.which==2 || event.which==3){
		return false;
		}
	}else if (event.button==2||event.button==3){
		event.cancelBubble=true;
		event.returnValue=false;
		return false;
	}
}
//document.oncontextmenu=nocontextmenu;
//document.onmousedown=norightclick;
//document.ondragstart='return false';//禁止鼠标在网页上拖动








