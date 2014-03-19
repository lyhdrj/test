package com.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Properties;

public class ProTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String path=System.getProperty("user.dir");
		Properties pro=new Properties();
		try {
			Reader in= new InputStreamReader(new FileInputStream(path+"\\files.properties"),"utf-8");
			pro.load(in);
			System.out.print(pro.getProperty("code"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
