var gcToggle = "#ffff00";
var gcBG = "#CCCCFF";

var ctlObj = new Object();
var winPopupWindow = new Object();
N = (document.all) ? 0 : 1;

function IgnoreEvents(e)
{
  return false
}
function HandleFocus()
{
  if (winPopupWindow)
  {
    if (!winPopupWindow.win.closed)
    {
      winPopupWindow.win.focus()
    }
    else
    {
      window.top.releaseEvents (Event.CLICK|Event.FOCUS)
    }
  }
  return false
}

//选择产品
function fPopUpDlgMultiProd(dialogType,ctl1,ctl2,ctl3,ctl4,ctl5,ctl6,ctl7,ctl8,WINname,WINwidth,WINheight){
N = (document.all) ? 0 : 1;

	var endtarget;
	if(dialogType == "POPUPLIST_PRODUCT"){
		endtarget = "product/product_sel.jsp";
	}else if(dialogType == "STORE_PRODUCT"){
		endtarget = "../purchase/product/product_sel.jsp";
	}else if(dialogType == "POPUPLIST_PRODUCT_NOPOS"){
          	var obj = document.getElementById(ctl1);
          	var prod_code=obj.value;
		endtarget = "product/product_sel.jsp?input=1";
	}else if(dialogType == "CHINT_PRODUCT"){
		endtarget = "chintproduct/product_sel.jsp";
	}else if(dialogType == "CHINT_PRODUCT_NOPOS"){
          	var obj = document.getElementById(ctl1);
          	var prod_code=obj.value;
		endtarget = "chintproduct/product_sel.jsp?input=1";
      }
        if(dialogType == "POPUPLIST_PRODUCT_NOPOS" || dialogType == "CHINT_PRODUCT_NOPOS"){
	    	showx = window.screen.width /2;
	    	showy = window.screen.height /2;
      }else {  if(N){
	    	showx = window.screen.width /2;
	    	showy = window.screen.height /2;
	}else{
	    //showx = event.screenX - event.offsetX - 4 - WINwidth ; // + deltaX;
	    //showy = event.screenY - event.offsetY + 18; // + deltaY;
	    	showx = window.screen.width /2;
	    	showy = window.screen.height /2;
	}
          }

	if (dialogType == "POPUPLIST_CONTRACTSTOP" ){
	    if(N){
	    	showx = window.screen.width /2;
	    	showy = window.screen.height /2;
	    }else{
	        showx = event.screenX - event.offsetX - WINwidth + 150;
  	        showy = event.screenY - event.offsetY + 20;
	    }
	}
	   	showx = window.screen.width /2 - WINwidth/2;
	   	showy = window.screen.height /2 - WINheight/2;

	newWINwidth = WINwidth + 4 + 18;
	var retval;
	if(N){
	    window.top.captureEvents (Event.CLICK|Event.FOCUS);
    	    window.top.onclick=IgnoreEvents;
            window.top.onfocus=HandleFocus;
            winPopupWindow.returnedValue = new Array();
   	    if (dialogType == "POPUPLIST_CONTRACTSTOP" ){
	        if(N){
            	    winPopupWindow.returnFunc = HRMContractN6SubmitDelete;
	        }
	    }
            winPopupWindow.args = ctl;
            winPopupWindow.win = window.open(endtarget,"PopupDialog","dependent=yes,left="+showx + ",top=" + showy + ",width="+newWINwidth + ",height=" + WINheight )
            winPopupWindow.win.focus()
            winPopupWindow.win.screen.top = showy;
            winPopupWindow.win.screen.left = showx;
            return winPopupWindow;
	}else{
		var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:no;Resizeable=no';
	    retval = window.showModalDialog(endtarget, " ", features );
        }
	if( retval != null ){
		var obj1;
		if(typeof(ctl1)!="object" && ctl1 != null)
			obj1 = document.getElementById(ctl1);
		else
			obj1 = ctl1;
                if(obj1 != null)
			obj1.value = retval[1];
		var obj2;
		if(typeof(ctl2)!="object" && ctl2 != null)
			obj2 = document.getElementById(ctl2);
		else
			obj2 = ctl2;
                if(obj2 != null)
			obj2.value = retval[2];
		var obj3;
		if(typeof(ctl3)!="object" && ctl3 != null)
			obj3 = document.getElementById(ctl3);
		else
			obj3 = ctl3;
                if(obj3 != null)
			obj3.value = retval[3];
		var obj4;
		if(typeof(ctl4)!="object" && ctl4 != null)
			obj4 = document.getElementById(ctl4);
		else
			obj4 = ctl4;
                if(obj4 != null)
			obj4.value = retval[4];
		var obj5;
		if(typeof(ctl5)!="object" && ctl5 != null)
			obj5 = document.getElementById(ctl5);
		else
			obj5 = ctl5;
                if(obj5 != null)
			obj5.value = retval[5];
		var obj6;
		if(typeof(ctl6)!="object" && ctl6 != null)
			obj6 = document.getElementById(ctl6);
		else
			obj6 = ctl6;
                if(obj6 != null)
			obj6.value = retval[6];
		var obj7;
		if(typeof(ctl7)!="object" && ctl7 != null)
			obj7 = document.getElementById(ctl7);
		else
			obj7 = ctl7;
                if(obj7 != null)
			obj7.value = retval[7];
		var obj8;
		if(typeof(ctl8)!="object" && ctl8 != null)
			obj8 = document.getElementById(ctl8);
		else
			obj8 = ctl8;
                if(obj8 != null)
			obj8.value = retval[8];
	}else{
		//alert("canceled");
	}
}

//采购收货选择产品
function ReceiptSearchProd(dialogType,ctl1,ctl2,ctl3,ctl4,ctl5,ctl6,ctl7,ctl8,WINname,WINwidth,WINheight){
N = (document.all) ? 0 : 1;

	var endtarget;
	if(dialogType == "RECEIPT_PRODUCT_NOPOS"){
          	var curnum = Number(ctl1.substr(5));
          	var curcol = Number(ctl1.substr(3,2));
          	var obj = findnode(curnum,curcol);
          	var prod_code=obj.value;
		endtarget = "product/product_sel.jsp?input=1";
	}else if(dialogType == "CHINT_PRODUCT_NOPOS"){
          	var obj = document.getElementById(ctl1);
          	var prod_code=obj.value;
		endtarget = "chintproduct/product_sel.jsp?input=1";
      }
	   	showx = window.screen.width /2 - WINwidth/2;
	   	showy = window.screen.height /2 - WINheight/2;

	newWINwidth = WINwidth + 4 + 18;
	var retval;
	if(N){
	    window.top.captureEvents (Event.CLICK|Event.FOCUS);
    	    window.top.onclick=IgnoreEvents;
            window.top.onfocus=HandleFocus;
            winPopupWindow.returnedValue = new Array();
   	    if (dialogType == "POPUPLIST_CONTRACTSTOP" ){
	        if(N){
            	    winPopupWindow.returnFunc = HRMContractN6SubmitDelete;
	        }
	    }
            winPopupWindow.args = ctl;
            winPopupWindow.win = window.open(endtarget,"PopupDialog","dependent=yes,left="+showx + ",top=" + showy + ",width="+newWINwidth + ",height=" + WINheight )
            winPopupWindow.win.focus()
            winPopupWindow.win.screen.top = showy;
            winPopupWindow.win.screen.left = showx;
            return winPopupWindow;
	}else{
		var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:no;Resizeable=no';
	    retval = window.showModalDialog(endtarget, " ", features );
        }
	if( retval != null ){
		var obj1;
		if(typeof(ctl1)!="object" && ctl1 != null){
                	var curnum = Number(ctl1.substr(5));
          		var curcol = Number(ctl1.substr(3,2));
          		var obj1 = findnode(curnum,curcol);
		}
		else
			obj1 = ctl1;
                if(obj1 != null)
			obj1.value = retval[1];
		var obj2;
		if(typeof(ctl2)!="object" && ctl2 != null){
                	var curnum = Number(ctl2.substr(5));
          		var curcol = Number(ctl2.substr(3,2));
          		var obj2 = findnode(curnum,curcol);
		}
		else
			obj2 = ctl2;
                if(obj2 != null)
			obj2.value = retval[2];
		var obj3;
		if(typeof(ctl3)!="object" && ctl3 != null){
                	var curnum = Number(ctl3.substr(5));
          		var curcol = Number(ctl3.substr(3,2));
          		var obj3 = findnode(curnum,curcol);
		}
		else
			obj3 = ctl3;
                if(obj3 != null)
			obj3.value = retval[3];
		var obj4;
		if(typeof(ctl4)!="object" && ctl4 != null){
                	var curnum = Number(ctl4.substr(5));
          		var curcol = Number(ctl4.substr(3,2));
          		var obj4 = findnode(curnum,curcol);
		}
		else
			obj4 = ctl4;
                if(obj4 != null)
			obj4.value = retval[4];
		var obj5;
		if(typeof(ctl5)!="object" && ctl5 != null){
                	var curnum = Number(ctl5.substr(5));
          		var curcol = Number(ctl5.substr(3,2));
          		var obj5 = findnode(curnum,curcol);
		}
		else
			obj5 = ctl5;
                if(obj5 != null)
			obj5.value = retval[5];
		var obj6;
		if(typeof(ctl6)!="object" && ctl6 != null){
                	var curnum = Number(ctl6.substr(5));
          		var curcol = Number(ctl6.substr(3,2));
          		var obj6 = findnode(curnum,curcol);
		}
		else
			obj6 = ctl6;
                if(obj6 != null)
			obj6.value = retval[6];
		var obj7;
		if(typeof(ctl7)!="object" && ctl7 != null){
                	var curnum = Number(ctl7.substr(5));
          		var curcol = Number(ctl7.substr(3,2));
          		var obj7 = findnode(curnum,curcol);
		}
		else
			obj7 = ctl7;
                if(obj7 != null)
			obj7.value = retval[7];
		var obj8;
		if(typeof(ctl8)!="object" && ctl8 != null){
                	var curnum = Number(ctl8.substr(5));
          		var curcol = Number(ctl8.substr(3,2));
          		var obj8 = findnode(curnum,curcol);
		}
		else
			obj8 = ctl8;
                if(obj8 != null)
			obj8.value = retval[8];
	}
}

//采购收货选择产品
//增加优惠率
//HZX //2006/06/05
function ReceiptSearchProd2(dialogType,ctl1,ctl2,ctl3,ctl4,ctl5,ctl6,ctl7,ctl8,ctl9,WINname,WINwidth,WINheight){
N = (document.all) ? 0 : 1;

	var endtarget;
	if(dialogType == "RECEIPT_PRODUCT_NOPOS"){
          	var curnum = Number(ctl1.substr(5));
          	var curcol = Number(ctl1.substr(3,2));
          	var obj = findnode(curnum,curcol);
          	var prod_code=obj.value;
		endtarget = "product/product_sel.jsp?input=1";
	}else if(dialogType == "CHINT_PRODUCT_NOPOS"){
          	var obj = document.getElementById(ctl1);
          	var prod_code=obj.value;
		endtarget = "chintproduct/product_sel.jsp?input=1";
      }
	   	showx = window.screen.width /2 - WINwidth/2;
	   	showy = window.screen.height /2 - WINheight/2;

	newWINwidth = WINwidth + 4 + 18;
	var retval;
	if(N){
	    window.top.captureEvents (Event.CLICK|Event.FOCUS);
    	    window.top.onclick=IgnoreEvents;
            window.top.onfocus=HandleFocus;
            winPopupWindow.returnedValue = new Array();
   	    if (dialogType == "POPUPLIST_CONTRACTSTOP" ){
	        if(N){
            	    winPopupWindow.returnFunc = HRMContractN6SubmitDelete;
	        }
	    }
            winPopupWindow.args = ctl;
            winPopupWindow.win = window.open(endtarget,"PopupDialog","dependent=yes,left="+showx + ",top=" + showy + ",width="+newWINwidth + ",height=" + WINheight )
            winPopupWindow.win.focus()
            winPopupWindow.win.screen.top = showy;
            winPopupWindow.win.screen.left = showx;
            return winPopupWindow;
	}else{
		var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:no;Resizeable=no';
	    retval = window.showModalDialog(endtarget, " ", features );
        }
	if( retval != null ){
		var obj1;
		if(typeof(ctl1)!="object" && ctl1 != null){
                	var curnum = Number(ctl1.substr(5));
          		var curcol = Number(ctl1.substr(3,2));
          		var obj1 = findnode(curnum,curcol);
		}
		else
			obj1 = ctl1;
                if(obj1 != null)
			obj1.value = retval[1];
		var obj2;
		if(typeof(ctl2)!="object" && ctl2 != null){
                	var curnum = Number(ctl2.substr(5));
          		var curcol = Number(ctl2.substr(3,2));
          		var obj2 = findnode(curnum,curcol);
		}
		else
			obj2 = ctl2;
                if(obj2 != null)
			obj2.value = retval[2];
		var obj3;
		if(typeof(ctl3)!="object" && ctl3 != null){
                	var curnum = Number(ctl3.substr(5));
          		var curcol = Number(ctl3.substr(3,2));
          		var obj3 = findnode(curnum,curcol);
		}
		else
			obj3 = ctl3;
                if(obj3 != null)
			obj3.value = retval[3];
		var obj4;
		if(typeof(ctl4)!="object" && ctl4 != null){
                	var curnum = Number(ctl4.substr(5));
          		var curcol = Number(ctl4.substr(3,2));
          		var obj4 = findnode(curnum,curcol);
		}
		else
			obj4 = ctl4;
                if(obj4 != null)
			obj4.value = retval[4];
		var obj5;
		if(typeof(ctl5)!="object" && ctl5 != null){
                	var curnum = Number(ctl5.substr(5));
          		var curcol = Number(ctl5.substr(3,2));
          		var obj5 = findnode(curnum,curcol);
		}
		else
			obj5 = ctl5;
                if(obj5 != null)
			obj5.value = retval[5];
		var obj6;
		if(typeof(ctl6)!="object" && ctl6 != null){
                	var curnum = Number(ctl6.substr(5));
          		var curcol = Number(ctl6.substr(3,2));
          		var obj6 = findnode(curnum,curcol);
		}
		else
			obj6 = ctl6;
                if(obj6 != null)
			obj6.value = retval[6];
		var obj7;
		if(typeof(ctl7)!="object" && ctl7 != null){
                	var curnum = Number(ctl7.substr(5));
          		var curcol = Number(ctl7.substr(3,2));
          		var obj7 = findnode(curnum,curcol);
		}
		else
			obj7 = ctl7;
                if(obj7 != null)
			obj7.value = retval[7];
		var obj8;
		if(typeof(ctl8)!="object" && ctl8 != null){
                	var curnum = Number(ctl8.substr(5));
          		var curcol = Number(ctl8.substr(3,2));
          		var obj8 = findnode(curnum,curcol);
		}
		else
			obj8 = ctl8;
                if(obj8 != null)
			obj8.value = retval[8];

                var obj9;
		if(typeof(ctl9)!="object" && ctl9 != null){
                	var curnum = Number(ctl9.substr(5));
          		var curcol = Number(ctl9.substr(3,2));
          		var obj9 = findnode(curnum,curcol);
		}
		else
			obj9 = ctl9;
                if(obj9 != null)
			obj9.value = retval[11];
	}
}

//采购订单显示供应商
function fPopUpDlg(dialogType,ctl1,ctl2,WINname,WINwidth,WINheight){
N = (document.all) ? 0 : 1;

	var endtarget;
	if(dialogType == "POPUPLIST_VENDOR_ID"){
        	endtarget = "vendorDetail.jsp";
	}else if(dialogType == "POPUPLIST_MEETINGADDRESS"){
        	endtarget = "../masterref/popup_meetingAddress.jsp";
	}else if(dialogType == "POPUPLIST_MEETINGTITLE"){
        	endtarget = "../masterref/popup_meetingTitle.jsp";
	}else if(dialogType == "POPUPLIST_REMARK"){
		endtarget = "../masterref/popup_docr.jsp";
	}else if(dialogType == "POPUPLIST_POSITION"){
		endtarget = "../masterref/popup_position.jsp";
	}else if(dialogType == "POPUPLIST_UNIVERSITY"){
		endtarget = "../masterref/popup_university.jsp";
	}else if(dialogType == "POPUPLIST_MAJOR"){
		endtarget = "../masterref/popup_major.jsp";
	}else if(dialogType == "POPUPLIST_ORGAN"){
		endtarget = "../masterref/popup_organ.jsp";
	}else if(dialogType == "POPUPLIST_PROBLEMTYPE"){
		endtarget = "../masterref/popup_problemtype.jsp";
	}else if(dialogType == "POPUPLIST_CERTIFICATION"){
		endtarget = "../masterref/popup_certification.jsp";
	}else if(dialogType == "POPUPLIST_SCHEDULETYPE"){
		endtarget = "../masterref/popup_scheduletype.jsp";
	}else if(dialogType == "POPUPLIST_PLACE"){
		endtarget = "../masterref/popup_place.jsp";
	}else if(dialogType == "POPUPLIST_CONTRACTSTOP"){
		endtarget = "../masterref/popup_contractstop.jsp";
	}else if(dialogType == "POPUPLIST_WHITHER"){
		endtarget = "../masterref/popup_whither.jsp";
	}else if(dialogType == "POPUPLIST_MESSAGETITLE"){
		endtarget = "../masterref/popup_messagetitle.jsp";
	}else if(dialogType == "POPUPLIST_BOOKPURPOSE"){
		endtarget = "../masterref/popup_bookpurpose.jsp";
	} else if(dialogType == "POPUPLIST_CONTRACTSTOP"){
		endtarget = "../masterref/popup_contractstop.jsp";
	}else if(dialogType == "POPUPLIST_APPLICATIONTITLE"){
		endtarget = "../masterref/popup_applicationtitle.jsp";
	}else if(dialogType == "POPUPLIST_DDNAPPLICATIONTITLE"){
		endtarget = "../ddn/popup_ddnApplicationtitle.jsp";
	}else if(dialogType == "POPUPLIST_EMPCURPOSITION"){
		endtarget = "../masterref/popup_empcurposition.jsp";
	}else if(dialogType == "POPUPLIST_SHOWMESSAGETITLE"){
		endtarget = "../masterref/popup_showmessagetitle.jsp";
	}else if(dialogType == "POPUPLIST_COMPANYNAME"){
		endtarget = "../masterref/popup_companyname.jsp";
	}else if(dialogType == "POPUPLIST_BOOKPUBLISHER"){
		endtarget = "../masterref/popup_bookpublisher.jsp";
	}else if(dialogType == "POPUPLIST_BOOKLANGUAGE"){
		endtarget = "../masterref/popup_booklanguage.jsp";
	}else if(dialogType == "POPUPLIST_BOOKCLASSIFY"){
		endtarget = "../masterref/popup_bookclassify.jsp";
	}else if(dialogType == "POPUPLIST_PROVINCE"){
		endtarget = "../masterref/popup_province.jsp";
	}else if(dialogType == "POPUPLIST_RELATIONSHIP"){
		endtarget = "../masterref/popup_relationship.jsp";
	}else if(dialogType == "POPUPLIST_INDUSTRYTYPE"){
		endtarget = "../masterref/popup_industrytype.jsp";
	}else if(dialogType == "POPUPLIST_ENTERPRISETYPE"){
		endtarget = "../masterref/popup_enterprisetype.jsp";
	}else if(dialogType == "POPUPLIST_OPPRSTAGE"){
		endtarget = "../masterref/popup_opprstage.jsp";
	}else if(dialogType == "POPUPLIST_OPPRROLE"){
		endtarget = "../masterref/popup_opprrole.jsp";
	}else if(dialogType == "POPUPLIST_OPPRDOCTYPE"){
		endtarget = "../masterref/popup_opprdoctype.jsp";
	}else if(dialogType == "POPUPLIST_MEASUREUNIT"){
		endtarget = "../masterref/popup_measureunit.jsp";
	}else if(dialogType == "POPUPLIST_GERINFOTYPE"){
		endtarget = "../masterref/popup_gerinfotype.jsp";
	}else if(dialogType == "POPUPLIST_COLORPALATE"){
		endtarget = "../vote/palate.htm";
	}else if(dialogType == "POPUPLIST_SKILLNAME"){
		endtarget = "../masterref/popup_skilllist.jsp";
	}else if(dialogType == "POPUPLIST_SKILLLEVEL"){
		endtarget = "../masterref/popup_skilllevel.jsp";
	}else {
		endtarget = "../masterref/popup_posincharge.htm";
	}
	if(N){
	    	showx = window.screen.width /2;
	    	showy = window.screen.height /2;
	}else{
	    showx = event.screenX - event.offsetX - 4 - WINwidth ; // + deltaX;
	    showy = event.screenY - event.offsetY + 18; // + deltaY;
	}

	if (dialogType == "POPUPLIST_CONTRACTSTOP" ){
	    if(N){
	    	showx = window.screen.width /2;
	    	showy = window.screen.height /2;
	    }else{
	        showx = event.screenX - event.offsetX - WINwidth + 150;
  	        showy = event.screenY - event.offsetY + 20;
	    }
	}
	   	showx = window.screen.width /2 - WINwidth/2;
	   	showy = window.screen.height /2 - WINheight/2;

	newWINwidth = WINwidth + 4 + 18;
	var retval;
	if(N){
	    window.top.captureEvents (Event.CLICK|Event.FOCUS);
    	    window.top.onclick=IgnoreEvents;
            window.top.onfocus=HandleFocus;
            winPopupWindow.returnedValue = new Array();
   	    if (dialogType == "POPUPLIST_CONTRACTSTOP" ){
	        if(N){
            	    winPopupWindow.returnFunc = HRMContractN6SubmitDelete;
	        }
	    }
            winPopupWindow.args = ctl;
            winPopupWindow.win = window.open(endtarget,"PopupDialog","dependent=yes,left="+showx + ",top=" + showy + ",width="+newWINwidth + ",height=" + WINheight )
            winPopupWindow.win.focus()
            winPopupWindow.win.screen.top = showy;
            winPopupWindow.win.screen.left = showx;
            return winPopupWindow;
	}else{
		var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:no;Resizeable=no';
	    retval = window.showModalDialog(endtarget, " ", features );
        }
	if( retval != null ){
		var obj1;
		if(typeof(ctl1)!="object")
			obj1 = document.all.item(ctl1);
		else
			obj1 = ctl1;
		obj1.value = retval[1];
		var obj2;
		if(typeof(ctl2)!="object")
			obj2 = document.all.item(ctl2);
		else
			obj2 = ctl2;
		obj2.value = retval[2];
	}else{
		//alert("canceled");
	}
}

function fPopUpCalendarDlg(ctrlobj)
{   
	if(N){
		
	    showx = 220 ; // + deltaX;
	    showy = 220; // + deltaY;
	}else{
			
	    showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	    showy = event.screenY - event.offsetY + 18; // + deltaY;
        }
	newWINwidth = 210 + 4 + 18;
	if(N){

	    window.top.captureEvents (Event.CLICK|Event.FOCUS);
    	    window.top.onclick=IgnoreEvents;
            window.top.onfocus=HandleFocus;
            winPopupWindow.args = ctrlobj;
            winPopupWindow.returnedValue = new Array();
            // winPopupWindow.returnFunc = PopupRetFunc;
            winPopupWindow.args = ctrlobj;
	    newWINwidth = 202;
            winPopupWindow.win = window.open("../js/CalendarDlg.htm","CalendarDialog","dependent=yes,left="+showx + ",top=" + showy + ",width="+newWINwidth + ",height=182px" )
            winPopupWindow.win.focus()
            return winPopupWindow;
	}else{
		
	    retval = window.showModalDialog("../js/CalendarDlg.jsp", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
 
        }
	if( retval != null ){
		//try{
			
		var obj1;
		if(typeof(ctrlobj)!="object")
			obj1 = document.all.item(ctrlobj);
		else
			obj1 = ctrlobj;
		obj1.value = retval;
		//}catch(E)
		//{}
	}else{
		//alert("canceled");
	}
}

function fPopUpColorDlg(ctrlobj)
{
    if(N){

	    window.top.captureEvents (Event.CLICK|Event.FOCUS);
    	    window.top.onclick=IgnoreEvents;
            window.top.onfocus=HandleFocus;
            winPopupWindow.args = ctrlobj;
            winPopupWindow.returnedValue = new Array();
            winPopupWindow.win = window.open("../vote/palette.htm","CalendarDialog","dependent=yes,width=242px,height=333px" )
            winPopupWindow.win.focus()
            return winPopupWindow;
    }else{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 380 + 4 + 18;

	retval = window.showModalDialog("../vote/palette.htm", "", "dialogWidth:242px; dialogHeight:333px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
	}
    }
}

function fPopUpChart(dialogType,WINwidth,WINheight, para1,para2)
{
    if(N){
	    window.top.captureEvents (Event.CLICK|Event.FOCUS);
    	    window.top.onclick=IgnoreEvents;
            window.top.onfocus=HandleFocus;
	    if(dialogType == "POPUP_VOTECHART"){
		endtarget = "../vote/vote-chart.do?action=Init&serialId=" + para1;
	    }
    	    showx = 30;
	    showy = 30;
            winPopupWindow.win = window.open(endtarget,"CalendarDialog","dependent=yes,width="+WINwidth + ",height="+WINheight + ",left=" + showx + ",top=" + showy  )
            winPopupWindow.win.focus()
            return winPopupWindow;
    }else{
	showx = event.screenX / 3 ; // + deltaX;
	showy = event.screenY / 3 ; // + deltaY;

	var features =
		'dialogWidth:'  + WINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:no;Resizeable=no';

	if(dialogType == "POPUP_VOTECHART"){
		endtarget = "../vote/vote-chart.do?action=Init&serialId=" + para1;
	}
	var retval = window.showModalDialog(endtarget, " ", features );
    }
}

function IOFFICE_GetSelected(aCell)
{
	if(document.all){
  		window.returnValue = aCell.innerText;
		window.close();
	}else{
		// alert(opener.winPopupWindow.returnFunc);
		// alert(aCell.innerHTML);
		// alert(aCell.childNodes[0].nodeValue);
		// alert(opener.winPopupWindow.args);
		// alert(opener.winPopupWindow.args.value);
	        opener.winPopupWindow.returnedValue = aCell.childNodes[0].nodeValue;
		opener.winPopupWindow.args.value = trim(aCell.childNodes[0].nodeValue);
		if(opener.winPopupWindow.returnFunc) opener.winPopupWindow.returnFunc();
 		window.close();
	}

}

//modified by xiongyan
function fPopUpCalendarDlg1(ctrlobj1,ctrlobj2,addYears)
{
	if (!addYears)
		var addYears=3;
	if(N){

	    showx = 220 ; // + deltaX;
	    showy = 220; // + deltaY;
	}else{

	    showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	    showy = event.screenY - event.offsetY + 18; // + deltaY;
        }
	newWINwidth = 210 + 4 + 18;
	if(N){

	    window.top.captureEvents (Event.CLICK|Event.FOCUS);
    	    window.top.onclick=IgnoreEvents;
            window.top.onfocus=HandleFocus;
            winPopupWindow.args = ctrlobj1;
            winPopupWindow.returnedValue = new Array();
            // winPopupWindow.returnFunc = PopupRetFunc;
            winPopupWindow.args = ctrlobj1;
	    newWINwidth = 202;
            winPopupWindow.win = window.open("/cqs/common/CalendarDlg.htm","CalendarDialog","dependent=yes,left="+showx + ",top=" + showy + ",width="+newWINwidth + ",height=182px" )
            winPopupWindow.win.focus()
            return winPopupWindow;
	}else{
	    retval = window.showModalDialog("/cqs/common/CalendarDlg.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
        }
	if( retval != null ){
		ctrlobj1.value = retval;
		var strdate,stryear,strmonth;
		var date1=new Date(retval);
		var temp=new Date(date1.getYear()+addYears,date1.getMonth(),date1.getDate())
		var sec=temp.getTime();
		/*var syear=date1.getYear()+3;
		var all=0;

		for(i=syear;i<syear+3;i++)
		{
			if(i % 4==0 && i % 100 !=0)
				all+=366;
			else
				all+=365;
		}
		alert(all);
		sec=sec+(all-1)*24*60*60*1000;*/
		sec=sec -24*60*60*1000;
		var date2=new Date(sec);
		stryear=date2.getYear();
		strmonth=(date2.getMonth()+1).toString();
		strdate=(date2.getDate()).toString();
		//alert(strdate);
		for(i=0;i<2-strdate.length;i++) strdate="0"+strdate;
		for(i=0;i<2-strmonth.length;i++) strmonth="0"+strmonth;
		ctrlobj2.value = stryear +"/"+ strmonth+"/" + strdate;
	}else{
		//alert("canceled");
	}
}
//选择对话框－二个参数
function popup_dialog2(dialogType,ctl1,ctl2,WINname,WINwidth,WINheight){
	var endtarget;
	if(dialogType == "POPUPLIST_PRODUCT"){//选择产品
		endtarget = "../common/product/product_sel.jsp";
	}else if(dialogType == "POPUPLIST_PRODCLASS"){//选择产品类别
		endtarget = "../common/prodclass/prodclass_sel.jsp";
	}else if(dialogType == "POPUPLIST_DEPT"){//选择部门
		endtarget = "../common/dept/dept_sel.jsp";
	}else if(dialogType == "POPUPLIST_VENDOR"){//选择供应商
        	endtarget = "../common/vendor/vendor_sel.jsp";
	}else if(dialogType == "POPUPLIST_LINKMAN"){//选择客户联系人
          	var clientid = this.form1.Client_ID.value;
        	endtarget = "../common/customer/linkman.jsp?Client_ID="+clientid;
	}
	   	showx = window.screen.width /2 - WINwidth/2;
	   	showy = window.screen.height /2 - WINheight/2;

	newWINwidth = WINwidth + 4 + 18;
	var retval;
	var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar=yes; status=no; toolbar=no;scrollbars:no;resizable=yes';
	    retval = window.showModalDialog(endtarget, " ", features );
	if( retval != null ){
		var obj1;
		if(typeof(ctl1)!="object")
			obj1 = document.all.item(ctl1);
		else
			obj1 = ctl1;
                if(obj1 != null){
			obj1.value = retval[1];
                }
		var obj2;
		if(typeof(ctl2)!="object")
			obj2 = document.all.item(ctl2);
		else
			obj2 = ctl2;
                if(obj2 != null){
			obj2.value = retval[2];
                }
	}
}

// 仓库查询专用
//选择对话框－二个参数
function popup_dialog_query(dialogType,ctl1,ctl2,WINname,WINwidth,WINheight){
	var endtarget;
	endtarget = "../common/prodclass/prodclass_sel.jsp";
		showx = event.screenX - event.offsetX - 4 - WINwidth ; // + deltaX;
		showy = event.screenY - event.offsetY + 18; // + deltaY;


	newWINwidth = WINwidth + 4 + 18;
	var retval;

	var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar=yes; status=no; toolbar=no;scrollbars:no;resizable=yes';
	    retval = window.showModalDialog(endtarget, " ", features );

	if( retval != null ){
		var obj1;
		if(typeof(ctl1)!="object")
			obj1 = document.getElementById(ctl1);
		else
			obj1 = ctl1;
                if(obj1 != null){
					obj1.value = retval[1];
                }
		var obj2;

		if(typeof(ctl2)!="object")
			obj2 = document.getElementById(ctl2);
		else
			obj2 = ctl2;
                if(obj2 != null){
			obj2.value = retval[2];
                }
	}
}

