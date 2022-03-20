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
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%@include file="include/navOrder.jsp"%>
        <%
            ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
            Integer pageindex = (Integer) request.getAttribute("pageindex");
            Integer totalpage = (Integer) request.getAttribute("totalpage");
        %>
        <div class="container">
            <table class="table table-hover">
                <thead class="table-primary fw-bold">
                <tr>
                    <td>Mã đơn hàng</td>
                    <td>Ngày xuất đơn</td>
                    <td>Tiền lãi</td>
                </tr>
                </thead>
                <%for (Order o : orders) {%>
                <tr>
                    <td><%=o.getId()%></td>
                    <td><%=o.getDate()%></td>
                    <td><%=o.getEarning()%></td>
                </tr>
                <%}%>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center pagger">
                    <div id="container" class="pagger"></div>
                </ul>
            </nav>
        </div>
        
        <script>
            pagger("container",<%=pageindex%>,<%=totalpage%>, 2);
        </script>
    </body>
</html>
