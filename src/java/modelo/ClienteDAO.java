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
public class ClienteDAO extends DataSource{
    public void inserir(Cliente c) throws Exception{
        this.conectar();
        String sql = "INSERT INTO cliente (nome,telefone,senha) VALUES(?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getTelefone());
        pstm.setString(3, c.getSenha());
        pstm.execute();
        this.desconectar();
    }
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM cliente WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Cliente> listar() throws Exception{
        this.conectar();
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTelefone(rs.getString("telefone"));
            c.setSenha(rs.getString("senha"));
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }
    public Cliente carregarPorId(int id) throws Exception{
        this.conectar();
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTelefone(rs.getString("telefone"));
            c.setSenha(rs.getString("senha"));
        }
        this.desconectar();
        return c;
    }
    public void alterar(Cliente c) throws Exception{
        this.conectar();
        String sql = "UPDATE cliente SET nome=?,telefone=?,senha=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getTelefone());
        pstm.setString(3, c.getSenha());
        pstm.setInt(4, c.getId());
        pstm.execute();
        this.desconectar();
    }
}
