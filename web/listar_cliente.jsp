<%-- 
    Document   : listar_cliente
    Created on : 22/08/2018, 14:24:20
    Author     : Administrador
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que deseja excluir o cliente: "+nome+"?")){
                    window.open("excluir_cliente.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Clientes</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Lista de Clientes (<a href="form_inserir_cliente.jsp"><img src="imagens/novo.png"/></a>)</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>NOME</td>
                <td>TELEFONE</td>
                <td>OPÇÕES</td>
            </tr>
            <%
            ArrayList<Cliente> lista = new ArrayList<Cliente>();
            ClienteDAO cDAO = new ClienteDAO();
            try{
               lista = cDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Cliente c:lista){
            %>
            <tr>
                <td><%=c.getId() %></td>
                <td><%=c.getNome() %></td>
                <td><%=c.getTelefone() %></td>
                <td><a href="form_alterar_cliente.jsp?id=<%=c.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=c.getId() %>,'<%=c.getNome() %>')"><img src="imagens/excluir.png"/></a> <a href="form_catalogo_venda.jsp?id=<%=c.getId() %>&nova=sim"><img src="imagens/carrinho.png"/></a></td>
            </tr>            
            <%
            }
            %>
        </table>
    </body>
</html>
