package com.test.thread;

public class ServerThread extends Thread{
 private boolean stop=false;
 private Queue queue;
 public ServerThread(Queue queue){
	 this.queue=queue;
 }
 public void shutdown(){
	 stop=true;
	 //interrupt();
	 try {
		this.join();
	} catch (InterruptedException e) {
		e.printStackTrace();
	}
 }
 public void run(){
	 System.out.println("服务已启动........");
	 int m=1;
	 while(!stop){
		 Request request=queue.getRequest();
		 System.out.println("[ThreadServer] handl request: "+request.getReqName());
		 try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		 System.out.println("[ThreadServer] "+m+"处理完毕");
		 m++;
	 }
 }
}
