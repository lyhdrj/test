package com.test;

import java.util.Arrays;

public class ArrsUtest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String [] arrs={"1111","2222","333","444"};
      String []b=  Arrays.copyOf(arrs, arrs.length+1);
      b[arrs.length]="5555";
      for (int i = 0; i < b.length; i++) {
		System.out.println(b[i]);
	}
	}

}
