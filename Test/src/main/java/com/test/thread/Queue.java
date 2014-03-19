package com.test.thread;

import java.util.LinkedList;

/**
 * 
 * 请求队列
 * 当请求队列为空是，线程等待
 * 当请求队列不为空是，唤醒等待的队列
 * */
public class Queue {
	private LinkedList<Request> queue=new LinkedList<Request>();	
	public synchronized Request getRequest(){
		if(queue.size()==0){
			try {
				System.out.printf("%s\n", "服务线程处于等待状态.....");
				this.wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
				return null;
			}
		}
		System.out.printf("%s\n", "服务线程开始处理请求。。。。");
		return  queue.remove(0);
	}
	
	public void putRequest(Request obj){
		synchronized (this) {
			queue.add(obj);
			this.notify();
		}
	}
}

