    function addRow($obj) {
			var _lastTr=$obj.firstChild;
			var _newTr=_lastTr.cloneNode(true);
			_newTr.style.display="block";
			$obj.appendChild(_newTr);
		}
        function getRowIdPosition(obj){
          var arrObj=document.all(obj);   
          var srcObj=event.srcElement;   
          if("undefined"==typeof arrObj.length)
          {
              return first;    
          }else{
             for(var i=0;i<arrObj.length;i++)   
             {   
                 if(srcObj == arrObj[i])   
                  {  
                    return i;	
                  }       
              }   
           } 
        }
        
       function getRowId(){
          var rowId=document.getElementById("rowId");
          alert(rowId.value);
          var value=rowId.value;
          rowId.value=parseFloat(rowId.value)+1;
          return value;
        }
        
    function checkTagValue($obj){
     var tdObj=$obj.parentNode;
     var selectObj;
     var i=0;
     while(i<100){
       if(tdObj.tagName=='TD'||tdObj.tagName=='td'){
         break;
       }else{
        tdObj=tdObj.parentNode;
       }
       i++;
     }
     i=0;
     selectObj=tdObj.childNodes[0];
     while(i<100){
        if(selectObj.tagName=='SELECT'||selectObj.tagName=='select'){
            if(Trim(selectObj.value)==''){
              $obj.value="";
			  selectObj.value='NO';
            }
            break;  
        } else{
         selectObj=selectObj.childNodes[0];
        }
        i++;   
     }			
}    

      