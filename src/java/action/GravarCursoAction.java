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
import persistence.CursoDAO;

/**
 *
 * @author Mayara
 */
public class GravarCursoAction implements Action {
    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String cargaHoraria = request.getParameter("cargaHoraria");
        String palestrante = request.getParameter("palestrante");
        String data = request.getParameter("data");
        String hora = request.getParameter("hora");
        String laboratorio = request.getParameter("laboratorio");
        int vagas = Integer.parseInt(request.getParameter("vagas"));
        
            Curso curso = new Curso(codigo, nome, descricao, cargaHoraria, palestrante, data, hora, laboratorio, vagas);
            try {
                CursoDAO.getInstance().save(curso);
                RequestDispatcher view = request.getRequestDispatcher("/cursos.jsp");
                request.setAttribute("aux", "Gravado com sucesso");
                view.forward(request, response);
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
                
            } catch (SQLException ex) {
                response.sendRedirect("erro.jsp");
                
                ex.printStackTrace();
            }
        }
    
    
}
