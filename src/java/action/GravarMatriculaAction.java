/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import controller.Action;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Curso;
import model.Matricula;
import model.Usuario;
import persistence.MatriculaDAO;
import sessao.Sessao;

/**
 *
 * @author Mayara
 */
public class GravarMatriculaAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        if (Sessao.getSessao().getUsuario() == null) {
            RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
            view.forward(request, response);
        }

        int codigoCurso = Integer.parseInt(request.getParameter("codigo"));
        try {
            Curso curso = null;
            curso = Curso.obterCurso(codigoCurso);
            Usuario usuario = Usuario.obterUsuario(Sessao.getSessao().getUsuario().getMatricula());
            Matricula matricula = new Matricula(usuario, curso);
            if (MatriculaDAO.getInstance().save(matricula, curso, usuario) == true) {
                Curso.update(matricula.getCurso(), matricula.getCurso().getVagas() - 1);
                RequestDispatcher view = request.getRequestDispatcher("FrontController?action=LerCurso");
                request.setAttribute("msg", "Matricula efetuada com sucesso");
                view.forward(request, response);
            } else {
                RequestDispatcher view = request.getRequestDispatcher("FrontController?action=LerCurso");
                request.setAttribute("msg", "Matricula já foi efetuada");
                view.forward(request, response);
            }

        } catch (SQLException ex) {

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
}
