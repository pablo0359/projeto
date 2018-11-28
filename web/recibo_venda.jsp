<%-- 
    Document   : form_fecha_carrinho
    Created on : 07/11/2018, 13:27:28
    Author     : Administrador
--%>
<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.Venda"%>
<%
Venda v = new Venda();
try{
    int id = Integer.parseInt(request.getParameter("id"));
    VendaDAO vDAO = new VendaDAO();
    v = vDAO.carregarPorId(id);
}catch(Exception e ){
    out.print("Erro:"+e);
}

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recibo</title>
    </head>
    <body>
        <h1>Recibo de Venda</h1>
        ID:<%=v.getCliente().getId() %> Cliente:<%=v.getCliente().getNome() %><br/><br/>
        
        <h2>Itens comprados</h2>
        <table border="1">
            <tr>
                <td>ORD</td>
                <td>Produto</td>
                <td>QTD</td>
                <td>Preço</td>
                <td>Sub Total</td>
            </tr>
            <%
            int i=0;
            double total=0;
            for(ItemVenda item:v.getCarrinho()){
                total=total+(item.getQuantidade()*item.getValor());
            %>
            <tr>
                <td><%=i+1 %></td>
                <td><%=item.getProduto().getNome() %></td>
                <td><%=item.getQuantidade() %></td>
                <td>R$ <%=item.getValor() %></td>
                <td>R$ <%=(item.getQuantidade()*item.getValor()) %></td>
            </tr>
            <%
                i++;
            }
            %>
        </table>
        <br/>
        VALOR TOTAL ==========> R$ <%=total %> 
        <br/><br/>
    </body>
</html>
