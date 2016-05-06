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
public class ApagarMatriculaAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (Sessao.getSessao().getUsuario() == null) {
            RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
            view.forward(request, response);
            
        }
        String pagina = request.getParameter("pagina");
        int codigocurso = Integer.parseInt(request.getParameter("codigocurso"));
        int codigousuario = Sessao.getSessao().getUsuario().getMatricula();

        try {
            Matricula matricula = new Matricula(Usuario.obterUsuario(codigousuario), Curso.obterCurso(codigocurso));
            if (MatriculaDAO.getInstance().delete(matricula)) {
                if (pagina.equals("LerMatricula")) {
                    RequestDispatcher view = request.getRequestDispatcher("FrontController?action=LerMatricula");
                    request.setAttribute("msg", "Matricula excluida");
                    view.forward(request, response);

                } else {
                    RequestDispatcher view = request.getRequestDispatcher("FrontController?action=LerCurso");
                    request.setAttribute("msg", "Excluido com sucesso");
                    view.forward(request, response);
                }
            } else {
                RequestDispatcher view = request.getRequestDispatcher("FrontController?action=LerCurso");
                request.setAttribute("msg", "Registro já excluido");
                view.forward(request, response);

            }
        } catch (SQLException ex) {
            RequestDispatcher view = request.getRequestDispatcher("FrontController?action=LerCurso");
            request.setAttribute("msg", "Erro ao excluir");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {

            RequestDispatcher view = request.getRequestDispatcher("FrontController?action=LerCurso");
            request.setAttribute("msg", "Erro.");
            view.forward(request, response);
        } catch(NullPointerException e){
            RequestDispatcher view = request.getRequestDispatcher("FrontController?action=LerCurso");
            request.setAttribute("msg", "Curso já excluido.");
            view.forward(request, response);
        }

    }
}
