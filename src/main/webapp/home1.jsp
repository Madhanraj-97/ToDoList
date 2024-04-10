<%@page import="dto.Task"%>
<%@page import="dto.User"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style type="text/css">
tr,td,th{
border: 1px solid black;
}
tr,td,th{
border-collapse: collapse;
}
#mydiv{
	/* height: 400px; */
	border: 1px solid black;
	position: relative;
	display :inline-block;
	left:500px;
	background-color: rgb(43,88,123);
	border-radius: 6px;
	box-shadow: 10px 10px 5px lightblue;
	padding: 50px;
	font-family: sans-serif;
	color: white;
	
}
body{
	background-image: url("https://wallpapers.com/images/high/minimalist-blue-3840-x-2160-ebjlmtts28k7tpwx.webp");
	background-repeat: no-repeat;
	background-size: cover;
}
table{
	border: 1px solid black;
	border-collapse: collapse;
	position: relative;
	top:40px;
	left: 40px;
	

}
th,tr{
	background-color: antiquewhite;
	padding: 20px;
}
</style>
</head>
<body>
<div id="body">
	<%
	User user = (User) request.getSession().getAttribute("user");
	%>
	<%
	String name = user.getUserName();
	%>
	<div id="mydiv">
		<%
	String image = new String(Base64.getEncoder().encode(user.getUserImage()));
	%>
	<img alt="" src="data:image/jpege;base64,<%=image%>" height="150px" width="150px">
		<h2>
			welcome
			<%=name%></h2>
		<h2>
			Email:
			<%=user.getUserEmail()%></h2>
	</div>
	<button><a href ="addtask.jsp" > Add Task</a> </button>
	
	<% List <Task> tasks = (List)request.getAttribute("tasks"); %>
	<table>
		<tr>
			<th>Sno</th>
			<th>Title</th>
			<th>Description</th>
			<th> Priority</th>
			<th>Due date</th>
			<th>Status</th>
			<th>DELETE</th>
			<th>Edit</th>
		</tr>
		<% int num = 1; %>
	<% for(Task task:tasks){%>	
		<tr>
		<td><%= num %></td>
		<td><%= task.getTasktitle() %></td>
		<td><%= task.getTaskdescription() %></td>
		<td><%= task.getTaskpriorrity()%></td>
		<td><%= task.getTaskduedate() %></td>
		<td><%= task.getTaskstatus() %></td>
		<td> <button> <a href="delete?taskid=<%= task.getTaskid()%>">Delete</a> </button> </td>
		<td><button><a href="edittask?taskid=<%= task.getTaskid()%>">Edit</a> </button></td>		
		</tr>
		<% num+=1; %>
		<%} %>
	</table>
</div>
<a href="logout">Logout</a>
</body>
</html>

