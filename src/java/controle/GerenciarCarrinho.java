/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.ItemVenda;
import modelo.Produto;
import modelo.ProdutoDAO;
import modelo.Venda;

/**
 *
 * @author Administrador
 */
public class GerenciarCarrinho extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCarrinho</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();
            try {
                
                
                
                String op  =request.getParameter("op");
                Venda v = (Venda) session.getAttribute("venda");
                ArrayList<ItemVenda> carrinho =  v.getCarrinho();
                
                if(op.equals("add")){
                    int id_produto = Integer.parseInt(request.getParameter("id_produto"));
                    double quantidade =  Double.parseDouble(request.getParameter("quantidade")); 
                    double valor =  Double.parseDouble(request.getParameter("valor"));
                    
                    ProdutoDAO pDAO = new ProdutoDAO();
                    ItemVenda item = new ItemVenda();
                    item.setProduto(pDAO.carregarPorId(id_produto));
                    item.setQuantidade(quantidade);
                    item.setValor(valor);
                    
                    carrinho.add(item);
                    v.setCarrinho(carrinho);
                    session.setAttribute("venda", v);
                    response.sendRedirect("form_catalogo_venda.jsp?nova=nao");
                }else if(op.equals("del")){
                    int ord = Integer.parseInt(request.getParameter("ord"));
                    carrinho.remove(ord);
                    v.setCarrinho(carrinho);
                    session.setAttribute("venda", v);
                    response.sendRedirect("form_fecha_carrinho.jsp");
                }
                
            } catch (Exception e) {
                out.print("Erro:"+e);
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
