<%-- 
    Document   : shipperview
    Created on : Mar 13, 2022, 4:43:03 AM
    Author     : Bi
--%>

<%@page import="model.Shipper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
    </head>   
    <body>
        <%
        Shipper s = (Shipper)request.getAttribute("shipper");
        %>
        <%@include file="include/navInsertShipper.jsp"%>
        
        <div class="container">
        <h1 class="text-center fw-bold" >Công ty giao hàng <%=s.getName()%></h1>
        <h2 class="text-center fw-bold">Mã số: <%=s.getId()%></h2> </br>
        <div class="row">
        <div class="col-4">
        <h4>Số điện thoại: <%=s.getNumber()%></br></h4>
        <h4>Địa chỉ: <%=s.getAddress()%></br></h4>
        
        
        </div>
        <div class="col-8">
            <img src="https://ss-images.saostar.vn/wp700/pc/1613810558698/Facebook-Avatar_2.png"/>
        </div>
        </div>
        </div>
    </body>
</html>
