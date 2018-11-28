<%-- 
    Document   : form_catalogo_venda
    Created on : 05/11/2018, 15:33:25
    Author     : Administrador
--%>


<%@page import="modelo.Usuario"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<Produto> catalogo = new ArrayList<Produto>();
Venda venda = new Venda();

try{
   String nova = request.getParameter("nova");
   if(nova.equals("sim")){
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente c = new Cliente();
        ClienteDAO cDAO = new ClienteDAO();
        c = cDAO.carregarPorId(id);
        venda.setCliente(c);
        venda.setCarrinho(new ArrayList<ItemVenda>());
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        venda.setUsuario(usuario);
        session.setAttribute("venda", venda);
   }else{
        venda = (Venda) session.getAttribute("venda");
   }
   ProdutoDAO pDAO = new ProdutoDAO();
   catalogo = pDAO.listar();
    
}catch(Exception e){
    out.print("Erro:"+e);
}


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra</title>
    </head>
    <body>
        <h1>Compra --- Carrinho(<%=venda.getCarrinho().size() %>)</h1>
        Cliente:<%=venda.getCliente().getNome() %><br/>
        <h2>Catálogo</h2>
        <table>
            <%
             for(Produto prod:catalogo){
             %>    
             <tr>
                 <td>
                     <form method="post" action="gerenciar_carrinho.do">
                         <input type="hidden" name="valor" value="<%=prod.getValor() %>"/>
                         <input type="hidden" name="id_produto" value="<%=prod.getId() %>"/>
                         <input type="hidden" name="op" value="add"/>
                        <img src="imagens_prod/<%=prod.getId() %>.png"/><br/>
                        <%=prod.getNome() %><br/>
                        R$ <%=prod.getValor() %><br/>
                        Qdt.:<input type="text" name="quantidade" value="1" size="3"/><input type="submit" value="+"/>
                     </form>
                 </td>
             </tr>
            <% 
                }
            %>
        </table>
        <br/>
        <a href="listar_cliente.jsp"><input type="submit" value="Cancelar"/></a>
             
        <a href="form_fecha_carrinho.jsp"><input type="submit" value="Ver Carrinho"/></a>
       
    </body>
</html>
