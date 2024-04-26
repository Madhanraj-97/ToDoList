<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Task</title>
</head>
<style>
 body {
	background-color: rgb(221, 102, 102);
}
#task{
background-color: silver;
border: 1px solid black;
width: 350px;
border-radius:20px; 
padding: 10px;
}
</style>
<body>
<div >
	<form action="addTask" method="post" id="task">
		<p>Task Title : <input type="text" name="tasktitle"> </p>
		<p>Task Description : <input type="text" name="taskdescription"> </p>
		<p>Options :</p>
		<p><label for="option1" > <input type="radio" id="option1" value="low" name="taskpriority">Low</label></p>
		<p><label for="option2" > <input type="radio" id="option2" value="medium" name="taskpriority">Medium</label></p>
		<p><label for="option3" > <input type="radio" id="option3" value="high" name="taskpriority">High</label></p>
		<p>Due Date: <input type="date" name="taskduedate"> </p>
		<input type="submit">
	</form>
</div>
	
</body>
</html>