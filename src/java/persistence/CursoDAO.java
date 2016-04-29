/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Curso;
import org.hibernate.JDBCException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Mayara
 */
public class CursoDAO {

    private static CursoDAO instance = new CursoDAO();

    public static CursoDAO getInstance() {

        return instance;
    }

    public void save(Curso curso) throws SQLException, ClassNotFoundException {

        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.save(curso);
        transaction.commit();
    }

    public void delete(Curso curso) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        session.delete(curso);
        transaction.commit();
    }

    public static List<Curso> obterCursos() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.clear();
        List<Curso> cursos = session.createCriteria(Curso.class).list();
        return cursos;
    }

    public static Curso instanciar(ResultSet rs)
            throws SQLException {
        Curso curso = new Curso(rs.getInt("codigo"), rs.getString("nome"), rs.getString("descricao"), rs.getString("cargaHoraria"), rs.getString("palestrante"), rs.getString("data"), rs.getString("hora"), rs.getString("laboratorio"), rs.getInt("vagas"));
        return curso;
    }

}
