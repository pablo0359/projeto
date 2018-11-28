<%-- 
    Document   : form_fecha_carrinho
    Created on : 07/11/2018, 13:27:28
    Author     : Administrador
--%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.Venda"%>
<%
Venda v = new Venda();
try{
   v = (Venda) session.getAttribute("venda");
}catch(Exception e ){
    out.print("Erro:"+e);
}

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fecha Carrinho</title>
    </head>
    <body>
        <h1>Venda</h1>
        ID:<%=v.getCliente().getId() %> Cliente:<%=v.getCliente().getNome() %><br/><br/>
        
        <h2>Itens no carrinho</h2>
        <table border="1">
            <tr>
                <td>ORD</td>
                <td>Produto</td>
                <td>QTD</td>
                <td>Preço</td>
                <td>Sub Total</td>
                <td>Remover</td>
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
                <td align="center"><a href="gerenciar_carrinho.do?op=del&ord=<%=i %>">X</a></td>
            </tr>
            <%
                i++;
            }
            %>
        </table>
        <br/>
        VALOR TOTAL ==========> R$ <%=total %> 
        <br/><br/>
        <a href="listar_cliente.jsp"><input type="submit" value="Cancelar"/></a>
        <a href="form_catalogo_venda.jsp?nova=nao"><input type="submit" value="Comprar +"/></a>  
        <a href="finalizar_venda.do"><input type="submit" value="Concluir"/></a>
    </body>
</html>
