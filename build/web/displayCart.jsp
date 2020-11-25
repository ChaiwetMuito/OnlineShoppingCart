<%-- 
    Document   : displayCart
    Created on : Nov 21, 2020, 5:04:45 PM
    Author     : YUME
--%>
<%@page import="model.Dvd"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Cart"%>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    
    if (cart == null){
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
    Vector items = cart.getItem();
    if(items.size() != 0){
    
%>
<h1>Cart</h1>
<br>
<table border="4">
    <tr><th>DVD name<th>Rate<th>Year<th>Price<th>Quantity<th>Remove
<!--            <th>DVD name</th>
            <th>Rate</th>
            <th>Year</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Remove</th>
          </tr>          -->
    <%
        int numItem = items.size();
        //NumberFormat currency = NumberFormat.getCurrencyInstance();
        for(int i = 0; i < numItem; i++){
            Dvd item = (Dvd) items.elementAt(i);
    %>
            <tr>
            <form name="removeItem" action="removeItem" method="POST">
                <td><%= item.getDvdname() %></td>
                <td><%= item.getRate() %></td>
                <td><%= item.getYearr() %></td>
                <td><%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td>
                    <input type="hidden" name="item" value='<%= i %>' />
                    <input type="submit" value="remove" name="remove" />
            </form>
            </tr>
    <%  
        }
    %>
</table>
<form name="checkput "action="checkput" method="POST">
    <input type="submit" value="checkout" name="checkout" />
</form> 
<%
    }
%>