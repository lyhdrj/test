/*-----------------------------------------------------------------------*/
//方法名:zoomIn()
//描  述:字体放大
/*-----------------------------------------------------------------------*/
function zoomIn(){
	if(typeof(eval(window.frames['report'].zoomIn))=="function"){
		window.frames['report'].zoomIn();
	}
}
/*-----------------------------------------------------------------------*/
//方法名:zoomOut()
//描  述:字体缩小
/*-----------------------------------------------------------------------*/
function zoomOut(){
	if(typeof(eval(window.frames['report'].zoomOut))=="function"){
		window.frames['report'].zoomOut();
	}
}
/*-----------------------------------------------------------------------*/
//方法名:zoomDefault()
//描  述:恢复默认字体，大小为12像素
/*-----------------------------------------------------------------------*/
function zoomDefault(){
	if(typeof(eval(window.frames['report'].zoomDefault))=="function"){
		window.frames['report'].zoomDefault();
	}
}

/*-----------------------------------------------------------------------*/
//方法名:hidScroll()
//描  述:隐藏报表div滚动条，打印报表时用
/*-----------------------------------------------------------------------*/
function hidScroll(){ 
	var iframe = document.getElementById('report'); 
	var sDiv = iframe.contentWindow.document.getElementById('scrollDiv');
	var topmenu = iframe.contentWindow.document.getElementById('topmenu');
	var divCell = iframe.contentWindow.document.getElementById('divCell');
	if(iframe){
		if(topmenu && divCell){
			topmenu.style.display="none";
			divCell.style.display="none";
		}
		if(sDiv){
			sDiv.style.overflowX='hidden';
			sDiv.style.overflowY='hidden';
		}
	}
}
/*-----------------------------------------------------------------------*/
//方法名:showScroll()
//描  述:显示报表div滚动条，打印报表时用
/*-----------------------------------------------------------------------*/
function showScroll(){ 
	var iframe = document.getElementById('report'); 
	var sDiv = iframe.contentWindow.document.getElementById('scrollDiv');
	var topmenu = iframe.contentWindow.document.getElementById('topmenu');
	var divCell = iframe.contentWindow.document.getElementById('divCell');
	if(iframe){
		if(topmenu && divCell){
			topmenu.style.display="block";
			divCell.style.display="block";
		}
		if(sDiv){
			sDiv.style.overflowX='scroll';
			sDiv.style.overflowY='scroll';
		}
	}
}
/**********************************************
*函数功能：设置报表里div层的高度
*创建日期：2009年9月24日
***********************************************/
function setReportDivHeight(){
	var iframe = document.getElementById('report'); 
	var sDiv = iframe.contentWindow.document.getElementById('scrollDiv');
	if(iframe){
		if(sDiv){
			sDiv.style.height = bottomTableHeight;
		}
	}
}
/**********************************************
*函数功能：初始化报表窗口
*创建日期：2009年9月22日
***********************************************/
	var topStyleHeight = 10; //顶部样式高度
	var topHeadHeight = 30; //顶部导航高度
	var bottomStyleHeight = 5; //底部样式高度
	var scrollHeight = 20; //滚动条高度
	var copyRightHeight = 30; //网站后台版权部分高度
	var windowTopHeight = 142; //窗口顶部高度
	var windowBottomHeight = 7; //窗口底部高度，取值范围，在没有状态栏一情况下，设置为7，在有状态栏的情况下设置为29
	var topTableHeight; //顶部表格的高度
	var topHrHeight = 5; //顶部水平线的高度
	var bodyHeight;  //整个页面的高度
	var bottomTableHeight; //底部表格高度
	var topTotalHeight; //顶部总的高度
	
	function initReportPage(){	
		bodyHeight = window.screen.availHeight-copyRightHeight-windowTopHeight-windowBottomHeight;  //获取页面的高度	
		topTableHeight = document.getElementById('table').clientHeight; //获取顶部表格的高度	
		totalHeight = topHeadHeight+topStyleHeight+topHrHeight+topTableHeight+bottomStyleHeight; //获取顶部总的高度		
		bottomTableHeight = bodyHeight-totalHeight; //获取报表区的高度		
		document.getElementById('ireport').style.height = bottomTableHeight;  //设置报表区外围高度		
		if(document.getElementById('report')){
			document.getElementById('report').style.height = bottomTableHeight;  //设置iframe的高度
		}
	}
/* 报表初始化函数结束 */