<%-- 
    Document   : menu
    Created on : 03/10/2018, 16:41:16
    Author     : Administrador
--%>

<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>
<img src="imagens/banner.jpg" /><br/>
<%
  try{
  
      Usuario uLogado = (Usuario) session.getAttribute("usuario");
      
      for(Menu mu:uLogado.getPerfil().getMeusMenus()){
          out.print("<a href='"+mu.getLink()+"'>"+mu.getTitulo()+"</a> |");
      }
      out.print("  Bem-vindo "+uLogado.getNome()+"(<a href='sair.jsp'>Sair</a>)");
  }catch(Exception e){
      response.sendRedirect("login.jsp");
  }  

%>