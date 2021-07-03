

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
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
                float: left;
                margin: 20px 20px;
                font-size: 25px;
                text-align: center;
                padding: 25px 30px;
                text-decoration: none;
                font-weight: 400;
            }

            input[type=submit] {
                background-color: #FB7200;
                border: none;
                color: #002B36;
                padding: 15px 30px;
                text-decoration: none;
                margin: 10px 10px;
                cursor: pointer;
                font-size: 20px;
                text-align: center;
            }
            input[type=text] {
                background-color: transparent;
                color: #FB7200;
                border: 3px solid whitesmoke;
                padding: 10px 15px;
                text-decoration: none;
                font-size: 20px;
                margin-top: 20px;
                font-weight: 400;
            }
            input[type=submit]:hover {
                font-size: 25px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up!</title>
    </head>
    <body style="background-color: #002B36; color: #FB7200; font-family: Oswald;">
        <% 
            if(session.getAttribute("status") == "uname"){%>
            <script>
                alert("Enter Username!");
            </script><%
                session.removeAttribute("status");
                session.invalidate();
            }
            else if(session.getAttribute("status") == "pass"){ %>
            <script>
                alert("Enter Password!");
            </script><%
                session.removeAttribute("status");
                session.invalidate();
            }
            else if(session.getAttribute("status") == "unameexists"){ %>
            <script>
                alert("Username already exists, enter another username.");
            </script><%
                session.removeAttribute("status");
                session.invalidate();
            }
            else if(session.getAttribute("status") == "successful"){ %>
            <script>
                alert("Sign Up successfull, thank you for using Note Log");
            </script><%
                session.removeAttribute("status");
                session.invalidate();
                //response.sendRedirect("index.html");
            }
        %>
        <a href="index.html" class="previous">&laquo; <b>Back</b></a>
        <br><br><br><br>
        <h1 style="text-align: center; font-size: 50px;">Device independent, customizable and easy to use Note Log<br>Sign Up now</h1>
        <div style="align-content: center; margin: auto; width: 20%; font-size: 30px; text-align: center;">
            <form action = "signup" method = "post">
                <b>Username:</b><input type ="text" name="Username" required="required" autocomplete="off"><br><br>
                <b>Password:</b><input type = "text" name="Password" required="required" autocomplete="off"><br><br>
                <input type="submit" value="Sign Up!">
            </form>
        </div>
        
    </body>
</html>
