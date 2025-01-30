<%@page import="bank_dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<style>
	body{
	width:100%;
	height:100vh;
	overflow:hidden;
	}
	#container
	{
		width:32%;
		height:70vh;
		display:block;
		border-radius:20px;
		background-color:rgba(17, 24, 39, 1);
		margin: 6% 33%;
		text-align:center;
		box-shadow:0px 0px 8px white;
		position:absolute;
	}
	h1
	{
		width:70%;
		heigth:4vh;
		display:inline;
		padding:3vh 0vw;
		positon:relative;
        color: rgba(167, 139, 250, 1);
	}
	h3
	{
		color:white;
		margin-top:5vh;
		width:90%;
		height:6vh;
		border-radius:30px;
		padding-top:1vh;
		margin-left:5%;
	}
	img
	{
		height:6vh;
		width:3vw;
		display:inline;
		margin:1vh,10vw;
	}
</style>
</head>
<body>
	<div id="container">
		<br>
		<% User user= (User)session.getAttribute("user"); %>
		<h1 id="title">Profile</h1>
		<h3>Name   : <%= user.getName() %></h3>
		<h3>Email  : <%= user.getEmail() %></h3>
		<h3>Mobile : <%= user.getMobile() %></h3>
		<h3>Age    : <%=user.getAge() %></h3>
		<a href="Home.jsp"><img src="home.png"></a>
	</div>
</body>
</html>