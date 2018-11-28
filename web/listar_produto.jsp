<%-- 
    Document   : listar_produto
    Created on : 22/08/2018, 14:24:20
    Author     : Administrador
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que deseja excluir o produto: "+nome+"?")){
                    window.open("excluir_produto.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Produtos</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Lista de Produtos (<a href="form_inserir_produto.jsp"><img src="imagens/novo.png"/></a>)</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>NOME</td>
                <td>VALOR</td>
                <td>OPÇÕES</td>
            </tr>
            <%
            ArrayList<Produto> lista = new ArrayList<Produto>();
            ProdutoDAO pDAO = new ProdutoDAO();
            try{
               lista = pDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Produto p:lista){
            %>
            <tr>
                <td><%=p.getId() %></td>
                <td><%=p.getNome() %></td>
                <td><%=p.getValor() %></td>
                <td><a href="form_alterar_produto.jsp?id=<%=p.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=p.getId() %>,'<%=p.getNome() %>')"><img src="imagens/excluir.png"/></a> </td>
            </tr>            
            <%
            }
            %>
        </table>
    </body>
</html>
