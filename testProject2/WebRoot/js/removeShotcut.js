function KeyDown(){  
	
	if ((window.event.altKey)&&((window.event.keyCode==37)||(window.event.keyCode==39))) //���� Alt+ ����� �� ���� Alt+ ����� �� 
	{ 
		alert("��׼��ʹ��ALT+�����ǰ���������ҳ��"); 
		event.returnValue=false; 
	} 
	//(event.keyCode==8)|| //�����˸�ɾ���� 
	if (event.keyCode==116) //���� F5 ˢ�¼� 
	{ 
		event.keyCode=0; 
		event.returnValue=false; 
	} 
	if ((event.ctrlKey)&&(event.keyCode==78)) //���� Ctrl+n 
	{ 
		event.returnValue=false; 
	} 

	if ((event.shiftKey)&&(event.keyCode==121)){ //���� shift+F10 
		event.returnValue=false; 
	} 
	if (event.keyCode==122){ //���� F11 
	event.returnValue=false; 
	}
	
	
} 
//---------------�����Ҽ�----
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
//document.ondragstart='return false';//��ֹ�������ҳ���϶�








