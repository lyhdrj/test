package com.nasoft.util;

import java.util.HashMap;
import java.util.List;

public class ChangeUtil {
	/**
	 * ���ڰ���λ�ַ������·ݻ�����ת������������
	 * @param String tmp
	 * @return int 
	 */
	public static int changeStringToInt(String tmp){
		int i = 0;
		String first = "";
		int second = 0;
		if(tmp!=null && !tmp.equals("")){
			first = tmp.trim().substring(0,1);
			second = Integer.parseInt(tmp.trim().substring(1,2));
		}else{
			return i;
		}
		if(first.equals("0")){
			i = second;
		}else{
			i = Integer.parseInt(tmp);
		}
		return i;
	}
	/**
	 * ���ڰ�һλ����λ������ת�����ַ���
	 * @param int tmp
	 * @return String 
	 */
	public static String changeIntToString(int tmp){
		String str = "";
		if(tmp>0 && tmp<10){
			str = "0"+tmp;
		}else if(tmp>=10 && tmp<12){
			str = ""+tmp;
		}
		return str;
	}
	public static void main(String []args){
//		System.out.println(ChangeUtil.changeIntToString(9));
		//System.out.println(ChangeUtil.getStartDate("2008-12-29"));
	}
	

}
