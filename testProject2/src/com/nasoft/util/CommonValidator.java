package com.nasoft.util;
/**
 * ������֤����
 * �����ˣ�david
 * ����ʱ�䣺2009.05.08
*/
public class CommonValidator {
	public final static String NUMTYPE="(-)?[0-9]*";			//��������
	public final static String CHARACTARTYPE="[a-zA-Z]*";	//�ַ�����
	public final static String CHARANDNUMTYPE="[0-9a-zA-Z]*";	//���ֺ��ַ�����
	public final static String CHINESETYPE="[\u4e00-\u9fa5\\.]*";	//��������
	public final static String ALLTYPE = "[\\w*\u4e00-\u9fa5]*";	//���֣����֣��ַ�
	public final static String FLOATTYPE="(-)?[0-9]*(\\.)?[0-9]*";			//��������
	/**
	 * ��֤�Ƿ�Ϊ��
	 * @param obj  ��֤��ֵ
	 * @return  �շ���true ��Ϊ�շ���false
	 */
	public  static boolean checkIfNull(String obj){
		boolean flag = true;
		if(obj==null || "".equals(obj)){
			flag = false;
		}
		return flag;
	}	
	/**
	 * ��֤С���㳤��
	 * @param obj  ��֤��ֵ,front С����ǰλ��,back��С�����λ��
	 * @return  ����ȷ����false ��ȷ����true
	 */
	public  static boolean checkLength(String obj,Integer front, Integer back){
		boolean flag = true;
		boolean flagOne = true;
		/**
		 * ���ж��Ƿ�Ϊ����
		 */
		flag = isNumber(obj);	
		if(flag){
			/**
			 * ���Ϊ���֣��ж��Ƿ�ΪС��
			 */
			flag = isFraction(obj);
			if(flag){
				String arr[]=obj.split("\\.");
				String arrFront=arr[0];
				String arrBack=arr[1];
				if(obj==null || arrFront.length()>front||arrBack.length()>back){
					flag = false;
				}
			}else{
				if(obj.length()>front){
					flag=false;
				}else{
					flag=true;
				}
			}
		}
		return flag;
	}
	/**
	 * ��֤��ֵ�Ƚ�
	 * @param min��Сֵ��max���ֵ
	 * @return  ����ȷ����false ��ȷ����true
	 */
	public  static boolean checkMinMax(String min,String max){
		boolean flag = true;
		boolean flagOne = true;
		if(min==null||max==null){
			flag = false;
		}else{
		flag=isNumber(min);
		flagOne=isNumber(max);
		 if(flag&&flagOne){
		  Float fmin=Float.valueOf(min);
		  Float fmax=Float.valueOf(max);
		  if(fmin>fmax){
			 flag=false;
		  }
		 }
		}
		return flag;
	}
	/**
	 * ��֤ȡֵ��Χ
	 * @param obj  ��֤��ֵ,minΪ��С��ֵ��maxΪ����ֵ
	 * @return  ����ȷ����false ��ȷ����true
	 */
	public  static boolean checkDataArea(String obj,String min,String max){
		boolean flag = true;
		boolean flagOne = true;
		boolean flagTwo = true;
		if(obj==null || min==null||max==null){
			flag = false;
		}else{
			 flag=isNumber(min);
			 flagOne=isNumber(max);
			 flagTwo=isNumber(max);
			 if(flag&&flagOne&&flagTwo){
				 Float fobj=Float.valueOf(obj);
				 Float fmin=Float.valueOf(min);
				 Float fmax=Float.valueOf(max);
				 if(fobj>fmax||fobj<fmin){
					 flag=false;
			 }
			}
		}
		return flag;
	}
	/**
	 * ��֤��Ͽ����Ƿ���ֵ
	 * @param obj ��Ͽ��е�ֵ
	 * @return ��ֵ����TRUE û��ֵ����FALSE
	 */
	public  static boolean checkCombox(String obj){
		boolean flag = true;
		if(obj==null || "".equals(obj) || "NO".equals(obj)){
			flag = false;
		}
		return flag;
	}
	
	/**
	 * ��֤����
	 * @param obj String Ҫ��֤���ַ���
	 * @param strType ��֤�ַ��������ͳ���
	 * @return 
	 */

	public  static boolean checkStrType(String obj,final String strType){
		if(obj==null || "".equals(obj)){
			return false;
		}
		return obj.matches(strType);
	}
	/**
	 * ��֤�Ƿ���С��
	 * @param obj String Ҫ��֤���ַ���
	 * @param strType ��֤�ַ��������ͳ���
	 * @return 
	 */
	public static boolean isFraction(String num){
		if(num==null || "".equals(num)){
			return false;
		}
	    return num.matches("^(-)?[0-9]+\\.[0-9]+$");
	}
	/**
	 * ��֤�Ƿ�������
	 * @param num String Ҫ��֤���ַ���
	 * @return 
	 */
	public static boolean isNumber(String num){
		if(num==null || "".equals(num)){
			return false;
		}
	    return num.matches("(-)?[0-9]+(.[0-9]+)?");
	}
}
