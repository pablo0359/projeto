<%-- 
    Document   : login
    Created on : 03/10/2018, 16:10:37
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JLogin</title>
    </head>
    <body>
        <h2>Acesso Restrito</h2>
        <form action="valida_login.do" method="post">
            Login:<input type="text" size="20" name="login" required/><br/>
            Senha:<input type="password" size="20" name="senha" required/><br/>
            <input type="submit" value="Entrar"/>
        </form>
    </body>
</html>
