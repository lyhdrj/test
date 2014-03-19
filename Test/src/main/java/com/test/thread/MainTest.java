package com.test.thread;

public class MainTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Queue queue=new Queue();
		ServerThread server=new ServerThread(queue);
		server.start();//启动服务线程
		ClientThread[] clients=new ClientThread[5];
		for(int i=0; i<5; i++){
			clients[i]=new ClientThread(queue, "client"+i);
			clients[i].start();
		}
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		server.shutdown();
	}

}
