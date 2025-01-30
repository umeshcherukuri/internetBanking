<%@page import="bank_dto.User"%>
<%@page import="bank_dto.Bank"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Self Transfer</title>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.form-container {
	
    background: linear-gradient(135deg, #ff7e5f, #feb47b);	
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
    width: 350px;
    text-align: center;
}

h1 {
    color: #333;
    margin-bottom: 20px;
    font-size: 24px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    text-align: left;
    color: #555;
    margin: 10px 0 5px;
    font-size: 14px;
}

input {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    margin-bottom: 15px;
    outline: none;
    transition: border-color 0.3s;
}

input:focus {
    border-color: #ff7e5f;
}

button {
    padding: 12px;
    font-size: 16px;
    font-weight: bold;
    color: white;
    background-color: #ff7e5f;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

button:hover {
    background-color: #feb47b;
}

</style>
<body>
<div class="form-container">
    <h1>Enter Account Transfer Details</h1>
    <form action="transfer" method="post">
    	<% Bank bank =(Bank)session.getAttribute("bank");
    	User user=(User)session.getAttribute("user");
    	if(bank!=null && bank.getAccountnumber()!=0)
    	{%>
    	<label for="type">From Account</label>
            <select id="type" name="from" required>
	            <option value="" disabled selected>Select Account</option>
	            <option value="<%=bank.getAccountnumber()%>"><%=bank.getAccountnumber()%></option>
	        </select>
        <label for="anotherAccountNumber">Another Account Number</label>
        <input type="tel" id="anotherAccountNumber" minlength=12 maxlength=12 name="anotherAccountNumber" placeholder="Enter account number" required>

        <label for="anotherIFSCCode">Another IFSC Code</label>
        <input type="text" id="anotherIFSCCode" name="ifsc" placeholder="Enter IFSC code" required>

        <label for="amount">Amount</label>
        <input type="number" id="amount" name="amount" placeholder="Enter amount" required>
        
        <input type="text" id="date" name="date" hidden="true">
        <input type="text" id="time" name="time" hidden="true">
        
		<br>
        <button type="submit" disabled>Submit</button>
		<%
		
		}
    	else
    	{
    		out.println("<h3 style='color:black;'>Create account to make transactions</h3>");
    	}
    	String msg=(String)request.getAttribute("msg");
		if(msg!=null)
		{
			out.println("<p>"+msg+"</p>");
		}%>
    </form>
</div>
</body>
</html>