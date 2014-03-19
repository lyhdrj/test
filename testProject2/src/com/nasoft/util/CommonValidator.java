package com.nasoft.util;
/**
 * 公用验证方法
 * 创建人：david
 * 创建时间：2009.05.08
*/
public class CommonValidator {
	public final static String NUMTYPE="(-)?[0-9]*";			//数字类型
	public final static String CHARACTARTYPE="[a-zA-Z]*";	//字符类型
	public final static String CHARANDNUMTYPE="[0-9a-zA-Z]*";	//数字和字符类型
	public final static String CHINESETYPE="[\u4e00-\u9fa5\\.]*";	//汉字类型
	public final static String ALLTYPE = "[\\w*\u4e00-\u9fa5]*";	//汉字，数字，字符
	public final static String FLOATTYPE="(-)?[0-9]*(\\.)?[0-9]*";			//数字类型
	/**
	 * 验证是否为空
	 * @param obj  验证的值
	 * @return  空返回true 不为空返回false
	 */
	public  static boolean checkIfNull(String obj){
		boolean flag = true;
		if(obj==null || "".equals(obj)){
			flag = false;
		}
		return flag;
	}	
	/**
	 * 验证小数点长度
	 * @param obj  验证的值,front 小数点前位数,back，小数点后位数
	 * @return  不正确返回false 正确返回true
	 */
	public  static boolean checkLength(String obj,Integer front, Integer back){
		boolean flag = true;
		boolean flagOne = true;
		/**
		 * 先判断是否为数字
		 */
		flag = isNumber(obj);	
		if(flag){
			/**
			 * 如果为数字，判段是否为小数
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
	 * 验证数值比较
	 * @param min最小值，max最大值
	 * @return  不正确返回false 正确返回true
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
	 * 验证取值范围
	 * @param obj  验证的值,min为最小的值，max为最大的值
	 * @return  不正确返回false 正确返回true
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
	 * 验证组合框中是否有值
	 * @param obj 组合框中的值
	 * @return 有值返回TRUE 没有值返回FALSE
	 */
	public  static boolean checkCombox(String obj){
		boolean flag = true;
		if(obj==null || "".equals(obj) || "NO".equals(obj)){
			flag = false;
		}
		return flag;
	}
	
	/**
	 * 验证类型
	 * @param obj String 要验证的字符串
	 * @param strType 验证字符串的类型常量
	 * @return 
	 */

	public  static boolean checkStrType(String obj,final String strType){
		if(obj==null || "".equals(obj)){
			return false;
		}
		return obj.matches(strType);
	}
	/**
	 * 验证是否是小数
	 * @param obj String 要验证的字符串
	 * @param strType 验证字符串的类型常量
	 * @return 
	 */
	public static boolean isFraction(String num){
		if(num==null || "".equals(num)){
			return false;
		}
	    return num.matches("^(-)?[0-9]+\\.[0-9]+$");
	}
	/**
	 * 验证是否是数字
	 * @param num String 要验证的字符串
	 * @return 
	 */
	public static boolean isNumber(String num){
		if(num==null || "".equals(num)){
			return false;
		}
	    return num.matches("(-)?[0-9]+(.[0-9]+)?");
	}
}
