<%-- 
    Document   : index
    Created on : 21 lis 2022, 09:35:31
    Author     : BaXTeR
--%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@include file="header.jsp"%>

<section class="logForm">
    <?php if(isset($_SESSION['username'])): ?>
    <section class="account">

        <%
            if(session.getAttribute("username") != null){
            if(session.getAttribute("username") != "" && (Integer)session.getAttribute("admin") == 0){
        %>
        <h2>Twoje zamówienia</h2>
        <div class="row">
            <%
                String query = "SELECT z.ID_Zamowienia, z.RodzajOferty, z.Cena_Zamowienia, z.Długosc_Zamowienia, s.Marka, s.Model, z.ID_Auta, z.status FROM zamowienia z, samochody s, klienci k where z.status = 0 and z.ID_Auta = s.ID and z.Konto = k.Login and k.Login = '" + session.getAttribute("username") + "';";
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        String carID = rs.getString("ID_Auta");
                        String orderID = rs.getString("ID_Zamowienia");
                        String orderType = rs.getString("rodzajOferty");
                        String orderPrice = rs.getString("Cena_Zamowienia");
                        String orderLength = rs.getString("Długosc_Zamowienia");
                        String carName = rs.getString("Marka") + " " + rs.getString("Model");
            %>
            <article>
                <img src="images/Img<%= carID %>.jpg">
                <div class="card-content">
                    <h3>ID Zamówienia: <%= orderID %></h3>
                    <h3>Rodzaj Oferty: <%= orderType %></h3>
                    <h3>Cena Zamówienia: <%= orderPrice %>zł</h3>
                    <% if(Integer.parseInt(orderLength) > 0){ %>
                    <h3>Długość Zamówienia: <%= orderLength %> dni</h3>
                    <% } %>
                    <h3>Samochód: <%= carName %></h3>
                </div>
            </article>
            <% } %>
        </div>
        <% }
           if((Integer)session.getAttribute("admin") == 1){
        %>
        <details>
            <summary style='list-style-type:none; cursor: pointer; width: fit-content; margin: 0 auto; display: flex; align-items: center; gap: 5px;'>
                <i class="fas fa-chevron-down"></i><h2>Lista użytkowników</h2><i class="fas fa-chevron-down"></i>
            </summary>
            <div class='row' style='display:flex; flex-wrap: wrap; flex-direction:column; justify-content: space-between;'>
                <div style='display: flex;margin: 5px auto;width: 80%;justify-content: space-evenly;'>
                    <span class='h4' style='width: 45%; text-align:center;'>Login</span>
                    <span class='h4' style='width: 45%; text-align:center;'>Hasło</span>
                    <span style='width: 10%'></span>
                </div>
                <%
                    String query = "SELECT Login, Haslo FROM klienci WHERE typ_konta = 0;";
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                %>
                <form action='deleteUser' method='POST' style='display: flex;margin: 5px auto;width: 80%;justify-content: space-evenly; padding:0; border:none; flex-direction: row;'>
                    <input type='text' readonly='readonly' class='h5' style='width: 45%; text-align:center; border: none;' name='login' value='<% out.print(rs.getString("Login")); %>'><% //out.print(rs.getString("Login")); %></input>
                    <input type='text' readonly='readonly' class='h5' style='width: 45%; text-align:center; border: none;' name='haslo' value='<% out.print(rs.getString("Haslo")); %>'><% //out.print(rs.getString("Haslo")); %></input>
                    <button type='submit' class="fas fa-trash" style='width: 10%; color: #e74c3c; margin: 0; padding: 0; max-width: unset; background-color: #ecf0f1; border: none;'></button>
                </form>
                <% } %>
            </div>
        </details>
        <details>
            <summary style='list-style-type:none; cursor: pointer; width: fit-content; margin: 0 auto; display: flex; align-items: center; gap: 5px;'>
                <i class="fas fa-chevron-down"></i><h2>Lista zamówień</h2><i class="fas fa-chevron-down"></i>
            </summary>
            <div class="row">
                <%
                    query = "SELECT z.ID_Auta, z.ID_Zamowienia, z.RodzajOferty, z.Cena_Zamowienia, z.Długosc_Zamowienia, s.Marka, s.Model, z.status, z.konto FROM zamowienia z, samochody s where z.ID_Auta = s.ID;";
                        rs = stmt.executeQuery(query);
                        while (rs.next()) {
                            String carID = rs.getString("ID_Auta");
                            String orderID = rs.getString("ID_Zamowienia");
                            String orderType = rs.getString("rodzajOferty");
                            String orderPrice = rs.getString("Cena_Zamowienia");
                            String orderLength = rs.getString("Długosc_Zamowienia");
                            String carName = rs.getString("Marka") + " " + rs.getString("Model");
                            String status = rs.getString("Status");
                            String account = rs.getString("Konto");
                %>
                <article>
                    <img src="images/Img<%= carID %>.jpg">
                    <form action='finishOrder' method='POST' class="card-content" style='width: unset; margin: 0; border-top-left-radius: 0; border-top-right-radius: 0; display: block; padding: 0;'>
                        <input type='hidden' name='id' value='<%= orderID %>'></input>
                        <h3>ID Zamówienia: <%= orderID %></h3>
                        <h3>Rodzaj Oferty: <%= orderType %></h3>
                        <h3>Cena Zamówienia: <%= orderPrice %>zł</h3>
                        <% if(Integer.parseInt(orderLength) > 0){ %>
                        <h3>Długość Zamówienia: <%= orderLength %> dni</h3>
                        <% } %>
                        <h3>Samochód: <%= carName %></h3>
                        <h3>Klient: <%= account %></h3>
                        <h3 style='color: <% if(Integer.parseInt(status) == 1) out.print("green"); else out.print("orange"); %>'>
                            <% if(Integer.parseInt(status) == 1) out.print("Zakończono"); else out.print("W trakcie"); %>
                        </h3>
                        <% if(Integer.parseInt(status) == 0){ %>
                        <button type='submit'>Zakończ zamówienie</button> 
                        <% } %>
                    </form>
                </article>
                <% } %>
            </div>
        </details>
        <details>
            <summary style='list-style-type:none; cursor: pointer; width: fit-content; margin: 0 auto; display: flex; align-items: center; gap: 5px;'>
                <i class="fas fa-chevron-down"></i><h2>Dodaj dane samochodu</h2><i class="fas fa-chevron-down"></i>
            </summary>
            <div class="row" style='margin: 0 auto; width: 100%; display: block;'>
                <article style='max-width: 100%;'>
                    <form action='addProduct' method='POST' style='display: flex; max-width: 500px;'>
                        <label for="brand" style='margin-top:10px;'>Marka</label>  
                        <input type="text" id='brand' name="brand">

                        <label for="model" style='margin-top:10px;'>Model</label>  
                        <input type="text" id='name' name="name">

                        <label for="origin" style='margin-top:10px;'>Pochodzenie</label>  
                        <input type="text" id='origin' name="origin">

                        <label for="price" style='margin-top:10px;'>Cena</label>  
                        <input type="text" id='price' name="price">

                        <label for="color" style='margin-top:10px;'>Kolor</label>  
                        <input type="text" id='color' name="color">

                        <label for="drive" style='margin-top:10px;'>Napęd</label>  
                        <input type="text" id='drive' name="drive">

                        <label for="engine" style='margin-top:10px;'>Silnik</label>  
                        <input type="text" id='engine' name="engine">

                        <label for="productionYear" style='margin-top:10px;'>Rocznik</label>  
                        <input type="text" id='productionYear' name="productionYear">

                        <label for="offerType" style='margin-top:10px;'>Rodzaj Oferty</label>  
                        <select id='offerType' name="offerType">
                            <option value='Kupno'>Kupno</option>
                            <option value='Wypozyczenie'>Wypożyczenie</option>
                            <option value='Leasing'>Leasing</option>
                        </select>    

                        <label for="description" style='margin-top:10px;'>Opis</label>  
                        <textarea type="text" id='description' name="description" rows='10' cols='10'></textarea>

                        <button type='submit'>Dodaj</button>
                    </form>
                </article>
            </div>
        </details>
        <% } %>
        <% } %>
    </section>
    <% 
        if(session.getAttribute("username") == "" || session.getAttribute("username") == null){
    %>
    <form action="logIn" method="POST">
        <h2>Zaloguj się</h2>
        <div>
            <label for="username">Nazwa użytownika</label>
            <input type="text" name="username" id="username">
        </div>
        <div>
            <label for="password">Hasło</label>
            <input type="password" name="password" id="password">
        </div>
        <button type="submit" name="login">Zaloguj się</button>
        <a href="register.jsp">Nie masz konta? Zarejestruj się</a>
        <% } else { %>
        <form action="logOut" method="POST">
            <h2>Wyloguj się</h2>
            <button type="submit" name="logout">Wyloguj się</button>
            <% } %>
        </form>
</section>

<script type="text/javascript">
    var Msg1 = '<%=session.getAttribute("goodUser")%>';
    var Msg2 = '<%=session.getAttribute("goodRegistration")%>';
    function alertName() {
        if (Msg1 === "false") {
            alert("Niepoprawne dane logowania");
        }
        if (Msg2 === "true") {
            alert("Użytkownik zarejestrowany");
        }
    }
</script>

<script type="text/javascript"> window.onload = alertName;</script>

<%@include file="footer.jsp"%>
