

 function selectSameValue(value,obj)// ��ѯд��Ĵ�����select���Ƿ����
   {
    
       var optionValue;
          if("undefined"==typeof obj.length)
           {
            obj[0].selected=true;
           }else
           {
                 for(var i=0;i<obj.length;i++)   
                 {   
                     optionValue=obj[i].value;
                     if(optionValue==value)
                     {
                   
                       obj[i].selected=true;   
                    
                     } 
                 } 
           }
   }
  

