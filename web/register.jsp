<%-- 
    Document   : register
    Created on : 14 sty 2023, 10:31:38
    Author     : BaXTeR
--%>

<%@ page contentType="text/html; charset=UTF-8" %>

<%@include file="header.jsp"%>

<section class="logForm">
    <form action="register" method="POST">
        <h2>Zarejestruj się</h2>
        <div>
            <label for="username">Nazwa użytownika</label>
            <input type="text" name="username" id="username">
        </div>
        <div>
            <label for="password">Hasło</label>
            <input type="password" name="password" id="password">
        </div>
        <button type="submit" name="register" style="max-width: 200px;">Zarejestruj się</button>
    </form>
</section>

<script type="text/javascript">
    var Msg = '<%=session.getAttribute("goodUser")%>';
    if (Msg === "false") {
        function alertName() {
            alert("Dany użytkownik już istnieje!");
        }
    }
</script>

<script type="text/javascript"> window.onload = alertName;</script>


<%@include file="footer.jsp"%>