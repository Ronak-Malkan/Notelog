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
    	<link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css2?family=Nova+Flat&display=swap" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">
        <style>
            :root {
                --color1: #00EC3C;
                --color2: whitesmoke;
                --color3: black;
            }
            .notes{
                display: inline-block;
                background-color: var(--color3);
                color: rgba(0,236,60,0.9);
                height: 250px;
                width: 27.5%;
                margin: 40px;
                border: 3px solid var(--color1);
                box-shadow: 17px 17px 18px rgba(0,0,0,0.8);
                text-align: center;
                overflow-x: hidden;
                overflow-y: hidden;
                padding: 15px 20px;
                box-sizing: border-box;
                margin-top: 100px;
                resize: none;
                opacity: 1;
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
                width: 10%; 
                height: 55px;
                background-color: var(--color2); 
                color: var(--color3);
                border: 3px solid var(--color1);
                top: 10px;
                right: 30px;
                float: right;
                box-shadow: inset 8px 8px 8px rgba(0,0,0,0.7);
                text-align: center;
                font-size: 25px;
                text-decoration: none;
                padding-top: 0px;
                box-sizing: border-box;
                font-family: 'Gloria Hallelujah', cursive;
            }
            .headerButton{
                position: absolute; 
                width: 10%; 
                height: 55px;
                background-color: var(--color2); 
                color: var(--color3); 
                border: 3px solid var(--color1);
                top: 10px;
                right: 30px;
                float: right;
                box-shadow: inset 8px 8px 8px rgba(0,0,0,0.7);
                text-align: center;
                font-size: 25px;
                text-decoration: none;
                padding-top: 1px;
                box-sizing: border-box;
                font-family: 'Gloria Hallelujah', cursive;
            }
            .headerButtons:hover{
                transform: scale(1.07);
                box-shadow: inset 8px 8px 8px rgba(0,0,0,0.7);
            }
            .headerButton:hover{
                transform: scale(1.07);
                box-shadow: inset 8px 8px 8px rgba(0,0,0,0.7);
            }
            #addCircle{
                background-color: var(--color3);
                position: absolute;
                top: 29px;
                width: 7%;
                height: 100px;
                right: 46.5%;
                border-radius: 50%;
                border: 10px solid var(--color2);
                z-index: 20;
            }
            #plus{
                background-color: rgba(0,236,60,0.95);
                position: absolute;
                top: 49px;
                right: 50.12%;
                width: 1%;
                height: 75px;
                z-index: 50;
            }
            #plus2{
                background-color: rgba(0,236,60,0.95);
                position: absolute;
                top: 78px;
                right: 47.8%;
                width: 5.6%;
                height: 16px;
                z-index: 50;
            }
            #add{
                position: absolute;
                color: var(--color2);
                top: 53px;
                right: 48.45%;
                z-index: 51;
                font-size: 35px;
                visibility: hidden;
                font-family: 'Gloria Hallelujah', cursive;
            }
            .notes:hover{
                transform: scale(1.02);
                box-shadow: 20px 20px 32px rgba(0,0,0,0.9);
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body style = "background-color: var(--color2); color: var(--color2)">
        <%
            if(session.getAttribute("username") == null){
                response.sendRedirect("signin.jsp");
            }
            if(session.getAttribute("title") != null){
                session.removeAttribute("title");
            }
            if(session.getAttribute("theme") != null){
                session.removeAttribute("theme");
            }
            session.setAttribute("theme", "matrix");
        %>
        <div class = "header">
            <a href="${pageContext.request.contextPath}/logout" class="headerButtons"><b>Log Out</b></a>
            <span class="headerButton" style="left: 30px; z-index: 1;" onclick="move()"><b>Themes >></b></span>
            <a href="home.jsp" class="headerButton" style="left: 30px; box-shadow: none;" id="theme1"><b>Dark</b></a>
            <a href="home3.jsp" class="headerButton" style="left: 30px; box-shadow: none;" id="theme2"><b>Light</b></a>
            <a href="" class="headerButton" style="left: 210px; width: 5%;" id="hide" onclick="hide()">
                <b><<</b>
            </a>
            <div onmouseover="showAdd()" onmouseout="showPlus()">
                <a href="add2.jsp" id ="addCircle"></a>
                <a href="add2.jsp" id ="plus"></a>
                <a href="add2.jsp" id ="plus2"></a>
                <a href="add2.jsp" id ="add"><b>Add</b></a>
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
                <h1 style="font-size: 30px; margin: 10px 10px; font-family: 'Kaushan Script', cursive; letter-spacing: 1.8;">
                    <b>
                        <% out.println(rs.getString("title"));%>
                    </b>
                </h1>
                <p style="font-size: 25px; text-align: justify; margin-left: 12px; margin-right: 12px; font-family: 'Nova Flat', cursive; line-height: 1.4;">
                    <% if(rs.getString("body").length() > 95) out.println(rs.getString("body").substring(0,95) + "...");
                    else out.println(rs.getString("body"));
                    %>
                </p>
            </div><%
                elementExists = true;
            }
            if(elementExists == false){%>
            <br><br><br><br><br><br><br>
            <h1 style="color: var(--color3); font-size: 100px; text-align: center;">You don't have any saved notes</h1>
            <%}%>
            <form action="view2.jsp" method="post" id="sendId">
                <input type="hidden" name="Id" id="id" />
            </form>
        <script>
            function move(){
                document.getElementById("theme1").style.left = "195px";
                document.getElementById("theme2").style.left = "361px";
                document.getElementById("hide").style.left = "527px";
                document.getElementById("theme1").style.boxShadow = "inset 8px 8px 8px rgba(0,0,0,0.7)";
                document.getElementById("theme2").style.boxShadow = "inset 8px 8px 8px rgba(0,0,0,0.7)";
                document.getElementById("hide").style.boxShadow = "inset 8px 8px 8px rgba(0,0,0,0.7)";
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
