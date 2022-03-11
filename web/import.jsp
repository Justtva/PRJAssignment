<%-- 
    Document   : import
    Created on : Mar 12, 2022, 3:00:11 AM
    Author     : Bi
--%>

<%@page import="model.Shipper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
        
        ArrayList<Shipper> shippers = (ArrayList<Shipper>)request.getAttribute("shippers");
        
        %>
    </head>
    <body>
        <form action="../product/import" method="post">
            Tên hàng:<input type="text" name="pname"></br>
            Giá nhập:<input type="text" name="import_price"></br>
            Số lượng:<input type="text" name="quantity"></br>
            Giá bán:<input type="text" name="sell_price"></br>
            Hạn sử dụng:<input type="date" name="expired_date"></br>
            Người giao hàng: <select name="sid">
                <%for (Shipper s : shippers) {%>
                <option value="<%=s.getId()%>"><%=s.getName()%></option>                  
                <%}%>
            </select>
            <input type="submit" value="Lưu">
        </form>
    </body>
</html>
