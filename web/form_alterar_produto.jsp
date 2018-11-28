<%-- 
    Document   : form_inserir_produto
    Created on : 07/08/2018, 16:25:29
    Author     : Administrador
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  
Produto p = new Produto();

try{
    int id = Integer.parseInt(request.getParameter("id"));
    ProdutoDAO pDAO = new ProdutoDAO();
    p = pDAO.carregarPorId(id);
}catch(Exception e){
    out.print("Erro:"+e);
}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <h1>Alterando Produto</h1>
        <form action="alterar_produto.do" method="post">
            ID:<%=p.getId() %><br/>
            <input type="hidden" value="<%=p.getId() %>" name="id"/>
            Nome:<input type="text" value="<%=p.getNome() %>" name="nome" size="60" required/><br/>
            Descrição:<input type="text" value="<%=p.getDescricao() %>" name="descricao" size="60" required/><br/>
            Quantidade:<input type="text" value="<%=p.getQuantidade() %>" name="quantidade" size="60" required/><br/>
            Valor:<input type="text" value="<%=p.getValor() %>" name="valor" size="60" required/><br/>
            <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
