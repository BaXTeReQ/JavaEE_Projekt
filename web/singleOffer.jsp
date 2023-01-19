<%-- 
    Document   : index
    Created on : 21 lis 2022, 09:35:31
    Author     : BaXTeR
--%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@include file="header.jsp"%>

        <section class="singleOffer">
            <div class="container-sm">
                <div class="row">
                    <div class="col-xs-12 col-md-6">
                        <img src="images/Img<% out.print(request.getParameter("id")); %>.jpg" alt="Offer Img">
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <%
                            String query = "SELECT * FROM samochody where ID =" + request.getParameter("id") + ";";
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                                String id = rs.getString("ID");
                                String marka = rs.getString("Marka");
                                String model = rs.getString("Model");
                                String pochodzenie = rs.getString("Pochodzenie");
                                String cena = rs.getString("Cena");
                                String kolor = rs.getString("Kolor");
                                String naped = rs.getString("Napęd");
                                String silnik = rs.getString("Silnik");
                                String rocznik = rs.getString("Rocznik");
                                String rodzajOferty = rs.getString("RodzajOferty");
                                String opis = rs.getString("Opis");
                        %>
                        <input type="hidden" name="id" value="<% out.print(id); %>">
                        <span class="h4"><% out.print(marka + " " + model); %></span>
                        <span class="h4">Kraj pochodzenia: <% out.print(pochodzenie); %></span>
                        <span class="h4" id="carPrice">Cena: <% out.print(cena); %></span>
                        <span class="h4">Kolor: <% out.print(kolor); %></span>
                        <span class="h4">Napęd: <% out.print(naped); %></span>
                        <span class="h4">Silnik: <% out.print(silnik); %></span>
                        <span class="h4">Rocznik: <% out.print(rocznik); %></span>
                        <span class="h4 offercheck" id="oferta">Rodzaj oferty: <% out.print(rodzajOferty); %></span>
                    </div>
                    <div class="col-xs-12">
                        <p class="h5"><% out.print(opis); %></p>
                        <form action="confirmation.jsp" method="POST">
                            <% if (rodzajOferty.equals("Leasing")) { %>
                            <span class='h4 center-xs'><i class='fas fa-chevron-down'></i> Policz cenę leasingu <i class='fas fa-chevron-down'></i></span>
                            <span class='h4'>Okres spłaty leasingu w miesiącach: </span>
                            <input type='number' id='months' name='number'></input>
                            <span class='h4 alert'></span>
                            <span class='h4 offerPrice' name='cost'>Cena: </span>
                            <input type='hidden' name='cost' id='cost'></input>
                            <% } else if (rodzajOferty.equals("Wypozyczenie")) { %>
                            <span class='h4 center-xs'><i class='fas fa-chevron-down'></i> Policz cenę wypożyczenia <i class='fas fa-chevron-down'></i></span>
                            <span class='h4'>Ilość dni wypożyczenia: </span>
                            <input type='number' id='days' name='number'></input>
                            <span class='h4 alert'></span>
                            <span class='h4 offerPrice' name='cost'>Cena: </span>
                            <input type='hidden' name='cost' id='cost'></input>
                            <% } else { %>
                            <input type='hidden' id='days' name='number' value='0'></input>
                            <input type='hidden' name='cost' id='cost'></input> 
                            <% } %>
                            <input type='hidden' name='orderType' id='orderType' value='<% out.print(rodzajOferty); %>'></input>
                            <input type="hidden" name="id" value="<% out.print(request.getParameter("id")); %>"></input>
                            <% if(session.getAttribute("username") != ""){ %>
                            <button type='submit' id='order'>Zamów</button>
                            <% } else { %>
                            <a href="account.jsp" style="font-size: 16px; margin-top: 20px;">Aby złożyć zamówienie musisz się zalogować <i class='fas fa-arrow-right'></i></a>
                            <% }
                               } %>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%@include file="footer.jsp"%>
