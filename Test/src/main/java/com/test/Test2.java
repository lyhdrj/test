package com.test;

/*
 * Copyright 2005-2010 the original author or authors.
 * 
 *      http://www.coheg.com.cn
 *
 * Project coheg-framework
 */


import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.Serializable;

/**
 * @since 2013-1-5
 * @author lizq 
 * @version $Id$
 */
public class Test2 implements Serializable{
	private static ThreadLocal currentUser = new InheritableThreadLocal();
	private static User user;
	public static String getCurrentUser(){
		return (String) currentUser.get();
	}
	public static void populate(String oldSchema) {
    	currentUser.set(oldSchema);
    	
    }
	public static void setUser(User newuser){
		user=newuser;
	}
	public static void main(String [] args){
		//Test2.populate("dfdfd");
	//	bsh.Console.main(args);
		//ClassPathResource resource = new ClassPathResource("");
		
		bsh.Interpreter p=new bsh.Interpreter();
		try {
			//p.source("/D://workspace/Test/test");
			//int b=(Integer) p.get("b");
			//p.eval("bar=6*2");
			Executable t=(Executable) p.eval(new InputStreamReader(new FileInputStream("D://workspace/Test/test2"), "GBK"));
			//System.out.print("b="+b);
		User u=	(User) t.execute();
		System.out.println("√‹¬Î="+u.getPwd());
			t.invoke();
			System.out.println(Test2.getCurrentUser());
			
			System.out.println("name="+user.getName());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
