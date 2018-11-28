<%-- 
    Document   : form_inserir_perfil
    Created on : 07/08/2018, 16:25:29
    Author     : Administrador
--%>

<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Perfil> perfis = new ArrayList<Perfil>();
    Usuario u = new Usuario();
    try{
       int id = Integer.parseInt(request.getParameter("id"));
       UsuarioDAO uDAO = new UsuarioDAO();
       u = uDAO.carregarPorId(id);
       
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
        <title>Alterar Usuário</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Editando Usuário</h1>
        <form action="alterar_usuario.do" method="post">
            ID:<%=u.getId() %><br/>
            <input type="hidden" name="id" value="<%=u.getId() %>"/>
            Nome:<input type="text" name="nome" value="<%=u.getNome() %>" size="60" required/><br/>
            Login:<input type="text" name="login"  value="<%=u.getLogin() %>" size="60" required/><br/>
            Senha:<input type="password" name="senha"  value="<%=u.getSenha() %>" size="60" required/><br/>
            Perfil:
            <select name="id_perfil" size="1" required>
                <option value="">Selecione...</option>
                <%
                    String selecao = "";
                    for(Perfil p:perfis){
                        if(u.getPerfil().getId()==p.getId()){
                            selecao = "selected";
                        }else{
                            selecao = "";
                        }
                    %>
                    <option value="<%=p.getId() %>" <%=selecao %>><%=p.getNome() %></option>
                    <%
                    }
                    %>
            </select>
            
            <br/>
            <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
