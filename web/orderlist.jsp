<%-- 
    Document   : orderlist
    Created on : Mar 15, 2022, 6:20:51 AM
    Author     : Bi
--%>

<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
            Integer pageindex = (Integer) request.getAttribute("pageindex");
            Integer totalpage = (Integer) request.getAttribute("totalpage");
        %>
        <script src="../jss/pagger.js" type="text/javascript"></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>Mã đơn hàng</td>
                <td>Ngày xuất đơn</td>
                <td>Tiền lãi</td>
            </tr>
            <%for (Order o : orders) {%>
            <tr>
                <td><%=o.getId()%></td>
                <td><%=o.getDate()%></td>
                <td><%=o.getEarning()%></td>
            </tr>
            <%}%>
        </table>
        <div id="container" class="pagger"></div>
        <script>
            pagger("container",<%=pageindex%>,<%=totalpage%>,2);
        </script>
    </body>
</html>
