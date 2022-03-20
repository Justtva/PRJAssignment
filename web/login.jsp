<%-- 
    Document   : login
    Created on : Mar 6, 2022, 2:34:46 AM
    Author     : Bi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <h1 class="fw-bold text-center mt-4">Đăng nhập vào cửa hàng</h1>
</head>  

<body>
    
        <div class="container mt-4">
            <form action="logins" method="post">  
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Tên đăng nhập</span>
                    <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập" aria-label="Username" aria-describedby="basic-addon1">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Mật khẩu</span>
                    <input type="password" name="password" class="form-control" placeholder="Mật khẩu" aria-label="Password" aria-describedby="basic-addon1">
                </div>
                <div class="buttonHolder">
                    <button type="submit" class="btn btn-outline-dark">              
                        Đăng nhập
                    </button>
                </div>
            </form>
        </div>
    
</body>
</html>
