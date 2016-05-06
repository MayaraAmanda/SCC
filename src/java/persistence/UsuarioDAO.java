/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Tipousuario;
import model.Usuario;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Mayara
 */
public class UsuarioDAO {

    private static UsuarioDAO instance = new UsuarioDAO();

    public UsuarioDAO() {
    }

    public static UsuarioDAO getInstance() {

        return instance;
    }

    public static Usuario obterUsuario(String email, String senha) throws ClassNotFoundException, SQLException {
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            Connection conexao = DatabaseLocator.getInstance().getConnection();
            Usuario usuario = null;
            String sqlString = "select * from usuario where email = ? and senha = ?";
            PreparedStatement busca = conexao.prepareStatement(sqlString);
            busca.setString(1, email);
            busca.setString(2, senha);
            busca.execute();
            ResultSet rs = busca.executeQuery();
            rs.first();

            usuario = new Usuario(rs.getInt("matricula"), rs.getString("nome"), rs.getString("email"), rs.getString("senha"), null);
            usuario.setTipousuario(Tipousuario.obterTipo(rs.getInt("tipousuario_id")));
            return usuario;
        } catch (Exception e) {
            throw new SQLException("Login incorreto!");
        }
    }

    public Usuario obterUsuario(int matricula) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.clear();
        Usuario usuario = (Usuario) session.get(Usuario.class, matricula);
        //Usuario usuario = (Usuario) session.createQuery("from usuario where matricula =" + matricula).list().get(0);
        session.close();
        return usuario;
    }

    public static List<Usuario> obterUsuarios() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.clear();
        List<Usuario> usuarios = session.createCriteria(Usuario.class).list();
        return usuarios;
    }

    public static void save(Usuario usuario) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.save(usuario);
        transaction.commit();
    }

}
