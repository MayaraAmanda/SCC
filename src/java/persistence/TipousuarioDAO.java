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
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.connection.ConnectionProvider;
import org.hibernate.engine.SessionFactoryImplementor;
import util.HibernateUtil;

/**
 *
 * @author Mayara
 */
public class TipousuarioDAO {

    public static List<Tipousuario> obterTipos() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.clear();
        List<Tipousuario> tipos = session.createCriteria(Tipousuario.class).list();
        return tipos;
    }

    public static Tipousuario obterTipo(int id) throws ClassNotFoundException, SQLException {

        SessionFactory sessionFactory;
        sessionFactory = new Configuration().configure().buildSessionFactory();
        SessionFactoryImplementor impl = (SessionFactoryImplementor) sessionFactory;
        ConnectionProvider cp = impl.getConnectionProvider();
        Connection conexao = cp.getConnection();
        Tipousuario tipo = null;
        String sqlString = "select * from tipousuario where id = ?";
        PreparedStatement busca = conexao.prepareStatement(sqlString);
        busca.setInt(1, id);
        busca.execute();
        ResultSet rs = busca.executeQuery();
        rs.first();
        tipo = instanciarTipo(rs);

        return tipo;

    }

    public static Tipousuario instanciarTipo(ResultSet rs)
            throws SQLException {
        Tipousuario tipo = new Tipousuario(rs.getInt("id"), rs.getString("tipo"));
        return tipo;
    }

}
