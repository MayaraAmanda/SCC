/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import controller.Action;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;
import sessao.Sessao;

/**
 *
 * @author Mayara
 */
public class VoltarInicioAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Usuario usuario = Sessao.getSessao().getUsuario();
        request.setAttribute("usuario", usuario);
        RequestDispatcher view = request.getRequestDispatcher("/home.jsp");
        view.forward(request, response);
    }
}
