<%-- 
    Document   : index
    Created on : 21 lis 2022, 09:35:31
    Author     : BaXTeR
--%>

<%@ page contentType="text/html; charset=UTF-8" %>

<%@include file="header.jsp"%>

<section class="confirmation">
    <div class="container-sm">
        <div class="row">
            <div class="col-xs-12 col-md-6">
                <img src="images/Img<% out.print(request.getParameter("id")); %>.jpg" alt="Offer Img">
            </div>
            <div class="col-xs-12 col-md-6">
                <%
                  String query = "SELECT * FROM samochody where ID =" + request.getParameter("id") + ";";
                  ResultSet rs = stmt.executeQuery(query);
                  
                  String user = (String)session.getAttribute("username");
                  
                  String cost = request.getParameter("cost");
                  String number = request.getParameter("number");
                  String orderType2 = request.getParameter("orderType");
                  String carID2 = request.getParameter("id");
                  
                    while (rs.next()) {
                        String carID = rs.getString("ID");
                        String orderType = rs.getString("rodzajOferty");
                        String pochodzenie = rs.getString("Pochodzenie");
                        String carName = rs.getString("Marka") + " " + rs.getString("Model");
                %>

                <h2>Zamówiono!</h2>
                <span class="h3"><% out.print(carName); %></span>
                <span class="h3"><% if(orderType.equals("Leasing")){ %>
                    Czas spłaty leasingu: <% out.print(number); %>
                    <% } if(orderType.equals("Wypozyczenie")){ %>
                    Czas wypożyczenia: <% out.print(number); %>
                    <% } %>
                </span>
                <span class="h3">Cena Zamówienia: <% out.print(cost); %></span>

                <% }        
                    query = "INSERT INTO zamowienia (ID_Zamowienia, RodzajOferty, Cena_Zamowienia, Długosc_Zamowienia, ID_Auta, Konto) VALUES (NULL, '" + orderType2 + "', " + cost + ", " + number + ", " + carID2 + ", '" + user + "');";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.executeUpdate();

                    query = "SELECT * FROM zamowienia WHERE ID_Zamowienia = (SELECT max(ID_Zamowienia) FROM zamowienia);";
                    rs = stmt.executeQuery(query);
                    while (rs.next()) {
                    String infoID = rs.getString("ID_Zamowienia");
                %>
                <span class='h3'>ID Zamówienia: <% out.print(infoID); %></span>
                <% } %>
            </div>
            <a type="button" href="index.jsp">Strona główna</a>
        </div>
    </div>
</section>

<%@include file="footer.jsp"%>
