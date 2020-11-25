<%-- 
    Document   : checkout
    Created on : Nov 22, 2020, 4:37:21 PM
    Author     : YUME
--%>

<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
    </head>
    <body>
        <h1>Order Submitted Successfully!</h1>
        <%
            double totalPrice = ((Cart) session.getAttribute("cart")).getTotal();
        %>
        <h1>The total ammount is <%= totalPrice %> ฿</h1>
        <% session.invalidate(); %>
    </body>
</html>
