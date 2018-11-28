<%-- 
    Document   : form_inserir_perfil
    Created on : 07/08/2018, 16:25:29
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Perfil> perfis = new ArrayList<Perfil>();
    try{
       PerfilDAO pDAO = new PerfilDAO();
       perfis = pDAO.listar();
    }catch(Exception e){
        out.print("Erro:"+e);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Usuário</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Novo Usuário</h1>
        <form action="inserir_usuario.do" method="post">
            Nome:<input type="text" name="nome" size="60" required/><br/>
            Login:<input type="text" name="login" size="60" required/><br/>
            Senha:<input type="password" name="senha" size="60" required/><br/>
            Perfil:
            <select name="id_perfil" size="1" required>
                <option value="">Selecione...</option>
                <%
                    for(Perfil p:perfis){
                    %>
                    <option value="<%=p.getId() %>"><%=p.getNome() %></option>
                    <%
                    }
                    %>
            </select>
            
            <br/>
            <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
