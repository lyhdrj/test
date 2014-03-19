 var listArray=new Array();
 var isSelect=false;
 var dataIndex;
 var currentIndex;
 var woodDiaArray=new Array();

   /*----------------------------------------------------------------------*/
//  方法名: getDataIndex()
//  描  述：删除一条数据
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/	
 function deleteData(index){
        var deceiptNumAdd=document.all.deceiptNumAdd;
        var woodKindAdd=document.all.woodKindAdd;
        var treeKindAdd=document.all.treeKindAdd;
        var woodGradeAdd=document.all.woodGradeAdd;
        var woodlen=document.all.woodlen;
        var wooddia=document.all.wooddia;
        var woodnum=document.all.woodnum;
        var woodstere=document.all.woodstere;
        var state=deceiptNumAdd[index].value+woodKindAdd[index].value+treeKindAdd[index].value+woodGradeAdd[index].value+woodlen[index].value+wooddia[index].value;
        var flagArray;
        for(var i=0;i<listArray.length;i++){
        flagArray=listArray[i];
         for(var j=0;j<flagArray.length;j++){
		    if(flagArray[j]!="NO"){
		      arrayState=flagArray[j][0]+flagArray[j][1]+flagArray[j][2]+flagArray[j][3]+flagArray[j][4]+flagArray[j][5];
		            if(Trim(arrayState)==Trim(state)){
		              flagArray[j]="NO";
		            }
		      }
		    }
		 }
 }
  /*----------------------------------------------------------------------*/
//  方法名: getDataIndex()
//  描  述：因为数据的索引和每行的索引不同，得到数据的索引值，当删除和修改时用
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/	
 function getDataIndex(index){
        var deceiptNumAdd=document.all.deceiptNumAdd;
        var woodKindAdd=document.all.woodKindAdd;
        var treeKindAdd=document.all.treeKindAdd;
        var woodGradeAdd=document.all.woodGradeAdd;
        var woodlen=document.all.woodlen;
        var wooddia=document.all.wooddia;
        var state=deceiptNumAdd[index].value+woodKindAdd[index].value+treeKindAdd[index].value+woodGradeAdd[index].value+woodlen[index].value+wooddia[index].value;
        var arrayState;
        var flagArray;
        var indexArray=new Array();
	    for(var i=0;i<listArray.length;i++){
	      flagArray=listArray[i];
	       for(var j=0;j<flagArray.length;j++){
	         if(flagArray[j]!="NO"){
		      arrayState=flagArray[j][0]+flagArray[j][1]+flagArray[j][2]+flagArray[j][3]+flagArray[j][4]+flagArray[j][5];
		            if(Trim(arrayState)==Trim(state)){
		                indexArray[indexArray.length]=i;
		                indexArray[indexArray.length]=j;
		                return indexArray;
		            }
		      }
	       }   
	    }
 }   
  function selectListener(){
  
  
  }
 /*----------------------------------------------------------------------*/
//  方法名: setListData()
//  描  述：把数据放到数据组进行存储
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/	
 
 function setListData(obj){
        var lenghaoSelect=document.all.lenghaoSelect;
        var woodKind=document.all.woodKindSelect;
        var treeKind=document.all.treeKindSelect;
        var woodGrade=document.all.woodGradeSelect;
        var caichang=document.all.caichang;
        var genshu=document.all.genshu;
        var jingji=document.all.jingji;
        var caiji=document.all.caiji;
        var danjia=document.all.danjia;
        var jine=document.all.jine;
        var woodLenMin=document.all.woodLenMin;
        var woodLenMax=document.all.woodLenMax;
		setWoodDiaData(woodKind.options[woodKind.selectedIndex].text,treeKind.options[treeKind.selectedIndex].text,woodGrade.options[woodGrade.selectedIndex].text,obj);
        var state=woodKind.options[woodKind.selectedIndex].text+treeKind.options[treeKind.selectedIndex].text+woodGrade.options[woodGrade.selectedIndex].text;
        var arrayState;
        var isSame=false;
        var isFlagSame=false;
        var indexIn;
        var indexOut;
        var dataArray;
        var data=state+caichang.value+jingji.value;
        var in1;
        var out;
        var woodLenMinMax;
	    for(var i=0;i<listArray.length;i++){
	       dataArray=listArray[i];       
	       for(var j=0;j<dataArray.length;j++){
			    if(dataArray[j]!="NO"){
			      arrayState=dataArray[j][1]+dataArray[j][2]+dataArray[j][3];
			         if(parseInt(lenghaoSelect.value) == parseInt(dataArray[j][0])){  //按楞号分组
			      		if(Trim(arrayState)==Trim(state)){ //材种、树种、等级相等
			                   if(parseFloat(caichang.value) == parseFloat(dataArray[j][4])){
			            	  	  isFlagSame=true; //材长相等
				                  indexOut=i;
				                  arrayState=arrayState+dataArray[j][4]+dataArray[j][5];
				                  		if(Trim(arrayState)==Trim(data)){
					                        isSame=true;
							                indexIn=j;
				                  		}
				              }
			     		}	
					}
			    }
			}
	    }
	    if(isFlagSame){
	    
	     var flagArray=listArray[indexOut];
	     var array=new Array();
	     array[array.length]=lenghaoSelect.options[lenghaoSelect.selectedIndex].text;
	     array[array.length]=woodKind.options[woodKind.selectedIndex].text;
         array[array.length]=treeKind.options[treeKind.selectedIndex].text;
         array[array.length]=woodGrade.options[woodGrade.selectedIndex].text;
         array[array.length]=caichang.value;
         array[array.length]=jingji.value;
         array[array.length]=genshu.value;
         array[array.length]=caiji.value;
         array[array.length]=danjia.value;
         array[array.length]=jine.value;
         array[array.length]=woodLenMin.value;
         array[array.length]=woodLenMax.value;
	         if(isSame){
	            if(isSelect){
	             out=dataIndex[0];
                 in1=dataIndex[1];
	             listArray[out][in1]="NO";
	            }
	              flagArray[indexIn]=array;
	         }else{
	          if(isSelect){
	              out=dataIndex[0];
                  in1=dataIndex[1];
	              listArray[out][in1]="NO";
	           }
	          flagArray[flagArray.length]=array;
	         }
	         
	    }else{
	    
	     var array=new Array();
	     var flagArray=new Array();
	     array[array.length]=lenghaoSelect.options[lenghaoSelect.selectedIndex].text;
         array[array.length]=woodKind.options[woodKind.selectedIndex].text;
         array[array.length]=treeKind.options[treeKind.selectedIndex].text;
         array[array.length]=woodGrade.options[woodGrade.selectedIndex].text;
         array[array.length]=caichang.value;
         array[array.length]=jingji.value;
         array[array.length]=genshu.value;
         array[array.length]=caiji.value;
         array[array.length]=danjia.value;
         array[array.length]=jine.value;
         array[array.length]=woodLenMin.value;
         array[array.length]=woodLenMax.value;
	     if(isSelect){
	             out=dataIndex[0];
                 in1=dataIndex[1];
	             listArray[out][in1]="NO";
	      }
	     flagArray[flagArray.length]=array;
	     listArray[listArray.length]=flagArray;
	     
	    }
		flagArray.sort(sortRuleWoodDia); //按径级排序
       
  }
  function getWoodLenMinMax(flag,woodLen){
        var dia;
      
        for(var m=0;m<woodDiaArray.length;m++){
             dia=woodDiaArray[m];
            if(dia.flag==flag){
              return  dia;
          }
        }  
        return "NO";
  }
   /*----------------------------------------------------------------------*/
//  方法名: reWrite()
//  描  述：删除数据
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/	
 function reWrite(obj){
		var tableObj=document.getElementById("xianshitabGrid");
		for(var i=tableObj.rows.length;i>0;i--){
		tableObj.deleteRow(tableObj.rows.length-1);
		}
 }
 /*----------------------------------------------------------------------*/
//  方法名: reWriteData()
//  描  述：重新给数据赋值
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/	
 function reWriteDatas(){
            var totalStere=document.all.totalStere;
            var totalNum=document.all.totalNum;
            var totalPrice=document.all.totalPrice;
            var index=0;
            var caichang=document.all.woodlen;
            var flagArray;
            var state='';
            var flagDia;
            var woodNumDiaXJ=0;
            var woodStereDiaXJ=0;
            var woodPriceDiaXJ=0;
            var woodNumXJ=0;
            var woodStereXJ=0;
            var woodPriceXJ=0;
            var totalWoodPrice=0;
            var totalWoodNum=0;
            var totalWoodStere=0;
            var index=0;
            var indexdia=0;
            var state;
            listArray.sort(sortRuleWoodLen);
            listArray.sort(sortRuleLenghao);   
	            for(var i=0;i<listArray.length;i++){
	              woodNumXJ=0;
	              woodStereXJ=0;
	              woodPriceXJ=0;
	              flagArray=listArray[i];
	              index=0;
	              for(var m=0;m<woodDiaArray.length;m++){
					      dia=woodDiaArray[m];
					      indexdia=0;
					      woodNumDiaXJ=0;
                          woodStereDiaXJ=0;
                          woodPriceDiaXJ=0;
                         
		               for(var j=0;j<flagArray.length;j++){
		                  listData=flagArray[j];
		                    if(listData!="NO"){
		                      state=listData[1]+listData[2]+listData[3];
		                  
		                        if(dia.flag==state&&
		                        parseFloat(dia.woodLenMin)<=parseFloat(listData[4])&&parseFloat(listData[4])<=parseFloat(dia.woodLenMax)&&
		                        parseFloat(dia.woodDiaMin)<=parseFloat(listData[5])&&parseFloat(listData[5])<=parseFloat(dia.woodDiaMax)){ 
		                                          
			                       index++;
			                       indexdia++;
			                       addRowsGrid(listData);
			                       woodNumXJ=parseFloat(woodNumXJ)+parseFloat(listData[6]);
			                       woodStereXJ=parseFloat(woodStereXJ)+parseFloat(listData[7]);
			                       woodPriceXJ=parseFloat(woodPriceXJ)+parseFloat(listData[9]);
			                       woodNumDiaXJ=parseFloat(woodNumDiaXJ)+parseFloat(listData[6]);
			                       woodStereDiaXJ=parseFloat(woodStereDiaXJ)+parseFloat(listData[7]);
			                       woodPriceDiaXJ=parseFloat(woodPriceDiaXJ)+parseFloat(listData[9]);
			                       if(listData[0]!="按材长小计"&&listData[0]!="按径级小计"){
					                  totalWoodNum=parseFloat(totalWoodNum)+parseFloat(listData[6]);
					                  totalWoodStere=parseFloat(totalWoodStere)+parseFloat(listData[7]);
					                  totalWoodPrice=parseFloat(totalWoodPrice)+parseFloat(listData[9]);
					               }
				             
		                    }
			                    
		                   }
		                 }
	                        if(indexdia>0){
			                    woodNumDiaXJ=getValue(woodNumDiaXJ);
						        woodStereDiaXJ=getValue(woodStereDiaXJ);
						        woodPriceDiaXJ=getPriceValue(woodPriceDiaXJ); 
					            addRowDiaXJ(woodNumDiaXJ,woodStereDiaXJ,woodPriceDiaXJ);
				            }
	               }
	                if(index>0){
	                    woodNumXJ=getValue(woodNumXJ);
				        woodStereXJ=getValue(woodStereXJ);
				        woodPriceXJ=getPriceValue(woodPriceXJ); 
			            addRowXJ(woodNumXJ,woodStereXJ,woodPriceXJ);
			        }
	         }    
	        totalWoodNum=getValue(totalWoodNum);
		    totalWoodStere=getValue(totalWoodStere);
		    totalWoodPrice=getPriceValue(totalWoodPrice); 
	        totalNum.value=totalWoodNum;
            totalStere.value=totalWoodStere;
            totalPrice.value=totalWoodPrice;
            
 }

 /*----------------------------------------------------------------------*/
//  方法名: selectEvent()
//  描  述：当双击要修改的数据时，把对应的值赋值到上面的录入框
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/	 
	 function selectEvent(textObj,obj,nextObj){
	    var value=obj.options[obj.selectedIndex].text;
	    document.getElementById(textObj).value=value;
	    document.getElementById(textObj).focus();
	 }
 /*----------------------------------------------------------------------*/
//  方法名: updateData()
//  描  述：当双击要修改的数据时，把对应的值赋值到上面的录入框
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/
     function updateData(obj){
        var lenghaoText=document.all.lenghao;
        var woodKindText=document.all.woodKind;
        var treeKindText=document.all.treeKind;
        var woodGradeText=document.all.woodGrade;
        var lenghaoSelect=document.all.lenghaoSelect;
        var woodKind=document.all.woodKindSelect;
        var treeKind=document.all.treeKindSelect;
        var woodGrade=document.all.woodGradeSelect;
        var caichang=document.all.caichang;
        var genshu=document.all.genshu;
        var jingji=document.all.jingji;
        var caiji=document.all.caiji;
        var danjia=document.all.danjia;
        var jine=document.all.jine;
        var deceiptNumAdd=document.all.deceiptNumAdd;
        var woodKindAdd=document.all.woodKindAdd;
        var treeKindAdd=document.all.treeKindAdd;
        var woodGradeAdd=document.all.woodGradeAdd;
        var woodlen=document.all.woodlen;
        var wooddia=document.all.wooddia;
        var woodnum=document.all.woodnum;
        var woodstere=document.all.woodstere;
        var priceAdd=document.all.priceAdd;
        var totalPriceAdd=document.all.totalPriceAdd;
       
        if("undefined"==typeof woodlen.length){  
                setValue(lenghaoSelect,deceiptNumAdd);   
                setValue(woodKind,woodKindAdd);
                setValue(treeKind,treeKindAdd);
                setValue(woodGrade,woodGradeAdd);
                woodKindText.value=woodKindAdd.value;
                treeKindText.value=treeKindAdd.value;
                woodGradeText.value=woodGradeAdd.value;
                caichang.value=woodlen.value;
                genshu.value=woodnum.value;
                jingji.value=wooddia.value;
                caiji.value=woodstere.value;
                danjia.value=priceAdd.value;
                jine.value=totalPriceAdd.value;
         
        }else{
          
                var i=parseFloat(obj);
                setValue(lenghaoSelect,deceiptNumAdd[i]); 
                setValue(woodKind,woodKindAdd[i]);
                setValue(treeKind,treeKindAdd[i]);
                setValue(woodGrade,woodGradeAdd[i]);
                woodKindText.value=woodKindAdd[i].value;
                treeKindText.value=treeKindAdd[i].value;
                woodGradeText.value=woodGradeAdd[i].value;
                caichang.value=woodlen[i].value;
                genshu.value=woodnum[i].value;
                jingji.value=wooddia[i].value;
                caiji.value=woodstere[i].value;
                danjia.value=priceAdd[i].value;
                jine.value=totalPriceAdd[i].value;
        }
        
     } 
/*----------------------------------------------------------------------*/
//  方法名: setValue()
//  描  述：当双击要修改的数据时，把对应的值赋值到上面的录入框
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/
     function setValue(first,sencond){
         for(var i=0;i<first.length;i++){
             if(Trim(first.options[i].text)==Trim(sencond.value)){
                  first[i].selected=true;
             }
         }
     }
/*----------------------------------------------------------------------*/
//  方法名: mouseCome()
//  描  述：当双击数据时激发的事件
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/
      function mouseCome(obj)
 {
        isSelect=true;
        var   srcObj   =   event.srcElement;  
        var id=obj.id;
        var   what   =   document.all(id); 
        var deceiptNumAdd=document.all.deceiptNumAdd;
        var woodKindAdd=document.all.woodKindAdd;
        var treeKindAdd=document.all.treeKindAdd;
        var woodGradeAdd=document.all.woodGradeAdd;
        var woodlen=document.all.woodlen;
        var wooddia=document.all.wooddia;
        var woodnum=document.all.woodnum;
        var woodstere=document.all.woodstere;
        var priceAdd=document.all.priceAdd;
        var totalPriceAdd=document.all.totalPriceAdd;
        var del=document.all.del;
           if("undefined"==typeof woodlen.length){ 
          
                 deceiptNumAdd.style.background="#00AEEF";
                 woodKindAdd.style.background="#00AEEF";
                 treeKindAdd.style.background="#00AEEF";
                 woodGradeAdd.style.background="#00AEEF";
                 woodlen.style.background="#00AEEF";
                 wooddia.style.background="#00AEEF";
                 woodnum.style.background="#00AEEF";
                 woodstere.style.background="#00AEEF";
                 priceAdd.style.background="#00AEEF";
                 totalPriceAdd.style.background="#00AEEF";
                 del.style.background="#00AEEF";
           }else
           {
                for(var i=0;i<woodlen.length;i++)   
               {  
             
                      if(what[i]==srcObj) 
                      {
                         deceiptNumAdd[i].style.background="#00AEEF";
		                 woodKindAdd[i].style.background="#00AEEF";
		                 treeKindAdd[i].style.background="#00AEEF";
		                 woodGradeAdd[i].style.background="#00AEEF";
		                 woodlen[i].style.background="#00AEEF";
		                 wooddia[i].style.background="#00AEEF";
		                 woodnum[i].style.background="#00AEEF";
		                 woodstere[i].style.background="#00AEEF";
		                 priceAdd[i].style.background="#00AEEF";
		                 totalPriceAdd[i].style.background="#00AEEF";
		                  del[i].style.background="#00AEEF";
		                  currentIndex=i;
		                  dataIndex=getDataIndex(i);
		                  updateData(currentIndex);
                      }
                      else
                      {
                         deceiptNumAdd[i].style.background="";
                         woodKindAdd[i].style.background="";
		                 treeKindAdd[i].style.background="";
		                 woodGradeAdd[i].style.background="";
		                 woodlen[i].style.background="";
		                 wooddia[i].style.background="";
		                 woodnum[i].style.background="";
		                 woodstere[i].style.background="";
		                 priceAdd[i].style.background="";
		                 totalPriceAdd[i].style.background="";
                         del[i].style.background="";
                      }
                   
                }
            }
  }  
     /*----------------------------------------------------------------------*/
//  方法名: cleanData()
//  描  述：当录入一条信息后，把径级，根数，材积清空
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/
  function cleanData(){
        var jingji=document.all.jingji;
        var genshu=document.all.genshu;
        var caiji=document.all.caiji;
        var danjia=document.all.danjia;
        var jine=document.all.jine;
        jingji.value="";
        genshu.value="";
        caiji.value="";
        jingji.focus();
        danjia.value="";
        jine.value="";
  }

 /*----------------------------------------------------------------------*/
//  方法名: getCode(allData)
//  描  述：得到选择框文本值对应的代码
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/
 function getCode(first,srcobj){
        var arrobj=document.getElementById(srcobj);
        for(var i=0;i<arrobj.length;i++){
          if(Trim(arrobj.options[i].text)==Trim(first.value)){
              return arrobj.options[i].value;
          }    
        }
 }
 /*----------------------------------------------------------------------*/
//  方法名: mousedbclick(allData)
//  描  述：当鼠标单击的时候激发的事件，取消选中状态的数据
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/
     function mousedbclick(){
        isSelect=false;
        var deceiptNumAdd=document.all.deceiptNumAdd;
        var woodKindAdd=document.all.woodKindAdd;
        var treeKindAdd=document.all.treeKindAdd;
        var woodGradeAdd=document.all.woodGradeAdd;
        var woodlen=document.all.woodlen;
        var wooddia=document.all.wooddia;
        var woodnum=document.all.woodnum;
        var woodstere=document.all.woodstere;
        var priceAdd=document.all.priceAdd;
        var totalPriceAdd=document.all.totalPriceAdd;
        var del=document.all.del;
        if("undefined"==typeof woodlen){
            return;
        }
           if("undefined"==typeof woodlen.length){ 
                 deceiptNumAdd.style.background="#00AEEF";
                 woodKindAdd.style.background="#00AEEF";
                 treeKindAdd.style.background="#00AEEF";
                 woodGradeAdd.style.background="#00AEEF";
                 woodlen.style.background="#00AEEF";
                 wooddia.style.background="#00AEEF";
                 woodnum.style.background="#00AEEF";
                 woodstere.style.background="#00AEEF";
                 priceAdd.style.background="#00AEEF";
                 totalPriceAdd.style.background="#00AEEF";
                 del.style.background="#00AEEF";
           }else
           {
                for(var i=0;i<woodlen.length;i++)   
               {  
                         deceiptNumAdd[i].style.background="";
                         woodKindAdd[i].style.background="";
		                 treeKindAdd[i].style.background="";
		                 woodGradeAdd[i].style.background="";
		                 woodlen[i].style.background="";
		                 wooddia[i].style.background="";
		                 woodnum[i].style.background="";
		                 woodstere[i].style.background="";
		                 priceAdd[i].style.background="";
		                 totalPriceAdd[i].style.background="";
                         del[i].style.background="";
                      
                  } 
                
            }
  }  
  function sortListener(data){
     var datas;
       for(var i=0;i<data.length;i++){
          datas=data[i];
          if(datas!="NO"){
             return datas[4];
          }
       }
       return "NO";
  }
    //设置径级监听
    function sortDiaListener(data){
     var datas;
     var dia;
       for(var i=0;i<data.length;i++){
          datas=data[i];
          if(datas!="NO"){
              for(var j=0;j<datas.length;j++){
                 dia=datas[j];
                 if(dia!="NO"){
                   return datas[5];
                 }
              }
          }
       }
       return "NO";
  }


//  方法名: sortRuleDiaMax(allData)
//  描  述：找出径级中最大的，然后按升序排列
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/ 
  function sortRuleDiaMax(data1,data2)//排序　材长
{
	 var firstDataArray= data1.woodDiaMax;
	 var secondDataArray=data2.woodDiaMax;
	 if(firstDataArray=="NO"){
        return -1;
     }else if(secondDataArray=="NO"){
         return 1;
     }
	 data1=parseFloat(firstDataArray);
	 data2=parseFloat(secondDataArray);
	if(parseFloat(data1)>parseFloat(data2))return 1
	if(parseFloat(data1)==parseFloat(data2))return 0
	if(parseFloat(data1)<parseFloat(data2))return -1
}
/*----------------------------------------------------------------------*/
//  方法名: sortRule(allData)
//  描  述：将排序后的数据显示出来
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/
  function sortRuleWoodLen(data1,data2)//排序　材长
{
    
	 var firstDataArray=sortListener(data1);
	 var secondDataArray=sortListener(data2);
	 if(firstDataArray=="NO"){
        return -1;
     }else if(secondDataArray=="NO"){
         return 1;
     }
	 data1=parseFloat(firstDataArray);
	 data2=parseFloat(secondDataArray);
	if(parseFloat(data1)>parseFloat(data2))return 1
	if(parseFloat(data1)==parseFloat(data2))return 0
	if(parseFloat(data1)<parseFloat(data2))return -1
}
/*----------------------------------------------------------------------*/
//  方法名: sortRuleLenghao(allData)
//  描  述：按楞号排序
//  返回值：
//  参数说明：
//	
//  
// author:曹振海
/*-----------------------------------------------------------------------*/
function sortRuleLenghao(data1,data2)//排序　楞号
{
	     if(data1=="NO"){
	        return -1;
	     }else if(data2=="NO"){
	         return 1;
	     }
	     
		 var firstDataArray=data1[0] =="NO"?data1[1]:data1[0];	
		 var secondDataArray=data2[0]=="NO"?data2[1]:data2[0];
		 data1=parseInt(firstDataArray);
		 data2=parseInt(secondDataArray);
		if(parseInt(data1)>parseInt(data2))return 1
		if(parseInt(data1)==parseInt(data2))return 0
		if(parseInt(data1)<parseInt(data2))return -1
}
/*----------------------------------------------------------------------*/
//  方法名: sortRule(allData)
//  描  述：将排序后的数据显示出来
//  返回值：
//  参数说明：
//	
//  
// author:于景文
/*-----------------------------------------------------------------------*/
	  function sortRuleWoodDia(data1,data2)//排序　径级
	{
	   
	     var firstDataArray=data1[5];
	 var secondDataArray=data2[5];
		 if(firstDataArray=="NO"){
	        return -1;
	     }else if(secondDataArray=="NO"){
	         return 1;
	     }
	
		 data1=parseFloat(firstDataArray);
		 data2=parseFloat(secondDataArray);
		if(parseFloat(data1)>parseFloat(data2))return 1
		if(parseFloat(data1)==parseFloat(data2))return 0
		if(parseFloat(data1)<parseFloat(data2))return -1
	}	
	function getPriceValue(obj){
	    obj=Math.floor((obj+parseFloat(0.005))*parseFloat(100));
	    obj=obj/parseFloat(100); 
	    return obj;   
	}
	
	function getValue(obj){
	    obj=Math.floor((obj+parseFloat(0.00005))*parseFloat(10000));
	    obj=obj/parseFloat(10000); 
	    return obj;   
	}
    //验证价格的方法
    function checkPriceCommRfid(values)
    { 
     
        var flag=values[1];  
        var id=values[2]; 
        var nextObj=values[3];
      
          if(flag=='false'){
            alert("信息在数据库中没有匹配的价格记录,请重新输入");
            return;
           }       
           checkPriceValue('first');
           priceValue('first',nextObj);
           submitForm2(id);
    }

	 function setWoodDiaData(woodKind,treeKind,woodGrade,woodData){
	   
	    var woodLenMin=woodData[1];
	    var woodLenMax=woodData[2];
	    var woodDiaMin=woodData[3];
	    var woodDiaMax=woodData[4];
	    var dia;
	    var state;
	    dia=new Object();
        state=woodKind+treeKind+woodGrade;
        dia.flag=state;
        dia.woodLenMin=woodLenMin;
        dia.woodLenMax=woodLenMax;
        dia.woodDiaMin=woodDiaMin;
        dia.woodDiaMax=woodDiaMax;
        isSameDia(dia);   
	 }

	 function isSameDia(data){
	    var dia;
	    var flag=false;
	    if(woodDiaArray.length==0){
	       woodDiaArray[woodDiaArray.length]=data;  
	    }else{
		    for(var i=0;i<woodDiaArray.length;i++) {
		      dia=woodDiaArray[i];
		         if(Trim(dia.flag)==Trim(data.flag)&&
		         Trim(dia.woodLenMin)==Trim(data.woodLenMin)&&
		         Trim(dia.woodLenMax)==Trim(data.woodLenMax)&&
		         Trim(dia.woodDiaMin)==Trim(data.woodDiaMin)&&
		         Trim(dia.woodDiaMax)==Trim(data.woodDiaMax)){  
		         flag=true;
		         }
		     }
		     if(!flag){
		          woodDiaArray[woodDiaArray.length]=  data;
		          woodDiaArray.sort(sortRuleDiaMax); //按径级排序
		     }
	    }
	 }