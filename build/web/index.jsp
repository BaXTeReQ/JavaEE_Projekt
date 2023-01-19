<%-- 
    Document   : index
    Created on : 21 lis 2022, 09:35:31
    Author     : BaXTeR
--%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@include file="header.jsp"%>

<%
    int maxID = 0;
    String query = "SELECT MAX(ID) as 'max' from samochody;";
    ResultSet rs = stmt.executeQuery(query);
    if(rs.next())                 
        maxID = Integer.parseInt(rs.getString("max")) + 1;
%>

<section class="slider">            
    <% for (int i = 1; i < maxID; i++) { %>
    <div>
        <%
            query = "SELECT * FROM samochody where ID =" + String.valueOf(i) + ";";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                String marka = rs.getString("Marka");
                String model = rs.getString("Model");
        %>
        <h2><% out.print(marka); %></h2>
        <h3><% out.print(model); %></h3>
        <% } %>
        <img src="images/Img<%= i%>.jpg" alt="Slider img">
        <a href="#offer"><i class="fas fa-chevron-down"></i> Oferta <i class="fas fa-chevron-down"></i></a>
    </div>
    <% } %>
</section>

<section style="display: flex; justify-content: center;">
    <input type="text" style="margin:20px auto 0;" id="search" onkeyup="search()" placeholder="Szukaj nazwy">
</section>

<section class="offer" id="offer">
    <div>
        <nav>
            <ul>
                <li>
                    <button id="Leasing">Leasing</button>
                </li>
                <li>
                    <button id="Kupno">Kupno</button>
                </li>
                <li>
                    <button id="Wypozyczenie">Wypożyczenie</button>
                </li>
                <li>
                    <button id="all" class="btn--active">Wszystko</button>
                </li>
            </ul>
        </nav>
        <div class="row">
            <% for(int i = 1; i < maxID; i++) { %>
            <div class='col-xs-12 col-sm-6 col-lg-4 card--selected'>
                <%
                    query = "SELECT * FROM samochody where ID =" + String.valueOf(i) + ";";
                    rs = stmt.executeQuery(query);
                    if (rs.next()) {
                        String marka = rs.getString("Marka");
                        String model = rs.getString("Model");
                        String pochodzenie = rs.getString("Pochodzenie");
                        String cena = rs.getString("Cena");
                        String rodzajOferty = rs.getString("RodzajOferty");
                %>
                <div class='card' id='<% out.print(rodzajOferty);%>'>
                    <img src='images/Img<%= i%>.jpg' alt='Card img'>
                    <form action='singleOffer.jsp' method='POST'>
                        <input type='hidden' name='id' value='<%= i%>'></input>
                        <span><% out.print(marka); %></span>
                        <span><% out.print(model); %></span>
                        <span><% out.print(pochodzenie); %></span>
                        <span><% out.print(cena); %></span>
                        <span><% out.print("Rodzaj oferty: " + rodzajOferty); %></span>
                        <input type="hidden" id="rodzaj" value="<% out.print(rodzajOferty); %>"></input>
                        <button type='submit'>Więcej <i class='fas fa-chevron-right'></i></button>
                    </form>
                </div>
            </div>
            <% }
                rs.close();
                }
                con.close();
            %>
        </div>
    </div>
</section>

<%@include file="footer.jsp"%>
