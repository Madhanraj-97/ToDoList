<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <style>
        #error {
            color: red;
        }
        

        body {
            padding: 0px;
            margin: 0px;
            font-family: sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            /* background-color: #bb5555; */
            background-image: url("https://cdn.pixabay.com/photo/2023/12/14/00/20/alaska-8448009_1280.jpg");
            background-repeat: no-repeat;
            background-size: cover;

        }

        .container {
            background-color: #1545927a;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-bottom: 15px;
        }

        button {
            width: 100%;
            padding: 10px 15px;
            background-color: #35a939;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        button:hover {
            opacity: 0.8;
            background-color: #0a3c0c;
        }
    </style>

    <body>
        <%String msg=(String) request.getAttribute("msg"); %>
            <div class="container">
                <h1>Login</h1>
                <form action="userlogin" method="post" id="form">
                    <label for="username">User email:</label>
                    <input type="text" id="username" name="email" placeholder="Enter Email" required>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Enter Password" required>
                    <button type="submit">Login</button>
                    <%if(msg!=null){ %>
                        <p id="error">
                            <%= msg %>
                        </p>
                        <% } %>
                </form>
            </div>

    </body>

    </html>