<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	height: 100vh;
	/* background-color: rgb(202, 139, 139); */
	 background-image: url("https://cdn.pixabay.com/photo/2022/10/03/23/41/house-7497001_1280.png"); 
	display: flex;
	justify-content: center;
	align-items: center;
}

#card {
	background-color: rgba(49, 81, 53, 0.43);
	border-radius: 30px;
}

#form {

	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	align-items: flex-end;
	/*  height: 200px; */
	padding: 20px;
}
#btn{
background-color: red;
}
#btn::hover {
	background-color: blue;
}
</style>

<body>
	<div id="card">
		<form id="form" method="post" enctype="multipart/form-data" action="saveuser">
			<p>
				Name: <input type="text" class="field" name="name" required>
			</p>
			<p>
				Email: <input type="text" class="field" name="email" required>
			</p>
			<p>
				Contact: <input type="text" class="field" name="number" required>
			</p>
			<p>
				Password <input type="password" class="field" name="password" required>
			</p>
			<p>
				Image<input type="file" class="field" name="image" required>
			</p>
			<input type="submit" id="btn">
		</form>
	</div>
</body>
</html>