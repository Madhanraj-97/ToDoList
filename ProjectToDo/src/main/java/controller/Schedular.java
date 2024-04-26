package controller;

import java.sql.SQLException;

import dao.Dao;

public class Schedular extends Thread {

	@Override
	public void run() {
		while(!Thread.currentThread().isInterrupted()) {
			Dao dao=new Dao ();
			 try {
				dao.updatePriorityBasedONDuration();
				Thread.sleep(1000*30);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Thread.currentThread().interrupt();
			}
			 
		}
		
	}

}
