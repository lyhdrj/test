package com.nasoft.log.service;

import org.aspectj.lang.JoinPoint;

public interface ILogManageService {
	
	public void insertAfter();
	
	public void updateAfter();
	
	public void deleteAfter(JoinPoint jp);
}
