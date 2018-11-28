<%-- 
    Document   : listar_venda
    Created on : 22/08/2018, 14:24:20
    Author     : Administrador
--%>

<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function cancelar(id){
                if(confirm("Tem certeza que deseja cancelar o venda: "+id+"?")){
                    window.open("cancelar_venda.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Vendas</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Lista de Vendas (<a href="listar_cliente.jsp"><img src="imagens/novo.png"/></a>)</h1>
        <table border="1">
            <tr>
                <td>ID VENDA</td>
                <td>CLIENTE</td>
                <td>DATA</td>
                <td>OPÇÕES</td>
            </tr>
            <%
            ArrayList<Venda> lista = new ArrayList<Venda>();
            VendaDAO vDAO = new VendaDAO();
            try{
               lista = vDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Venda v:lista){
            %>
            <tr>
                <td><%=v.getId() %></td>
                <td><%=v.getCliente().getNome() %></td>
                <td><%=v.getData_venda() %></td>
                <td>
                    <%
                    if(v.getData_pagamento()==null){
                        %>
                        <a href="registrar_pagamento_venda.do?id=<%=v.getId() %>"><img src="imagens/pag.png"/></a>
                        <%
                    }else{
                        %>
                        <img src="imagens/pag_x.png"/>
                        <%
                    }
                    %>
                    <%
                    if(v.getData_entrega()==null && v.getData_pagamento()!=null){
                        %>
                        <a href="registrar_entrega_venda.do?id=<%=v.getId() %>"><img src="imagens/entrega.png"/></a>
                        <%
                    }else{
                        %>
                        <img src="imagens/entrega_x.png"/>
                        <%
                    }
                    %>
                    <a target="_blank" href="recibo_venda.jsp?id=<%=v.getId() %>"><img src="imagens/impressora.png"/></a>
                </td>
            </tr>            
            <%
            }
            %>
        </table>
    </body>
</html>
