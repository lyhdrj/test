package com.nasoft.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author david
 * 创建时间 2010-07-20
 */
public class GetDate {
   
	private static SimpleDateFormat sdf = new SimpleDateFormat();
	private static DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	
	public static String[] getStartEndDate(){
		String[] dateArr=new String[2];
		dateArr[0]=format.format(new Date());
		dateArr[1]=format.format(new Date());
		return dateArr;
	}
	
	public static String getCurrentDate() {
		
	    return format.format(new Date());
	}
	//将字符串日期转成Date
	public static synchronized Date parseDateFormat(String strDate,
            String pattern) {
        synchronized (sdf) {
            Date date = null;
            sdf.applyPattern(pattern);
            try {
                date = sdf.parse(strDate);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return date;
        }
    }
}
