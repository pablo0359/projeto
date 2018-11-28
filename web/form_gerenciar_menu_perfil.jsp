<%-- 
    Document   : form_inserir_perfil
    Created on : 07/08/2018, 16:25:29
    Author     : Administrador
--%>

<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  
Perfil p = new Perfil();
ArrayList<Menu> menusNaoPerfil = new ArrayList<Menu>();
try{
    int id = Integer.parseInt(request.getParameter("id"));
    PerfilDAO pDAO = new PerfilDAO();
    p = pDAO.carregarPorId(id);
    menusNaoPerfil = pDAO.menusNaoPerfil(id);
}catch(Exception e){
    out.print("Erro:"+e);
}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function desvincular(id_perfil,id_menu,titulo){
                if(confirm("Tem certeza que deseja desvincular o menu: "+titulo+"?")){
                    window.open("gerenciar_menu_perfil.do?id_perfil="+id_perfil+"&id_menu="+id_menu+"&op=desvincular","_parent");
                }
            }
        </script>
        <title>Alterar Perfil</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Gerenciando Menus de Perfil</h1>
        <form action="gerenciar_menu_perfil.do" method="post">
            ID:<%=p.getId() %> Nome:<%=p.getNome()%>
            <input type="hidden" value="<%=p.getId() %>" name="id_perfil"/>
            <input type="hidden" value="vincular" name="op"/><br/>
            Menu:<select name="id_menu" size="1" required>
                <option value="">Selecione...</option>
                <%
                for(Menu m:menusNaoPerfil){
                %>
                <option value="<%=m.getId() %>"><%=m.getTitulo() %></option>
                <%
                }
                %>
            </select>
            <input type="submit" value="+"/>
        </form>
            <div algn="center">
                <h2>Menus vinculados</h2>
                <table border="1">
                    <tr>
                        <td>ID</td>
                        <td>TÍTULO</td>
                        <td>DESVINCULAR</td>
                    </tr>
                    <%
                    for(Menu m:p.getMeusMenus()){
                    %>
                    <tr>
                        <td><%=m.getId() %></td>
                        <td><%=m.getTitulo() %></td>
                        <td align="center"><a href="#" onclick="desvincular(<%=p.getId() %>,'<%=m.getId() %>','<%=m.getTitulo() %>')"><img src="imagens/excluir.png"/></a> </td>
                    </tr>
                    <%
                    }
                    %>
                </table>
            </div>    
            
    </body>
</html>
