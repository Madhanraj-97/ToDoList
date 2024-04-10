package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import dto.Task;
import dto.User;

public class Dao {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todolist?user=root&password=root");
		return con;
	}

	public int saveUser(User user) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("insert into user value(?,?,?,?,?,?)");
		pst.setInt(1, user.getUserId());
		pst.setString(2, user.getUserName());
		pst.setString(3, user.getUserEmail());
		pst.setLong(4, user.getUserContact());
		pst.setString(5, user.getUserPasswor());
		Blob imageBlob = new SerialBlob(user.getUserImage());
		pst.setBlob(6, imageBlob);   
		
		
		int res = pst.executeUpdate();
		return res;
	}

	public User findByEmail(String email) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from user where userEmail=?");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		if (rs.next()) {
			User u = new User();
			u.setUserId(rs.getInt(1));
			u.setUserName(rs.getString(2));
			u.setUserEmail(rs.getString(3));
			u.setUserContact(rs.getLong(4));
			u.setUserPasswor(rs.getString(5));
			Blob imageBlob = rs.getBlob(6);
			byte[] image = imageBlob.getBytes(1, (int) imageBlob.length());
			u.setUserImage(image);
			return u;

		} else {
			return null;
		}
		
	}
	public int createTask(Task task) throws ClassNotFoundException, SQLException {	
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement("insert into task value(?,?,?,?,?,?,?)");
		pst.setInt(1, task.getTaskid());
		pst.setString(2,task.getTasktitle());
		pst.setString(3,task.getTaskdescription());
		pst.setString(4,task.getTaskpriorrity());
		pst.setString(5,task.getTaskduedate());
		pst.setString(6,task.getTaskstatus());
		pst.setInt(7,task.getUserid());
		int res=pst.executeUpdate();
		return res;
	}
	public List<Task> getalltask(int userid) throws ClassNotFoundException, SQLException{
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement("select * from task where userid = ?");
		pst.setInt(1, userid);
		ResultSet rs=pst.executeQuery();
		List<Task> tasks=new ArrayList<Task>();
		while(rs.next()) {
			Task task=new Task (rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
			tasks.add(task);
			
		}
		
		return tasks;
	}
	public void deleteTask(int taskid) throws ClassNotFoundException, SQLException {
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement("delete from task where taskid=?");
		pst.setInt(1, taskid);
		int res=pst.executeUpdate();
	}
	public int getUserId() throws ClassNotFoundException, SQLException {
		Connection con= getConnection();
		PreparedStatement pst= con.prepareStatement("select max(userId) from user");
		ResultSet rs=pst.executeQuery();
		if(rs.next()) {
			int id=rs.getInt(1);
			return id+1;
		}
		else {
			return 1;
		}
	}
	public  int getTaskid () throws SQLException, ClassNotFoundException {
		Connection con= getConnection();
		PreparedStatement pst= con.prepareStatement("select max(taskid) from task");
		ResultSet rs=pst.executeQuery();
		if(rs.next()) {
			int id=rs.getInt(1);
			return id+1;
		}
		else {
			return 1;
		}
	}
	public Task taskEdit(int id) throws SQLException, ClassNotFoundException {
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement("select * from task where taskid = ?");
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		rs.next() ;
			Task task=new Task(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(5), rs.getString(4), rs.getString(6), rs.getInt(7));
			return task;
	}
	public int  taskUpdate(Task task) throws SQLException, ClassNotFoundException {
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement("update task set taskid=?,tasktitle=?,taskdescription=?,taskpriority=?,taskduedate=?,taskstatus=?,userid=? where taskid=? ");
		pst.setInt(1, task.getTaskid());
		pst.setString(2,task.getTasktitle());
		pst.setString(3,task.getTaskdescription());
		pst.setString(4,task.getTaskpriorrity());
		pst.setString(5,task.getTaskduedate());
		pst.setString(6,task.getTaskstatus());
		pst.setInt(7,task.getUserid());
		pst.setInt(8,task.getTaskid());
		int res=pst.executeUpdate();
		return res;
	}
}
