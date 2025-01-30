<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <Style>
        body
        {
            width: 100%;
            height: 100%;
            overflow: hidden;
            background: linear-gradient(to right, black, purple );
        }
        .form-container {
        width: 25vw;
        border-radius: 0.75rem;
        background-color: rgba(17, 24, 39, 1);
        padding: 2rem;
        color: rgba(243, 244, 246, 1);
        margin: 7% 35%;
        box-shadow: 0px 0px 10px white;
        }

        .title {
        text-align: center;
        color:  rgba(167, 139, 250, 1);
        font-size: 1.5rem;
        line-height: 2rem;
        font-weight: 700;
        }

        .form {
        margin-top: 1.5rem;
        }

        .input-group {
        margin-top: 0.25rem;
        font-size: 0.875rem;
        line-height: 1.25rem;
        }

        .input-group label {
        display: block;
        color: rgba(156, 163, 175, 1);
        margin-bottom: 4px;
        }

        .input-group input {
        width: 90%;
        border-radius: 0.375rem;
        border: 1px solid rgba(55, 65, 81, 1);
        outline: 0;
        background-color: rgba(17, 24, 39, 1);
        padding: 0.75rem 1rem;
        color: rgba(243, 244, 246, 1);
        }

        .input-group input:focus {
        border-color: rgba(167, 139, 250);
        }

        .forgot {
        display: flex;
        justify-content: flex-end;
        font-size: 0.75rem;
        line-height: 1rem;
        color: rgba(156, 163, 175,1);
        margin: 8px 0 14px 0;
        }

        .forgot a,.signup a {
        color: rgba(243, 244, 246, 1);
        text-decoration: none;
        font-size: 14px;
        }

        .forgot a:hover, .signup a:hover {
        text-decoration: underline rgba(167, 139, 250, 1);
        }

        .sign {
        display: block;
        width: 100%;
        background-color: rgba(167, 139, 250, 1);
        padding: 0.75rem;
        text-align: center;
        color: rgba(17, 24, 39, 1);
        border: none;
        border-radius: 0.375rem;
        font-weight: 600;
        }

        .social-message {
        display: flex;
        align-items: center;
        padding-top: 1rem;
        }

        .line {
        height: 1px;
        flex: 1 1 0%;
        background-color: rgba(55, 65, 81, 1);
        }

        .social-message .message {
        padding-left: 0.75rem;
        padding-right: 0.75rem;
        font-size: 0.875rem;
        line-height: 1.25rem;
        color: rgba(156, 163, 175, 1);
        }

        .social-icons {
        display: flex;
        justify-content: center;
        }

        .social-icons .icon {
        border-radius: 0.125rem;
        padding: 0.75rem;
        border: none;
        background-color: transparent;
        margin-left: 8px;
        }

        .social-icons .icon svg {
        height: 1.25rem;
        width: 1.25rem;
        fill: #fff;
        }

        .signup {
        text-align: center;
        font-size: 0.75rem;
        line-height: 1rem;
        color: rgba(156, 163, 175, 1);
        }

    </Style>
    <title>Forgot Password</title>
</head>
<body>
    <div class="form-container">
        <p class="title">Forgot Password</p>
        <form class="form" action="forgot" method="post">
            <div class="input-group">
                <label for="username">Email</label>
                <input type="text" name="email" id="username" placeholder="Enter your email" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Enter your password" required>
                <label for="password">Password</label>
                <input type="password" placeholder="confirm password">
            </div>
            <br>
            <p style="opacity:0;display:inline;" id="msg">passwords doesnot match</p>
            <br><br>
            <button class="sign" disabled>Change Password</button>
            <br>
            <% 
	    String msg=(String)request.getAttribute("msg");
               	if(msg!=null)
                {
                	out.println("<p>"+msg+"</p>");
         		}%>
         		
        </form>
    </div>
    <script>
        var inputs=document.querySelectorAll("input");
        var msg=document.getElementById("msg");
        var confirm=inputs[2];
        var submit=document.querySelector("button");
        confirm.addEventListener("input",()=>
        {
            var pass= inputs[1].value;
            if(pass!=confirm.value)
            {
                console.log("hello");
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