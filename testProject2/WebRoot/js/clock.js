function Clock() {
	var date = new Date();
	this.year = date.getFullYear();
	this.month = date.getMonth() + 1;
	this.date = date.getDate();
	this.day = new Array("������", "����һ", "���ڶ�", "������", "������", "������", "������")[date.getDay()];
	this.hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
	this.minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
	this.second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

	this.toString = function() {
		return "������:" + this.year + "��" + this.month + "��" + this.date + "�� " + this.hour + "ʱ" + this.minute + "��" + this.second + "�� " + this.day; 
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
		hello = '�賿��!'
	else if (hour < 9)
		hello = '���Ϻ�!'
	else if (hour < 12)
		hello = '�����!'
	else if (hour < 14)
		hello = '�����!'
	else if (hour < 17)
		hello = '�����!'
	else if (hour < 19)
		hello = '�����!'
	else if (hour < 22)
		hello = '���Ϻ�!'
	else {
		hello = '��ҹ��!'
	}
	day = today.getDay()
	if (day == 0)
		day = '������'
	else if (day == 1)
		day = '����һ'
	else if (day == 2)
		day = '���ڶ�'
	else if (day == 3)
		day = '������'
	else if (day == 4)
		day = '������'
	else if (day == 5)
		day = '������'
	else if (day == 6)
		day = '������'
	date = (today.getYear()) + '��' + (today.getMonth() + 1) + '��'
			+ today.getDate() + '��';
	document.getElementById("hello").innerHTML = "<strong><font color=#ff6600>"
			+ hello + "&nbsp;</font></strong>������&nbsp;" + date + "&nbsp;" + day;
}