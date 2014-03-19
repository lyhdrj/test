package com.test.thread;

public class ClientThread extends Thread{
 private Queue queue;
 private String clientName;
 static int n=0;
 ClientThread(Queue queue,String clientName){
	 this.clientName=clientName;
	 this.queue=queue;
 }
@Override
public void run() {
	for(int i=0;i<5;i++){
		Request request=new Request(" " + (long)(Math.random()*10));
		System.out.printf(this+"%s send Request\n", request.getReqName()+n);
		queue.putRequest(request);
		n++;
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	System.out.printf("%s Shutdown\n", this);
}
@Override
public String toString() {
	return "[ClientThread:"+clientName+"]";
}
 
}
