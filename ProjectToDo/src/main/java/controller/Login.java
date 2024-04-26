package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/userlogin")
public class Login extends  HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String pwd=req.getParameter("password");
		Dao dao=new Dao();
		
		try {
			User u=dao.findByEmail(email);
			if(u!=null) {
				System.out.println("email verfied");
				if(u.getUserPasswor().equals(pwd)) {
//					List<Task> tasks=dao.getalltask(u.getUserId());
//					req.setAttribute("tasks", tasks);
					
					HttpSession session=req.getSession();
					session.setAttribute("user",u);
			
					req.getRequestDispatcher("home1.jsp").include(req, resp);
				}
				else {
					String error="invaild Password";
					req.setAttribute("msg", error);
					req.getRequestDispatcher("login.jsp").include(req, resp);
				}
			}
			else {
				String error="invaild userID and Password";
				req.setAttribute("msg", error);
				req.getRequestDispatcher("login.jsp").include(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
 
}
