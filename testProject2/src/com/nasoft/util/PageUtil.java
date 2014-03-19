package com.nasoft.util;

public class PageUtil {

	/**
	 * @author Chi Kehan 2012-11-16
	 * @param count
	 * @param pageSize
	 * @return int
	 * @Description TODO
	 */
	public static int getPageByTotalCount(int count,int pageSize){
		if(count%pageSize == 0)
			return count / pageSize;
		else {
			return count / pageSize + 1;
		}
	}
	
	/**
	 * @author Chi Kehan 2012-11-16
	 * @param firstResult
	 * @param pageSize
	 * @return int
	 * @Description TODO
	 */
	public static int getCurrentPage(int firstResult,int pageSize){
		return (firstResult - 1) / pageSize + 1;
	}
	
	/**
	 * @author Chi Kehan 2012-11-16
	 * @param currentPage
	 * @param pageSize
	 * @return 
	 * @Description TODO
	 */
	public static int getFirstResult(int currentPage,int pageSize){
		return (currentPage - 1) * pageSize + 1;
	}
	/**
	 * @author Chi Kehan 2012-11-16
	 * @param args 
	 * @Description TODO
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
