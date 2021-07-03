

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Reggae+One&display=swap" rel="stylesheet">
        <style>
            a:hover {
                background-color: #FB7200;
                color: #002B36;
                margin: 10px 10px;
                font-size: 30px;
            }
            .previous {
                background-color: whitesmoke;
                color: #002B36;
                border-radius: 50%;
                float: right;
                margin: 20px 20px;
                font-size: 25px;
                text-align: center;
                padding: 20px 30px;
                text-decoration: none;
            }
            .relative{
                background-color: whitesmoke;
                color: #002B36;
                position: relative;
                width: 750px;
                height: 350px;
                margin: auto;
                margin-top: 100px;
            }
            .absolute{
                background-color: #FB7200;
                color: #002B36;
                position: absolute;
                width: 350px;
                height: 440px;
                top: -45px;
                right: 30px;
                text-align: center;
                font-size: 35px;
            }
            input[type=text] {
                background-color: transparent;
                color: #002B36;
                padding: 10px 10px;
                border: 3px solid white;
                margin-top: 15px;
                text-decoration: none;
                font-size: 20px;
            }
            input[type=password] {
                background-color: transparent;
                color: #002B36;
                padding: 10px 10px;
                border: 3px solid white;
                margin-top: 15px;
                text-decoration: none;
                font-size: 20px;
            }
            input[type=submit] {
                background-color: #FB7200;
                border: none;
                color: #002B36;
                padding: 15px 30px;
                text-decoration: none;
                margin-left: 90px;
                margin-top: 30px;
                cursor: pointer;
                font-size: 20px;
                text-align: center;
            }
            input[type=submit]:hover {
                font-size: 25px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In Page</title>
    </head>
    <body style="background-color: #002B36; font-family: Oswald;">
        <% 
            if(session.getAttribute("status") == "failed"){%>
            <script>
                alert("Incorrect Username/Password.");
            </script><%
                session.removeAttribute("status");
                session.invalidate();
            }
        %>
        <a href="index.html" class="previous"><b>Back</b> &raquo;</a>
        <h1 style="color: #FB7200; text-align: center; font-size: 105px; margin-left: 150px; margin-top: 20px; text-decoration: none; font-family: Reggae One;"><b>Login</b></h1>
        <div class="relative">
            <h1 style="font-size: 37px; padding-left: 20px; padding-top: 80px;"><b>Don't have an account??</b></h1><br>
            <input type="submit" value="Sign Up Now!" onclick="window.location = 'signup.jsp';">
            <div class="absolute">
                <br>
                <form action = "signin" method = "post">
                    <b>Username:</b> <br><input style="margin-bottom: -25px;" type="text" name="Username" autocomplete="off" required="required"><br><br>
                    <b>Password:</b> <br><input type="password" name="Password" autocomplete="off" required="required"><br>
                <input style="background-color: whitesmoke; margin: auto; margin-top: 25px;" type="submit" value="Sign In!">
                </form>
            </div>
        </div>
        
    </body>
</html>
