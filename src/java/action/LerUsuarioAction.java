/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import controller.Action;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class LerUsuarioAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, UnsupportedEncodingException {        
        try {

            String senha = pegaSenha(request.getParameter("senha"));
            String email = request.getParameter("email");
            Usuario usuario = Usuario.obterUsuario(email, senha);
            request.setAttribute("usuario", usuario);
            Sessao.getSessao().setUsuario(usuario);
            RequestDispatcher view = request.getRequestDispatcher("/home.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        } catch (SQLException e) {
            RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", e.getMessage());
            view.forward(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LerUsuarioAction.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String pegaSenha(String senha) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest algorithm = MessageDigest.getInstance("MD5");
        byte messageDigest[] = algorithm.digest(senha.getBytes("UTF-8"));
        StringBuilder hexString = new StringBuilder();
        for (byte b : messageDigest) {
            hexString.append(String.format("%02X", 0xFF & b));
        }
        senha = hexString.toString();

        return senha;
    }
}
