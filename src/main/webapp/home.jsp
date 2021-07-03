<%-- 
    Document   : home
    Created on : 15-Apr-2021, 10:36:25 am
    Author     : RONAK MALKAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Reggae+One&display=swap" rel="stylesheet">
        <style>
            :root {
                --color1: #002B36;
                --color2: #FB7200;
                --color3: whitesmoke;
            }
            .notes{
                display: inline-block;
                background-color: var(--color2);
                color: var(--color1);
                height: 250px;
                width: 27.5%;
                margin: 40px;
                opacity: 0.9;
                border: 1px solid var(--color3);
                box-shadow: inset 12px 12px 25px rgba(0,0,0,0.8), -3px -3px 10px rgba(0,0,0,0.8);
                text-align: center;
                overflow-x: hidden;
                overflow-y: hidden;
                padding: 15px 20px;
                box-sizing: border-box;
                margin-top: 100px;
                resize: none;
            }
            .header{
                position: absolute; 
                width: 100%; 
                height: 9.9%; 
                background-color: var(--color3); 
                color: var(--color1); 
                top: 0px;
                right: 0px;
                left: 0px;
            }
            .headerButtons{
                position: absolute; 
                width: 9%; 
                height: 42px;
                background-color: var(--color2); 
                color: var(--color1); 
                top: 13px;
                right: 30px;
                float: right;
                box-shadow: 5px 5px 5px rgba(0,0,0,0.6);
                text-align: center;
                font-size: 28px;
                text-decoration: none;
                padding-top: 1.3px;
                padding-bottom: 2px;
                font-family: Oswald;
                font-weight: 400;
            }
            .headerButton{
                position: absolute; 
                width: 9%; 
                height: 42px;
                background-color: var(--color2); 
                color: var(--color1); 
                top: 13px;
                right: 30px;
                float: right;
                box-shadow: 5px 5px 5px rgba(0,0,0,0.6);
                text-align: center;
                font-size: 28px;
                text-decoration: none;
                padding-top: 1.3px;
                padding-bottom: 2px;
                font-family: Oswald;
                font-weight: 400;
            }
            .headerButtons:hover{
                transform: scale(1.07);
                box-shadow: 7px 7px 15px rgba(0,0,0,0.8);
            }
            .headerButton:hover{
                transform: scale(1.07);
                box-shadow: 7px 7px 15px rgba(0,0,0,0.8);
            }
            #addCircle{
                background-color: var(--color2);
                position: absolute;
                top: 29px;
                width: 7%;
                height: 100px;
                right: 46.5%;
                border-radius: 50%;
                border: 10px solid var(--color1);
                z-index: 20;
            }
            #plus{
                background-color: var(--color3);
                position: absolute;
                top: 49px;
                right: 50.12%;
                width: 1%;
                height: 75px;
                z-index: 50;
            }
            #plus2{
                background-color: var(--color3);
                position: absolute;
                top: 78px;
                right: 47.8%;
                width: 5.6%;
                height: 16px;
                z-index: 50;
            }
            #add{
                position: absolute;
                color: var(--color1);
                top: 63px;
                right: 48.45%;
                z-index: 51;
                font-size: 38px;
                visibility: hidden;
            }
            .notes:hover{
                transform: scale(1.02);
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body style = "background-color: var(--color1); color: var(--color2)">
        <%
            if(session.getAttribute("username") == null){
                response.sendRedirect("signin.jsp");
            }
            if(session.getAttribute("title") != null){
                session.removeAttribute("title");
            }
            if(session.getAttribute("Id") != null){
                session.removeAttribute("Id");
            }
            if(session.getAttribute("theme") != null){
                session.removeAttribute("theme");
            }
            session.setAttribute("theme", "dark");
        %>
        <div class = "header">
            <a href="${pageContext.request.contextPath}/logout" class="headerButtons">Log Out</a>
            <span class="headerButton" style="left: 30px; z-index: 1;" onclick="move()">Themes >></span>
            <a href="home2.jsp" class="headerButton" style="left: 30px; box-shadow: none;" id="theme1">Matrix</a>
            <a href="home3.jsp" class="headerButton" style="left: 30px; box-shadow: none;" id="theme2">Light</a>
            <a href="" class="headerButton" style="left: 190px; width: 4%;" id="hide" onclick="hide()"> << </a>
            <div onmouseover="showAdd()" onmouseout="showPlus()">
                <a href="add.jsp" id ="addCircle"></a>
                <a href="add.jsp" id ="plus"></a>
                <a href="add.jsp" id ="plus2"></a>
                <a href="add.jsp" id ="add"><b>Add</b></a>
            </div>
        </div><br><br><br><br>
        <%
            String Uname = (String)session.getAttribute("username");
            String url = "jdbc:mysql://localhost:3306/notelog?autoReconnect=true&useSSL=false";
            String uname= "root";
            String pass = "root";
            String query = "select * from " + Uname;
            boolean elementExists = false;
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con;
            con = (Connection) DriverManager.getConnection(url, uname, pass);
            if (con == null){
                System.out.println("con is Null.");
            }
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            //rs.next();
            while(rs.next()){%>
            <div class="notes" onclick="sendTitle('<%out.print(rs.getInt("id"));%>')">
                <h1 style="margin: 10px 10px; font-family: Oswald; opacity: 1;">
                    <b>
                        <% out.println(rs.getString("title"));%>
                    </b>
                </h1>
                <p style="font-size: 28px; text-align: justify; margin-left: 12px; margin-right: 12px; font-family: Caveat; opacity: 1;">
                    <% if(rs.getString("body").length() > 140) out.println(rs.getString("body").substring(0,120) + "...");
                    else out.println(rs.getString("body"));
                    %>
                </p>
            </div><%
                elementExists = true;
            }
            if(elementExists == false){%>
            <br><br><br><br><br><br><br><br><br>
            <h1 style="color: var(--color2); font-size: 85px; text-align: center; font-family: Reggae One;">You don't have any saved notes</h1>
            <%}%>
            <form action="view.jsp" method="post" id="sendId">
                <input type="hidden" name="Id" id="id" />
            </form>
        <script>
            function move(){
                document.getElementById("theme1").style.left = "190px";
                document.getElementById("theme2").style.left = "350px";
                document.getElementById("hide").style.left = "510px";
                document.getElementById("theme1").style.boxShadow = "5px 5px 5px rgba(0,0,0,0.6)";
                document.getElementById("theme2").style.boxShadow = "5px 5px 5px rgba(0,0,0,0.6)";
                document.getElementById("hide").style.boxShadow = "5px 5px 5px rgba(0,0,0,0.6)";
            }
            function hide(){
                document.getElementById("theme1").style.left = "30px";
                document.getElementById("theme2").style.left = "30px";
                document.getElementById("hide").style.left = "30px";
                document.getElementById("theme1").style.boxShadow = "none";
                document.getElementById("theme2").style.boxShadow = "none";
                document.getElementById("hide").style.boxShadow = "none";
            }
            function showAdd(){
                document.getElementById("plus").style.visibility = "hidden";
                document.getElementById("plus2").style.visibility = "hidden";
                document.getElementById("add").style.visibility = "visible";
            }
            function showPlus(){
                document.getElementById("plus").style.visibility = "visible";
                document.getElementById("plus2").style.visibility = "visible";
                document.getElementById("add").style.visibility = "hidden";
            }
            function sendTitle(a){
                document.getElementById("id").value=a;
                document.getElementById("sendId").submit();
            }
        </script>
    </body>
</html>
