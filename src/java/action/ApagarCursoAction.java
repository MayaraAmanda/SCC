/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import controller.Action;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Curso;
import persistence.CursoDAO;
import sessao.Sessao;

/**
 *
 * @author Mayara
 */
public class ApagarCursoAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        if (Sessao.getSessao().getUsuario() == null) {
            RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
            view.forward(request, response);
        }

        int codigo = Integer.parseInt(request.getParameter("codigo"));

        Curso curso = new Curso(codigo);
        try {
            CursoDAO.getInstance().delete(curso);
            RequestDispatcher view = request.getRequestDispatcher("FrontController?action=LerCurso");
            view.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ApagarCursoAction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ApagarCursoAction.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
