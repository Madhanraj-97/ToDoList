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

@WebServlet("/addTask")
public class Addtask extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String taskdescription = req.getParameter("taskdescription");
		String taskTitle=req.getParameter("tasktitle");
		String taskpriority =req.getParameter("taskpriority");
		String taskduedate=req.getParameter("taskduedate");
		User user=(User) req.getSession().getAttribute("user");
		int userid= user.getUserId();
		
//		resp.getWriter().print("ID :"+task.getTaskid()+"DESC "+task.getTaskdescription()+" title"+task.getTasktitle()+" pri"+task.getTaskpriorrity()+" data"+task.getTaskduedate()+" user id"+task.getUserid()+"status"+task.getTaskstatus());
		Dao dao=new Dao();
		try {
			Task task =new Task(dao.getTaskid(), taskTitle, taskdescription, taskduedate, taskpriority,"pending", userid);
			int res=dao.createTask(task);
			if(res>0) {
				HttpSession session =req.getSession();
				User u=(User) session.getAttribute("user");
				req.setAttribute("tasks",dao.getalltask(u.getUserId()));
				req.setAttribute("taskadded", true);
//				resp.sendRedirect("home1.jsp");
				RequestDispatcher dispatcher=req.getRequestDispatcher("home1.jsp");
				dispatcher.forward(req, resp);
//				resp.sendRedirect(req.getContextPath() + "/home1.jsp");
			}
			else{
				resp.getWriter().print("failed");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
