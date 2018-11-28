<%-- 
    Document   : form_inserir_cliente
    Created on : 07/08/2018, 16:25:29
    Author     : Administrador
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  
Cliente c = new Cliente();

try{
    int id = Integer.parseInt(request.getParameter("id"));
    ClienteDAO cDAO = new ClienteDAO();
    c = cDAO.carregarPorId(id);
}catch(Exception e){
    out.print("Erro:"+e);
}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Cliente</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Alterando Cliente</h1>
        <form action="alterar_cliente.do" method="post">
            ID:<%=c.getId() %><br/>
            <input type="hidden" value="<%=c.getId() %>" name="id"/>
            Nome:<input type="text" value="<%=c.getNome() %>" name="nome" size="60" required/><br/>
            Telefone:<input type="text" value="<%=c.getTelefone() %>" name="telefone" size="30" required/><br/>
            Senha:<input type="password" value="<%=c.getSenha() %>" name="senha" size="30" required/><br/>
            <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
