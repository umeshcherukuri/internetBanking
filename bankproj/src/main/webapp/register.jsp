<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body
        {
            width: 100%;
            height: 100%;
            overflow: hidden;
            background: url(bank.jpg);
            background-size:cover;
        }
        .form 
        {
        display: flex;
        width: 35%;
        flex-direction: column;
        gap: 10px;
        max-width: 350px;
        padding: 25px 30px;
        border-radius: 20px;
        position: relative;
        background-color: rgba(17, 24, 39, 0.8);
        box-shadow: 0px 0px 10px white;
        color: #fff;
        border: 1px solid #333;
        margin: 2% 35%;
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
        width: 93%;
        border-radius: 0.375rem;
        border: 1px solid rgba(55, 65, 81, 1);
        outline: 0;
        background-color: rgba(17, 24, 39, 1);
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
        transform: .3s ease;
        background-color:  rgba(167, 139, 250, 1);
        position:relative;
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
    <title>User Registration</title>
</head>
<body>
    
    <form class="form" action="register" method="post">
        <p class="title">Register </p>
        <div class="input-group">
            <label for="username">Name</label>
            <input type="text" name="name" id="username" placeholder="Enter your name" required>
            <label for="mobile">Mobile</label>
            <input type="tel" name="phone" id="mobile" placeholder="Enter your phone number" minlength=10 maxlength=10 required>
            <label for="email">Email</label>
            <input type="text" name="email" id="email" placeholder="Enter your email" required>
            <label for="age">Age</label>
            <input type="number" name="age" id="age" placeholder="Enter your age" min=18 required>
            <label for="password">Password</label>
            <input type="password" name="password" id="password" minlength=8 placeholder="Enter password" required>
            <label for="confirm">Password</label>
            <input type="password" id="confirm" placeholder="confirm password" required>
            <p style="opacity:0;display:inline" id="msg">passwords doesnot match</p>
        </div>
        <button class="submit" disabled>Submit</button>
        <%String msg = (String)request.getAttribute("msg");%>
        <p style="display:inline;height:1vh;width:100;margin:0px"><%if(msg!=null)
        {
            out.println(msg);
        }%></p>
        <p class="signin">Already have an account ? <a href="index.jsp">Signin</a> </p>
    </form>
    <script>
        var inputs=document.querySelectorAll("input");
        var msg=document.getElementById("msg");
        var confirm=inputs[5];
        var submit=document.querySelector("button");
        confirm.addEventListener("input",()=>
        {
            var pass= inputs[4].value;
            if(pass!=confirm.value)
            {
                msg.style.opacity=1;
            }
            else
            {
                msg.style.opacity=0;
                submit.removeAttribute("disabled");
            }
        });
    </script>
</body>
</html>