<%-- 
    Document   : form_inserir_cliente
    Created on : 07/08/2018, 16:25:29
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Cliente</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Novo Cliente</h1>
        <form action="inserir_cliente.do" method="post">
            Nome:<input type="text" name="nome" size="60" required/><br/>
            telefone:<input type="text" name="telefone" size="30" required/><br/>
            senha:<input type="password" name="senha" size="30" required/><br/>
            <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
