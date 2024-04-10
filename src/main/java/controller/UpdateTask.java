package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;
@WebServlet("/updatetask1")

public class UpdateTask extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int taskid=Integer.parseInt(req.getParameter("taskid"));
		String tasktitle=req.getParameter("tasktitle");
		String taskdescription =req.getParameter("taskdescription");
		String taskpriority=(req.getParameter("taskpriority")==null)?req.getParameter("pre-priority"):req.getParameter("taskpriority");
		String taskduedate=req.getParameter("taskduedate");
		String taskstatus=req.getParameter("taskstatus");
		int userid=Integer.parseInt(req.getParameter("userid"));
		Task task=new Task(taskid, tasktitle, taskdescription, taskduedate, taskpriority, taskstatus, userid);
		Dao dao=new Dao();
		try {
			int res=dao.taskUpdate(task);
			if(res>0) {
				HttpSession session =req.getSession();
				User u=(User) session.getAttribute("user");
				req.setAttribute("tasks",dao.getalltask(u.getUserId()));
				RequestDispatcher dispatcher=req.getRequestDispatcher("home1.jsp");
				dispatcher.include(req, resp);
			}
			else {
				HttpSession session =req.getSession();
				User u=(User) session.getAttribute("user");
				req.setAttribute("tasks",dao.getalltask(u.getUserId()));
				RequestDispatcher dispatcher=req.getRequestDispatcher("home1.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

};
