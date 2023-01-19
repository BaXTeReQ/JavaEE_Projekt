        <footer style='z-index:10;'>
            <h1>© Adam Bakowicz</h1>
        </footer>

        <% } catch (Exception e) {
                out.print(e);
           }
        %>

        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="slick.js"></script>
        <script src="hamburger.js"></script>
        <script src="script.js"></script>

    </body>
    
    <%
        session.setAttribute("goodUser", "");
        session.setAttribute("goodRegistration", "");
    %>
</html>