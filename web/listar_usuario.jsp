<%-- 
    Document   : listar_usuario
    Created on : 22/08/2018, 14:24:20
    Author     : Administrador
--%>

<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que deseja excluir o usuario: "+nome+"?")){
                    window.open("excluir_usuario.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Usuários</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Lista de Usuários (<a href="form_inserir_usuario.jsp"><img src="imagens/novo.png"/></a>)</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>NOME</td>
                <td>PERFIL</td>
                <td>OPÇÕES</td>
            </tr>
            <%
            ArrayList<Usuario> lista = new ArrayList<Usuario>();
            UsuarioDAO uDAO = new UsuarioDAO();
            try{
               lista = uDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Usuario u:lista){
            %>
            <tr>
                <td><%=u.getId() %></td>
                <td><%=u.getNome() %></td>
                <td><%=u.getPerfil().getNome() %></td>
                <td><a href="form_alterar_usuario.jsp?id=<%=u.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=u.getId() %>,'<%=u.getNome() %>')"><img src="imagens/excluir.png"/></a> </td>
            </tr>            
            <%
            }
            %>
        </table>
    </body>
</html>
