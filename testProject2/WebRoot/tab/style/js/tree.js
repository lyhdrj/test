function menuShow(obj,maxh,obj2)

{

  if(obj.style.pixelHeight<maxh)

  {

    obj.style.pixelHeight+=maxh/20;

	obj.filters.alpha.opacity+=5;

    if(obj.style.pixelHeight==maxh/10)

	  obj.style.display='block';

	myObj=obj;

	myMaxh=maxh;

	myObj2=obj2;

	setTimeout('menuShow(myObj,myMaxh,myObj2)','5');

  }

}

function menuHide(obj,maxh,obj2)

{

  if(obj.style.pixelHeight>0)

  {

    if(obj.style.pixelHeight==maxh/20)

	  obj.style.display='none';

    obj.style.pixelHeight-=maxh/20;

	obj.filters.alpha.opacity-=5;

	myObj=obj;

	myMaxh=maxh

	myObj2=obj2;

	setTimeout('menuHide(myObj,myMaxh,myObj2)','5');

  }

  else

    if(whichContinue)

	  whichContinue.click();

}

function menuChange(obj,maxh,obj2)

{

  if(obj.style.pixelHeight)

  {

    menuHide(obj,maxh,obj2);

	whichOpen='';

	whichcontinue='';

  }

  else

    if(whichOpen)

	{

	  whichContinue=obj2;

      whichOpen.click();

	}

	else

	{

	  menuShow(obj,maxh,obj2);

	  whichOpen=obj2;

	  whichContinue='';

	}

}
