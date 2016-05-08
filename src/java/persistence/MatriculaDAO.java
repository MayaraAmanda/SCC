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
import java.util.ArrayList;
import java.util.List;
import model.Curso;
import model.Matricula;
import model.Usuario;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sessao.Sessao;
import util.HibernateUtil;

/**
 *
 * @author Mayara
 */
public class MatriculaDAO {

    private static MatriculaDAO instance = new MatriculaDAO();

    public static MatriculaDAO getInstance() {

        return instance;
    }

    public boolean save(Matricula matricula, Curso curso, Usuario usuario) throws SQLException, ClassNotFoundException {

        if (select(curso, usuario) == false) {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            session.clear();
            session.save(matricula);
            transaction.commit();
            Curso.update(matricula.getCurso(), matricula.getCurso().getVagas() - 1);
            //session.close();
            return true;
        } else {
            return false;
        }
    }

    public boolean delete(Matricula matricula) throws SQLException, ClassNotFoundException {
        try {

            if (select(matricula.getCurso(), matricula.getUsuario())) {
                Session session = HibernateUtil.getSessionFactory().openSession();
                Connection conexao = DatabaseLocator.getInstance().getConnection();
                Transaction transaction = session.beginTransaction();
                Curso.update(matricula.getCurso(), matricula.getCurso().getVagas() + 1);
                String sqlString = "delete from matriculas where curso_codigo = ? and usuario_matricula = ?";
                PreparedStatement busca = conexao.prepareStatement(sqlString);
                busca.setInt(1, matricula.getCurso().getCodigo());
                busca.setInt(2, matricula.getUsuario().getMatricula());
                busca.executeUpdate();
                //session.close();
                transaction.commit();
                session.close();
                return true;
            }

            return false;
        } catch (SQLException ex) {
            return false;
        }
    }

    public static List<Matricula> obterMatriculas() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Connection conexao = DatabaseLocator.getInstance().getConnection();
        String sqlString = "select * from matriculas where usuario_matricula = ?";
        PreparedStatement busca = conexao.prepareStatement(sqlString);
        Usuario usuario = UsuarioDAO.getInstance().obterUsuario(Sessao.getSessao().getUsuario().getMatricula());
        busca.setInt(1, usuario.getMatricula());
        busca.execute();
        ResultSet rs = busca.executeQuery();
        List matriculas = new ArrayList();
        Matricula matricula = null;
        //if(rs.equals(null)) 
        while (rs.next()) {
            matricula = new Matricula(Usuario.obterUsuario(rs.getInt("usuario_matricula")), Curso.obterCurso(rs.getInt("curso_codigo")));
            matriculas.add(matricula);
        }

        busca.close();
        //session.getCacheMode();
        transaction.commit();
        session.close();

        return matriculas;
    }

    public static boolean select(Curso curso, Usuario usuario) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            Connection conexao = DatabaseLocator.getInstance().getConnection();
            String sqlString = "select * from matriculas where curso_codigo = ? and usuario_matricula = ?";
            PreparedStatement busca = conexao.prepareStatement(sqlString);
            busca.setInt(1, curso.getCodigo());
            Usuario usuario2 = UsuarioDAO.getInstance().obterUsuario(Sessao.getSessao().getUsuario().getMatricula());
            busca.setInt(2, usuario2.getMatricula());
            busca.execute();
            ResultSet rs = busca.executeQuery();
            rs.first();
            Matricula matricula = new Matricula(Usuario.obterUsuario(rs.getInt("usuario_matricula")), Curso.obterCurso(rs.getInt("curso_codigo")));
            busca.close();
            //session.getCacheMode();
            transaction.commit();
            session.close();

            return true;
        } catch (SQLException ex) {
            return false;
        } catch (ClassNotFoundException e) {
            return false;
        }
    }

    public List<Matricula> obterUsuariosMatriculados() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Connection conexao = DatabaseLocator.getInstance().getConnection();
        String sqlString = "select * from matriculas order by curso_codigo";
        PreparedStatement busca = conexao.prepareStatement(sqlString);
        busca.execute();
        ResultSet rs = busca.executeQuery();
        List matriculas = new ArrayList();
        Matricula matricula = null;
        //if(rs.equals(null)) 
        while (rs.next()) {
            matricula = new Matricula(Usuario.obterUsuario(rs.getInt("usuario_matricula")), Curso.obterCurso(rs.getInt("curso_codigo")));
            matriculas.add(matricula);
        }

        busca.close();
        //session.getCacheMode();
        transaction.commit();
        session.close();

        return matriculas;

    }

}
