package com.example.demo;

public class MyUtil {
	
	public static String getNewPwd()
	{
		String newPwd="";
		
		for(int i=1;i<5;i++)
		{
			int num=(int)(Math.random()*90);
			
			num=num+33;
			
			newPwd=newPwd+(char)num;
		}
		return newPwd;
	}

}
