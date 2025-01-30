<%@page import="bank_dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Account</title>
</head>
<style>
 body
        {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        .form {
        display: flex;
        width: 35%;
        flex-direction: column;
        gap: 10px;
        max-width: 350px;
        padding: 25px 30px;
        border-radius: 20px;
        position: relative;
        background-color: rgba(17, 24, 39, 1);
        box-shadow: 0px 0px 10px white;
        color: #fff;
        border: 1px solid #333;
        margin: 5% 35%;
        }

        .title {
        font-size: 28px;
        font-weight: 600;
        letter-spacing: -1px;
        position: relative;
        display: inline;
        align-items: center;
        padding-left: 30px;
        color:rgba(167, 139, 250, 1);
        margin: 0px;
        }

        .title::before {
        width: 18px;
        height: 18px;
        }

        .title::after {
        width: 18px;
        height: 18px;
        animation: pulse 1s linear infinite;
        }

        .title::before,
        .title::after {
        position: absolute;
        content: "";
        height: 16px;
        width: 16px;
        border-radius: 50%;
        left: 0px;
        background-color:  rgba(167, 139, 250, 1);
        }

        .message, 
        .signin {
        font-size: 14.5px;
        color: rgba(255, 255, 255, 0.7);
        z-index:1;
        }

        .signin {
        text-align: center;
        }

        .signin a:hover {
        text-decoration: underline royalblue;
        }

        .signin a {
        color: rgba(167, 139, 250, 1);
        }

        .flex {
        display: flex;
        width: 100%;
        gap: 6px;
        }

        .form label {
        position: relative;
        }

        .form label .input {
        background-color: transparent;
        color: #fff;
        width: 95%;
        font-size: auto;
        padding: 10px 10px 10px 10px;
        border: 1px solid black;
        outline: 1px solid  rgba(167, 139, 250, 1);
        border-radius: 2px;
        }

        .form label .input + span {
        color: rgba(255, 255, 255, 0.5);
        position: absolute;
        left: 10px;
        top: 0px;
        font-size: 0.9em;
        cursor: text;
        transition: 0.3s ease;
        }

        .form label .input:placeholder-shown + span {
        top: 12.5px;
        font-size: 0.9em;
        }

        .form label .input:focus + span,
        .form label .input:valid + span {
        color: rgba(167, 139, 250, 1);
        top: 0px;
        font-size: 0.7em;
        font-weight: 600;
        }

        .input-group {
        margin-top: 0.25rem;
        font-size: 0.875rem;
        line-height: 1.25rem;
        }
        .input-group input {
        width: 90%;
        border-radius: 0.375rem;
        border: 1px solid rgba(55, 65, 81, 1);
        outline: 0;
        background-color: rgba(1, 1, 1, 0.5);
        padding: 2% 3%;
        color: rgba(243, 244, 246, 1);
        }
        .input-group label {
        display: block;
        color: rgba(156, 163, 175, 1);
        margin-bottom: 4px;
        }
        .input-group input:focus {
        border-color: rgba(167, 139, 250);
        }

        .submit {
        border: none;
        outline: none;
        padding: 10px;
        border-radius: 10px;
        color: #fff;
        font-size: 16px;
        margin:2vh 5vw;
        padding:2vh 5vw;
        background-color:  rgba(167, 139, 250, 1);
        position:relative;
        }
		img
		{
			height:10px;
			width:10px;
			border:0.5px solid white;
			background-color:white;
			transform:translate(25vw,-4vh);
		}
        @keyframes pulse {
        from {
            transform: scale(0.9);
            opacity: 1;
        }

        to {
            transform: scale(1.8);
            opacity: 0;
        }
        }

</style>

<body>

		<%HttpSession s= request.getSession();
		User user=(User)s.getAttribute("user");%>
        
        <form class="form" action="update" method="post">
        <p class="title">Enter Your Details</p>
        <div class="input-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value=<%=user.getName()%> readonly>
                <img src="edit.png" class="edit" onclick="fun1()">
                <label for="mobile">Mobile:</label>
                <input type="tel" id="mobile" name="mobile" maxlength=10 minlength=10 value=<%=user.getMobile()%> readonly>
                <img src="edit.png" class="edit" onclick="fun2()">
                <label for="age">Age:</label>
                <input type="number" id="age" name="age" value=<%=user.getAge()%> readonly>
                <img src="edit.png" class="edit" onclick="fun3()">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value=<%=user.getPassword()%> readonly>
                <img src="edit.png" class="edit" style="transform:translate(25vw,-8vh)" onclick="fun4()">
         
            <button class="submit" type="submit">Update</button>
    	</div>
        </form>
    <script>
	var inputs= document.querySelectorAll("input");
	function fun1()
	{
		inputs[0].removeAttribute("readonly");
		inputs[0].style.backgroundColor="transparent";
	}
	function fun2()
	{
		inputs[1].removeAttribute("readonly");
		inputs[1].style.backgroundColor="transparent";
	}
	function fun3()
	{
		inputs[2].removeAttribute("readonly");
		inputs[2].style.backgroundColor="transparent";
	}
	function fun4()
	{
		inputs[3].removeAttribute("readonly");
		inputs[3].style.backgroundColor="transparent";
	}
</script>
</body>
</html> 