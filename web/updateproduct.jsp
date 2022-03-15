<%-- 
    Document   : updateproduct
    Created on : Mar 15, 2022, 5:12:27 AM
    Author     : Bi
--%>

<%@page import="model.Shipper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
        Product p = (Product) request.getAttribute("product");
        ArrayList<Shipper> shippers = (ArrayList<Shipper>) request.getAttribute("shippers");
        %>
    </head>
    <body>
        <form action="../product/update" method="post">
            Mã số hàng: <%=p.getId()%> <input type="hidden" value="<%=p.getId()%>" name="id"></br>
            Tên hàng:<input type="text" value="<%=p.getName()%>" name="name"> </br>
            Giá nhập:<%=p.getImport_price()%> <input type="hidden" value="<%=p.getImport_price()%>" name="import_price"></br>
            Giá bán: <input type="text" value="<%=p.getSell_price()%>" name="sell_price"> </br>
            Đại lý: <select name="sid">
                <%for (Shipper s : shippers) {%>
                <option 
                    <%if (s.getId() == p.getShipper().getId()) {%>
                    selected="selected"
                    <%}%>
                    value="<%=s.getId()%>"><%=s.getName()%></option>                  
                <%}%>
            </select></br>
            Ngày nhập:<input type="date" value="<%=p.getImportDate()%>" name="import_date"></br>
            Hạn sử dụng:<input type="date" value="<%=p.getExpireDate()%>" name="expire_date"></br>
            Số lượng còn:<input type="text" value="<%=p.getQuantity()%>" name="quantity">
            <br/>
            <input type="submit" value="Lưu">
        </form>
    </body>
</html>
