<%-- 
    Document   : form_inserir_perfil
    Created on : 07/08/2018, 16:25:29
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  
Perfil p = new Perfil();

try{
    int id = Integer.parseInt(request.getParameter("id"));
    PerfilDAO pDAO = new PerfilDAO();
    p = pDAO.carregarPorId(id);
}catch(Exception e){
    out.print("Erro:"+e);
}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Perfil</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Alterando Perfil</h1>
        <form action="alterar_perfil.do" method="post">
            ID:<%=p.getId() %><br/>
            <input type="hidden" value="<%=p.getId() %>" name="id"/>
            Nome:<input type="text" value="<%=p.getNome() %>" name="nome" size="60" required/><br/>
            Descrição:<input type="text" value="<%=p.getDescricao() %>" name="descricao" size="60" required/><br/>
            <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
