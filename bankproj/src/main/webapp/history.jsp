<%@page import="com.mysql.cj.xdevapi.Table"%>
<%@page import="bank_dto.Bank"%>
<%@page import="bank_dto.TransactionsDto"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {
    font-family: 'Arial', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f0f2f5;
}

.container {
    background-color: white;
    padding: 20px 40px;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    max-width: 800px;
    width: 100%;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #4e54c8;
}

.message {
    text-align: center;
    font-size: 1.2em;
    color: #333;
}

table {
    width: 100%;
    border: 1px solid #4e54c8;
    border-collapse: collapse;
    margin-top: 20px;
}

tr {
    border: 1px solid #4e54c8;
    border-collapse: collapse;
}

td, th {
    padding: 10px 15px;
    border: 1px solid #4e54c8;
    border-collapse: collapse;
    text-align: center;
}

th {
    
    background-color:  rgba(167, 139, 250, 1);
    color: white;
    font-weight: bold;
}

td {
    background-color: #f9f9f9;
}

.no-data {
    padding: 15px;
    text-align: center;
    background-color: #ffebee;
    color: #c62828;
    font-weight: bold;
    border-radius: 5px;
}


</style>
<title>Transaction History</title>
</head>
<body>
	<form>	
	<h1 id="title">Transaction History</h1>
	<%LinkedList<TransactionsDto> rs=(LinkedList<TransactionsDto>)session.getAttribute("transactions"); 
	Bank bank =(Bank)session.getAttribute("bank");
	if (bank == null || bank.getAccountnumber() == 0) { %>
    <div class="message no-data">No account attached</div>
<% } else if (rs != null) {
    boolean has = false;
    for (TransactionsDto transaction : rs) {
        has = true;
        break;
    }
    if (has) { %>
        <table>
            <tr>
                <th>Sender Account Number</th>
                <th>Receiver Account Number</th>
                <th>Amount</th>
                <th>CR/DR</th>
                <th>Date</th>
                <th>Time</th>
            </tr>
            <% for (TransactionsDto transaction : rs) { %>
            <tr>
                <td><%= transaction.getSenderAccount() %></td>
                <td><%= transaction.getRecieverAccount() %></td>
                <td><%= transaction.getAmount() %></td>
                <td><%= (bank.getAccountnumber() == transaction.getSenderAccount()) ? "DR" : "CR" %></td>
                <td><%= transaction.getDate() %></td>
                <td><%= transaction.getTime() %></td>
            </tr>
            <% } %>
        </table>
    <% } else { %>
        <div class="message no-data">No transactions made</div>
    <% }
} %>

	</form>
</body>
</html>