<%--<%@page import="db.*" %>--%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="description" content="App od Bakovith Cars">
        <title>
            Bakovitch Cars
        </title>
        <!-- Font Awesome -->
        <link href="https://kit-free.fontawesome.com/releases/latest/css/free-v4-shims.min.css" media="all" rel="stylesheet" id="font-awesome-5-kit-css">
        <link href="https://kit-free.fontawesome.com/releases/latest/css/free-v4-font-face.min.css" media="all" rel="stylesheet" id="font-awesome-5-kit-css">
        <link href="https://kit-free.fontawesome.com/releases/latest/css/free.min.css" media="all" rel="stylesheet" id="font-awesome-5-kit-css">
        <!-- Local -->
        <link rel="stylesheet" href="style.css">
    </head>

    <%      
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/oferta", "root", "");
            Statement stmt = con.createStatement();
    %>

    <body class="">
        <header>
            <div>
                <h1><a href="index.jsp" style="color: white; text-decoration: none;">Bakovitch Cars</a></h1>
                <nav>
                    <ul>
                        <li><a href="about.jsp">O firmie</a></li>
                        <li><a href="contact.jsp">Kontakt</a></li>
                        <li><a href="account.jsp"><i class="fas fa-user"></i> 
                                <% 
                                    if(session.getAttribute("username") != "" && session.getAttribute("username") != null ){ 
                                        out.print(session.getAttribute("username"));
                                    } else { 
                                        out.print("Konto");
                                    }
                                %>
                            </a>
                        </li>
                    </ul>
                </nav>
                <button class="hamburger hamburger--slider" type="button">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </button>
            </div>
        </header>