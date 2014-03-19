function adddate(n)
     {
	   
       var redate = window.showModalDialog("../common/choosedate.html","mywindow","status:no;scroll:yes;help:no;dialogWidth:280px;dialogHeight:200px");

    if(redate)
     {
	 	if(n==1)
			document.form1.text202.value =redate;
		if(n==2)
			document.form1.text203.value =redate;
     }
    }
