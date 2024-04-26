<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home-Page</title>
    <style>
        body {
            padding: 0px;
            margin: 0px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #card {
            padding:50px;
            background-color: blueviolet;
            border-radius: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center; 
        }
        button{
         font-size: 22px;
         border-radius: 10px;
        }
    </style>
</head>

<body>
    <div id="card">
        <a href="login.jsp"><button>login</button></a>
        <a href="signup.jsp"><button>Signup</button></a>
    </div>
</body>

</html>