package com.test;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;


public class Test1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i = 1;
		int j;
		j = i++;
		System.out.println("i=" + i + ",j=" + j);
		Test1 t=new Test1();
		System.out.printf("m=%d\n", t.fun(11));
		System.out.printf("%s\n","web-inf/report"+File.separator);
		List<? extends Number> list=new ArrayList<Integer>();
		wildcard(list);
		System.out.println(list.get(0));
		
		MyFx<Integer,String, List<? extends Number>> my=new MyFx<Integer,String, List<? extends Number>>();
		my.setX(55);
		my.setY("LJK");
		List<Float> z = new ArrayList<Float>();
		z.add(2.2F);
		my.setZ(z);
		Class<? extends MyFx> c= my.getClass();
		String s=new String("222");
		try {
		Method m=c.getMethod("aaa",String.class);
		m.invoke(my, s);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		System.out.println(my.getY()+"=="+my.getX()+"=="+my.getZ().get(0));
	}
	private int fun(int n){
		int m=0,f=1,i;
		for(i=1;i<n;i++){
			m+=i*f;
			//System.out.println("f=("+f+")");
			//System.out.println("m=("+m+")");
			f=i%2==0?1:-1;
		}
		return m;
	}
	
	public static void wildcard(List list) {
	   list.add(2); 
	}

}

class MyFx<X extends Number,Y,Z extends List<? extends Number>>{
	private X x;
	private Y y;
	private Z z;
	public X getX() {
		return x;
	}
	public void setX(X x) {
		this.x = x;
	}
	public Y getY() {
		return y;
	}
	public void setY(Y y) {
		this.y = y;
	}
	public Z getZ() {
		return z;
	}
	public void setZ(Z z) {
		this.z = z;
	}
	public void aaa(String aa){
		System.out.println("================="+aa);
	}
	
}
