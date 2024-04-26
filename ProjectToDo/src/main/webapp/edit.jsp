<%@page import="dto.Task"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%Task task=(Task)request.getAttribute("task"); %>
	<form action="updatetask1" method="post">
	<h1>EDIT TASK</h1>
		<input type="text" value="<%= task.getTaskid()%>" hidden="" name="taskid">
		<p>Task Title : <input type="text" name="tasktitle" value="<%= task.getTasktitle()%>"> </p>
		<p>Task Description : <input type="text" name="taskdescription" value="<%= task.getTaskdescription()%>"> </p>
		<p>Task Priority: <input type="text" name="pre-priority" value="<%= task.getTaskpriorrity()%>"> </p>
		<p>Options :</p>
		<p><label for="option1" > <input type="radio" id="option1" value="low" name="taskpriority">Low</label></p>
		<p><label for="option2" > <input type="radio" id="option2" value="medium" name="taskpriority">Medium</label></p>
		<p><label for="option3" > <input type="radio" id="option3" value="high" name="taskpriority">High</label></p>
		<p>Due Date: <input type="date" name="taskduedate" value="<%= task.getTaskduedate()%>"></p>
		<p>Status: <input type="text" value="<%= task.getTaskstatus()%>" name="taskstatus"></p>
		<input type="text"  name="userid"value="<%=task.getUserid()%>" hidden="">
		<input type="submit">
	</form>
</body>
</html>