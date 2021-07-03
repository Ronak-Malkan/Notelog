<%-- 
    Document   : view
    Created on : 22-Apr-2021, 9:26:05 pm
    Author     : RONAK MALKAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300&display=swap" rel="stylesheet">
        <style>
            :root {
                --color1: #002B36;
                --color2: #FB7200;
                --color3: whitesmoke;
            }
            .note{
                background-color: var(--color1);
                color: var(--color2);
                border: 5px solid var(--color2);
                box-shadow: 25px 25px 40px rgba(0,0,0,0.9);
                width: 85%;
                height: 550px;
                text-align: center;
                box-sizing: border-box;
                margin: auto;
                margin-top: 150px;
            }
            .title{
                background-color: var(--color1);
                border-bottom: 3px solid var(--color3);
                font-family: Oswald;
                border-top: none;
                border-left: none;
                border-right: none;
                color: var(--color2);
                overflow-y: scroll;
                text-align: center;
                margin: auto;
                margin-top: 30px;
                font-size: 45px;
                resize: none;
                padding-top: 5px;
                padding-bottom: 5px;
                font-weight: bold;
            }
            .date{
                position: absolute;
                background-color: var(--color1);
                font-family: Oswald;
                border: none;
                color: var(--color2);
                overflow-y: scroll;
                text-align: center;
                right: 200px;
                top: 220px;
                font-size: 30px;
                resize: none;
                padding-top: 0px;
                font-weight: 300;
            }
            .body{
                font-family: Caveat;
                background-color: var(--color1);
                border: none;
                color: var(--color2);
                overflow: scroll;
                text-align: justify;
                margin: auto;
                margin-top: 30px;
                font-size: 35px;
                resize: none;
                padding-top: 0px;
                line-height: 1.4;
                letter-spacing: 1.4px;
            }
            .body::-webkit-scrollbar{
                display: none;
            }
            .title::-webkit-scrollbar{
                display: none;
            }
            .date::-webkit-scrollbar{
                display: none;
            }
            .button{
                position: absolute;
                background-color: var(--color1);
                border: 4px solid var(--color2);
                color: var(--color2);
                text-align: center;
                right: 60px;
                top: 30px;
                font-size: 33px;
                padding: 12px 40px;
                box-sizing: border-box;
                box-shadow: 15px 15px 15px rgba(0,0,0,0.75);
                font-family: Oswald;
                font-weight: 300;
            }
            .button:hover{
                transform: scale(1.07);
                box-shadow: 15px 15px 25px rgba(0,0,0,0.85);
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Note</title>
    </head>
    <body style="background-color: var(--color3);">
        <%
            if(session.getAttribute("username") == null){
                response.sendRedirect("signin.jsp");
            }
            String Uname = (String) session.getAttribute("username");
            int Id = Integer.parseInt(request.getParameter("Id"));
            session.setAttribute("Id", Id);
            String url = "jdbc:mysql://localhost:3306/notelog?autoReconnect=true&useSSL=false";
            String uname= "root";
            String pass = "root";
            String query = "select * from "+ Uname +" where id=?";
            System.out.println(query);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con;
            con = (Connection) DriverManager.getConnection(url, uname, pass);
            if (con == null){
                System.out.println("con is Null.");
            }
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, Id); 
            ResultSet rs = st.executeQuery();
            rs.next();
        %>
        <div class="note">
            <form action="edit" method="post">
                <textarea class="title" cols="24" rows="1" required="required" name="title" spellcheck="false"><%out.print(rs.getString("title"));%></textarea>
                <textarea class="date" cols="16" rows="1" required="required" name="date" spellcheck="false"><%out.print(rs.getString("date"));%></textarea><br><br>
                <textarea class="body" cols="98" rows="7" required="required" name="body" spellcheck="false"><%out.print(rs.getString("body"));%></textarea>
                <input class="button" type="submit" value="Save!" spellcheck="false">
            </form>
        </div>
        <a class="button" style="right: 275px; width: 170px; text-decoration: none;" href="${pageContext.request.contextPath}/delete">Delete</a>
        <a class="button" style="left: 60px; width: 200px; text-decoration: none;" href="home.jsp">&laquo;  Back</a>
       
    </body>
</html>
