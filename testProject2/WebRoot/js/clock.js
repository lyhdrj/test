function Clock() {
	var date = new Date();
	this.year = date.getFullYear();
	this.month = date.getMonth() + 1;
	this.date = date.getDate();
	this.day = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")[date.getDay()];
	this.hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
	this.minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
	this.second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

	this.toString = function() {
		return "现在是:" + this.year + "年" + this.month + "月" + this.date + "日 " + this.hour + "时" + this.minute + "分" + this.second + "秒 " + this.day; 
	};
	
	this.toSimpleDate = function() {
		return this.year + "-" + this.month + "-" + this.date;
	};
	
	this.toDetailDate = function() {
		return this.year + "-" + this.month + "-" + this.date + " " + this.hour + ":" + this.minute + ":" + this.second;
	};
	
	this.display = function(ele) {
		var clock = new Clock();
		ele.innerHTML = clock.toString();
		window.setTimeout(function() {clock.display(ele);}, 1000);
	};
}
function getTime() {
	today = new Date();
	var day;
	var date;
	var hello;
	hour = today.getHours()
	if (hour < 6)
		hello = '凌晨好!'
	else if (hour < 9)
		hello = '早上好!'
	else if (hour < 12)
		hello = '上午好!'
	else if (hour < 14)
		hello = '中午好!'
	else if (hour < 17)
		hello = '下午好!'
	else if (hour < 19)
		hello = '傍晚好!'
	else if (hour < 22)
		hello = '晚上好!'
	else {
		hello = '半夜好!'
	}
	day = today.getDay()
	if (day == 0)
		day = '星期日'
	else if (day == 1)
		day = '星期一'
	else if (day == 2)
		day = '星期二'
	else if (day == 3)
		day = '星期三'
	else if (day == 4)
		day = '星期四'
	else if (day == 5)
		day = '星期五'
	else if (day == 6)
		day = '星期六'
	date = (today.getYear()) + '年' + (today.getMonth() + 1) + '月'
			+ today.getDate() + '日';
	document.getElementById("hello").innerHTML = "<strong><font color=#ff6600>"
			+ hello + "&nbsp;</font></strong>今天是&nbsp;" + date + "&nbsp;" + day;
}