<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Bank Account</title>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: white;
    padding: 20px 40px;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    max-width: 400px;
    width: 100%;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #4e54c8;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    font-size: 14px;
    margin: 10px 0 5px;
    color: #333;
}

input, select {
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 15px;
    outline: none;
    transition: border 0.3s;
}

input:focus, select:focus {
    border-color: #4e54c8;
}

button {
    padding: 10px;
    background-color: #4e54c8;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

button:hover {
    background-color: #5c67ed;
}

</style>

<body>
<div class="container">
    <h1>Account Details Form</h1>
    <form action="bankaccount" method="post">

        <label for="type">Account Type:</label>
        <select id="type" name="type" required>
            <option value="" disabled selected>Select account type</option>
            <option value="savings">Savings</option>
            <option value="current">Current</option>
            <option value="fixed">Business</option>
        </select>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" placeholder="Enter your address" required>

        <label for="aadhar">Aadhaar Number:</label>
        <input type="tel" id="aadhar" name="aadhar" placeholder="Enter your Aadhaar number" maxlength=12 minlength=12 required>

        <label for="type">Branch:</label>
        <select id="type" name="branch" required>
            <option value="" disabled selected>Select Branch</option>
            <option value="Kukatpally">Kukatpally</option>
            <option value="Gatchibowli">Gatchibowli</option>
            <option value="Secundrabad">Secundrabad</option>
            <option value="Ameerpet">Ameerpet</option>
            <option value="Nijampet">Nijampet</option>
        </select>

        <label for="balance">Account Balance:</label>
        <input type="number" id="balance" name="balance" placeholder="Enter your account balance" required>
		<%String msg= (String)request.getAttribute("msg");
		if(msg!=null)
		{
			out.println("<p>"+msg+"</p>");
		}%>
        <button type="submit">Submit</button>
    </form>
</div>

</body>
</html>