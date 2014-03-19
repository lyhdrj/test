package com.test.thread;

import java.util.LinkedList;

/**
 * 
 * �������
 * ���������Ϊ���ǣ��̵߳ȴ�
 * ��������в�Ϊ���ǣ����ѵȴ��Ķ���
 * */
public class Queue {
	private LinkedList<Request> queue=new LinkedList<Request>();	
	public synchronized Request getRequest(){
		if(queue.size()==0){
			try {
				System.out.printf("%s\n", "�����̴߳��ڵȴ�״̬.....");
				this.wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
				return null;
			}
		}
		System.out.printf("%s\n", "�����߳̿�ʼ�������󡣡�����");
		return  queue.remove(0);
	}
	
	public void putRequest(Request obj){
		synchronized (this) {
			queue.add(obj);
			this.notify();
		}
	}
}

