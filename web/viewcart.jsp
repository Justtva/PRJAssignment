<%-- 
    Document   : viewcart
    Created on : Mar 10, 2022, 2:51:32 AM
    Author     : Bi
--%>

<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Order order = (Order) session.getAttribute("order");
        %>
    </head>
    <body>
        <%if (order != null) {%>     
        <table border="1px">
            <tr>
                <td>Name</td>
                <td>Quantity</td>
                <td>Price</td>
                <td>Total</td>

            </tr>
            <%for (OrderDetail od : order.getDetails()) {%>
            <tr>
                <td><%=od.getProduct().getName()%></td>
                <td><%=od.getQuantity()%></td>
                <td><%=od.getProduct().getSell_price()%></td>
                <td><%=od.getTotal()%></td>
            </tr>        
            <%}%>
            <tr>
                <td colspan ="3"></td>
                <td><%=order.getTotal()%></td>
            </tr>
            <form action="../confirmorder" method="POST">               
                <input type="submit" value="Thanh toán">
            </form>
        </table>
        <%} else {%>
        Chưa có hàng nào!
        <%}%>
    </body>
</html>
