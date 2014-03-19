/**
 * ������������ת�������Ĵ�д 
 */
package com.nasoft.util;

/**
 * @author zhengjiang
 * ����ʱ�� 2008-09-08
 */
public class MoneyFormat {
	//����ʱ��main����
	 public static void main(String args[]){
	  MoneyFormat mon = new MoneyFormat();
//	  System.out.println(-99999999999999.999+mon.NumToRMBStr(-99999999999999.999));
//	  System.out.println(mon.NumToRMBStr(456987235.20));
	 }
	 
	 String HanDigiStr[] = new String[]{"��","Ҽ","��","��","��","��","½","��","��","��"};


	 String HanDiviStr[] = new String[]{"","ʰ","��","Ǫ","��","ʰ","��","Ǫ","��",
	     "ʰ","��","Ǫ","��","ʰ","��","Ǫ","��",
	     "ʰ","��","Ǫ","��","ʰ","��","Ǫ" };
	     
	 
	 String PositiveIntegerToHanStr(String NumStr)
	 {     // �����ַ���������������ֻ����ǰ���ո�(�����Ҷ���)��������ǰ����
	  String RMBStr = "";
	  boolean lastzero = false;
	  boolean hasvalue= false;       // �ڡ����λǰ����ֵ���
	  int len,n;
	  len = NumStr.length();
	  if( len > 15 ) return "��ֵ����!";
	  for(int i=len-1;i>=0;i--) {
	   if( NumStr.charAt(len-i-1)==' ' ) continue;      
	   n = NumStr.charAt(len-i-1) - '0';
	   if( n<0 || n>9 ) return "���뺬�������ַ�!";
	   
	   if( n!=0 ) {
	    if( lastzero ) RMBStr += HanDigiStr[0];  // ���������������ֵ��ֻ��ʾһ����
	            // ��������ǰ���㲻��������
	    //if( !( n==1 && (i%4)==1 && (lastzero || i==len-1) ) )    // ��ʮ��λǰ����Ҳ����Ҽ���ô���
	    if( !( n==1 && (i%4)==1 && i==len-1 ) )     // ʮ��λ���ڵ�һλ����Ҽ��
	     RMBStr += HanDigiStr[n];
	    RMBStr += HanDiviStr[i];    // ����ֵ��ӽ�λ����λΪ��
	    hasvalue = true;                                    // �����λǰ��ֵ���
	    
	   }else {
	    if( (i%8)==0 || ((i%8)==4 && hasvalue) )  // ����֮������з���ֵ����ʾ��
	     RMBStr += HanDiviStr[i];   // ���ڡ�����
	   }
	   if( i%8==0 ) hasvalue = false ;      // ���λǰ��ֵ��Ƿ��ڸ�λ
	   lastzero = (n==0) && (i%4!=0);    
	   }
	 
	  if( RMBStr.length()==0 ) return HanDigiStr[0];         // ������ַ���"0"������"��"
	  return RMBStr;
	 }
	 
	 public String NumToRMBStr(double val)
	 {
	  String SignStr ="" ;
	  String TailStr ="";
	  long  fraction, integer;
	  int jiao,fen;
	 
	  if( val<0 ) {
	   val = -val;
	   SignStr = "��";
	   }
	  if(val > 99999999999999.999 || val <-99999999999999.999 ) return "��ֵλ������!";
	  // �������뵽��  
	  long temp = Math.round(val*100); 
	  integer = temp/100;
	  fraction = temp%100;
	  jiao = (int)fraction/10;
	  fen = (int)fraction%10;
	  if( jiao==0 && fen==0 ) {
	   TailStr = "��";
	   }
	  else {
	   TailStr = HanDigiStr[jiao];
	   if( jiao!=0 )
	    TailStr += "��";
	   if( integer==0 && jiao==0 )                // ��Ԫ��д�㼸��
	    TailStr = "";
	   if( fen!=0 )
	    TailStr += HanDigiStr[fen] + "��";
	   }
	 
	 // ��һ�п����ڷ�������ڳ��ϣ�0.03ֻ��ʾ�����֡������ǡ���Ԫ���֡�
	 //        if( !integer ) return  SignStr+TailStr;
	 
	  return SignStr+PositiveIntegerToHanStr(String.valueOf(integer) )+"Ԫ"+TailStr;
	 }
	 
	}//END public class money
