<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDoList</title>
<style>
body {
	padding: 0px;
	margin: 0px;
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-image: url("images/mountains-8564328_1280.webp");
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

* {
	/* border: 1px solid black; */
	/* padding: 5px; */
	
}

#main {
	width: 60%;
	height: 60%;
	display: flex;
	background-color: #4b161662;
	box-shadow: 10px 10px 10px rgb(87, 75, 66);
	border-radius: 20px;
}

#login {
	width: 65%;
	padding: 10px;
	/* display: none; */
}

#singup {
	width: 65%;
	display: none;
}

#option {
	width: 35%;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"] {
	width: 60%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 15px;
	background-color: transparent;
}

button {
	width: 64%;
	padding: 10px 15px;
	background-color: rgb(226, 99, 96);
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

button:hover {
	opacity: 0.8;
	background-color: rgb(226, 99, 96);
}

#option {
	background-color: bisque;
	border-top-right-radius: 20px;
}
</style> 
</head>

<body>
	<div id="main">
		<section id="login">
			<h1>Login</h1>
			<form action="userlogin" method="post" id="form">
				<label for="username">User email:</label> <input type="text"
					id="username" name="email" placeholder="enter registered email"
					required> <label for="password">Password:</label> <input
					type="password" id="password" name="password"
					placeholder="enter password" required>
				<button type="submit">Login</button>
			</form>
		</section>
		<section id="singup">
			<form id="form" method="post" enctype="multipart/form-data"
				action="saveuser">
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
					Password <input type="password" class="field" name="password"
						required>
				</p>
				<p>
					Image<input type="file" class="field" name="image" required>
				</p>
				<input type="submit" id="btn">
			</form>
		</section>
		<section id="option">
			<p>Don't have an account? Please Sign up!</p>
			<button id="opt">Singup</button>
		</section>
	</div>
	<script>
        let opt=document.getElementById("opt")
        let log=true;
        opt.addEventListener("click",()=>{
            if(log){
                document.getElementById("singup").style.display="block";
                document.getElementById("login").style.display="none";
                document.getElementById("option").children[0].textContent="DO you have already account? Please login!"
                document.getElementById("option").children[1].textContent="login" 
                log=false;
            }
            else{
                document.getElementById("login").style.display="block";
                document.getElementById("singup").style.display="none";
                document.getElementById("option").children[0].textContent="Don't have an account? Please Sign up!"
                document.getElementById("option").children[1].textContent="signup"
                log=true;
            }
        })
    </script>
</body>
</html>