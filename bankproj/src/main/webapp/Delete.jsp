<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Profile</title>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    background-color: rgba(17, 24, 39, 1);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    width: 300px;
    text-align: center;
    box-shadow:0px 0px 7px white;
}

h1 {
    color:rgba(167, 139, 250, 1);
    margin-bottom: 20px;
    font-size: 24px;
}

label {
    display: block;
    margin: 10px 0 5px;
    color: #555;
    font-size: 14px;
}

input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color:transparent;
    font-size: 14px;
}

input[type="submit"] {
    background-color: #ff7e5f;
    color: white;
    border: none;
    padding: 10px;
    width: 100%;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    background-color: rgba(167, 139, 250, 1);
}



</style>
<body>
 <div class="container">
        <h1>Delete Profile</h1>
        <form action="delete" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="enter email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="enter password" required>
            <% String msg=(String)request.getAttribute("msg"); 
            if(msg!=null)
            {
            	out.println("<p style='color:white'>"+msg+"</p>");
            }%>
            <br><br>
            <input type="submit" value="Delete">
        </form>
    </div>
</body>
</html>