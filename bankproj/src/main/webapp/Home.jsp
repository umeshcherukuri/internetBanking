<%@page import="bank_dto.Bank"%>
<%@page import="bank_dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Webpage</title>
    <style>
        body {
    font-family: 'Segoe UI', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #2c3e50;
    padding: 15px 30px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
}

.navbar-left .username {
    color: #ecf0f1;
    font-size: 20px;
    font-weight: bold;
}

.navbar-center {
    flex: 1;
    display: flex;
    justify-content: flex-end;
    padding: 0 20px;
}

.search-bar {
    padding: 8px;
    font-size: 16px;
    width: 300px;
    border: 1px solid #bdc3c7;
    border-radius: 5px; /* Reduced border radius */
    outline: none;
    transform: translateX(1.8vw);
    transition: border-color 0.3s;
}

.search-bar:focus {
    border-color: #3498db;
}

.navbar-right {
    display: flex;
    align-items: center;
    justify-content: flex-end;
}

.dropdown {
    position: relative;
    margin-left: 25px;
}
.main-button, .submenu-button {
    background-color: rgba(167, 139, 250, 1);
    color: #ffffff;
    border: none;
    padding: 10px 20px; /* Adjusted padding for consistency */
    cursor: pointer;
    font-size: 16px;
    border-radius: 5px; /* Reduced border radius */
    transition: background-color 0.3s, transform 0.2s;
}

.main-button:hover, .submenu-button:hover {
    background-color: rgba(141, 113, 230, 1);
    transform: scale(1.05);
}

.dropdown-content, .submenu-content {
    display: none;
    position: absolute;
    background-color: #ffffff;
    min-width: 200px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    transform: translate(-3vw,0.3vh);
}

.dropdown-content span {
    color: #2c3e50;
    padding: 10px 15px;
    font-size: 15px;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown-submenu {
    position: relative;
}

.dropdown-submenu .submenu-content {
    top: 0;
    left: 200px;
    background-color: #f9f9f9;
    border-radius: 5px;
    padding: 5px 0;
}

.dropdown-content .submenu-content {
    display: none;
    border-top: 1px solid #ddd;
}

.dropdown-content span:hover + .submenu-content {
    display: block;
}

.dropdown-submenu:hover .submenu-content {
    display: block;
}

.submit-button {
    background-color: rgba(167, 139, 250, 1);
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    margin: 10px 30%;
    border-radius: 5px; /* Reduced border radius */
    transition: background-color 0.3s, transform 0.2s;
}

.submit-button:hover {
    background-color: rgba(141, 113, 230, 1);
    transform: scale(1.05);
}

.content {
    flex: 1;
    text-align: center;
    padding: 50px 30px;
    background-size: 100% 80vh;
    background-position: 0px 0vh;
    background-color: #ffffff;
    background-image: url(bankin.jpg);
    background-size: 103vw 94vh;
    background-position:-1.5vw 0vh;
}

.content h1 {
    color: #34495e;
    margin-bottom: 20px;
}

.content p {
    color: #7f8c8d;
    font-size: 18px;
    margin-bottom: 30px;
    line-height: 1.6;
}

.create-account-button {
    background-color: rgba(167, 139, 250, 1);
    color: white;
    border: none;
    padding: 15px 30px;
    font-size: 18px;
    border-radius: 5px; /* Reduced border radius */
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.create-account-button:hover {
    background-color: rgba(141, 113, 230, 1);
    transform: scale(1.05);
}

.footer {
    background-color: #2c3e50;
    color: #ecf0f1;
    text-align: center;
    padding: 15px 0;
    font-size: 14px;
}
.submenu-button
{   
    width: 90%;
    display: inline;
    margin: 4% 6% ;
}
#trans
{
    transform: translateX(-28.8vw);
    display: none;
}
#trans:hover
{
    display: block;
}
#transaction:hover+#trans
{
    display: block;
}
#search
{
    margin-left: 1vw;
    background-color:skyblue;
    border-radius:25px;
    color:black;
    transform: translateX(1.5vw);
}
a
{
	text-decoration:none;
}
#password
{
    margin: 7% 5%;
    padding: 4% 2.5%;
    border-radius: 5px;
    border: 0.5px solid gray;
    outline: 0.5px solid gray;
}
#balance
{
transform:translateX(-7vw);
}
    </style>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="navbar">
        <%User user=(User)session.getAttribute("user");
	    String name=user.getName();%>
        <div class="navbar-left">
            <span class="username">WELCOME, <%=name%></span>
        </div>
        <div class="navbar-center">
            <input type="text" class="search-bar" placeholder="Search...">
            <button class="main-button" id="search">Search</button>
        </div>
        <div class="navbar-right">
            <div class="dropdown">
                <button class="main-button">Menu</button>
                <div class="dropdown-content">
                    <a href="Profile.jsp"><button class="submenu-button">Profile</button></a>
                    <a href="Update.jsp"><button class="submenu-button">Update</button></a>
                    <a href="Delete.jsp"><button class="submenu-button">Delete</button></a>
                    <a href="index.jsp"><button class="submenu-button">Logout</button></a>
                </div>
            </div>
            <div class="dropdown">
                <button class="main-button">Account</button>
                <div class="dropdown-content">
                    <a href="accountdetails.jsp"><button class="submenu-button">Account Details</button></a>
                    <div class="dropdown-submenu">
                        <button id="transaction" class="submenu-button">tranaction</button>
                        <div id="trans" class="submenu-content">
                            <a href="selftransfer.jsp"><button class="submenu-button">To Self Account</button></a>
                            <a href="Transaction.jsp"><button class="submenu-button">To Other Accounts</button></a>
                        </div>
                    </div>
                    <a href="history"><button class="submenu-button">History</button></a>
                </div>
            </div>
            <div class="dropdown">
                <button class="main-button">Balance</button>
                <div id="balance" class="dropdown-content">
                    <%String pass= ((User)session.getAttribute("user")).getPassword();
                    Bank bank=(Bank)session.getAttribute("bank");
                    int balance=bank.getBalance();
                    long account=bank.getAccountnumber();
                    if(account>0)
                    {%>
                    <input type="password" id="password" placeholder="Enter Password"/>
                    <h2 id="bal" style="display:none;">₹ <%=balance%>. INR</h2>
                    <button class="submit-button" id="sub" onclick="fun1('<%=pass%>')">Submit</button>
                    <%}
                    else
                    {
                        out.println("<h3 style='padding:4%'>no account to fetch balance from</h3>");
                    }%>
                </div>
            </div>
        </div>
    </div>

    <div class="content">
        <h1>Welcome to Our Banking Service</h1>
        <p>Your reliable partner for all your banking needs.</p>
        <%String status= (String)session.getAttribute("status");
		if(status!="created")
		{
		%>
        <a href="bankaccount.jsp"><button class="create-account-button">Create Account</button></a>
        <% }%>
    </div>

    <div class="footer">
        <p>Contact Details: Email - umesh@gmail.com | Phone - +8374535194</p>
    </div>
<script>
	function fun1(pass)
	{
		var password=document.getElementById("password");
		var sub=document.getElementById("sub");
		var bal=document.getElementById("bal");
		if(pass===password.value)
		{
			password.style.display="none";
			bal.style.display="block";
			sub.style.display="none";
		}
		else
		{
			password.value="";
			password.setAttribute("placeholder","invalid password");
			password.style.border="1px solid red";
		}
	}
</script>
</body>
</html>