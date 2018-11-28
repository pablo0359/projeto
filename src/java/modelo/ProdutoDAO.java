/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class ProdutoDAO extends DataSource{
    public void inserir(Produto p) throws Exception{
        this.conectar();
        String sql = "INSERT INTO produto (nome,descricao,quantidade,valor) VALUES(?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.setDouble(3, p.getQuantidade());
        pstm.setDouble(4, p.getValor());
        pstm.execute();
        this.desconectar();
    }
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM produto WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Produto> listar() throws Exception{
        this.conectar();
        ArrayList<Produto> lista = new ArrayList<Produto>();
        String sql = "SELECT * FROM produto";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Produto p = new Produto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setQuantidade(rs.getDouble("quantidade"));
            p.setValor(rs.getDouble("valor"));
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }
    public Produto carregarPorId(int id) throws Exception{
        this.conectar();
        Produto p = new Produto();
        String sql = "SELECT * FROM produto WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setQuantidade(rs.getDouble("quantidade"));
            p.setValor(rs.getDouble("valor"));
        }
        this.desconectar();
        return p;
    }
    public void alterar(Produto p) throws Exception{
        this.conectar();
        String sql = "UPDATE produto SET nome=?,descricao=?,quantidade=?,valor=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.setDouble(3, p.getQuantidade());
        pstm.setDouble(4, p.getValor());
        pstm.setInt(5, p.getId());
        pstm.execute();
        this.desconectar();
    }

}
