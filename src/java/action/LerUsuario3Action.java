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
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
import sessao.Sessao;

/**
 *
 * @author Mayara
 */
public class LerUsuario3Action implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, UnsupportedEncodingException{
    }
        protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws IOException, SQLException, UnsupportedEncodingException, NoSuchAlgorithmException, ClassNotFoundException {

        // get request parameters for userID and password
        String email = request.getParameter("login");
        String senha;

        senha = pegaSenha(request.getParameter("senha"));
        Usuario usuario;
        usuario = Usuario.obterUsuario(email, senha);

        request.setAttribute("usuario", usuario);
        Sessao.getSessao().setUsuario(usuario);

        HttpSession session = request.getSession();
        //setting session to expiry in 30 mins
        session.setMaxInactiveInterval(30 * 60);
        Cookie nome = new Cookie("login", email);
        response.addCookie(nome);
        //Get the encoded URL string
        String encodedURL = response.encodeRedirectURL("/home.jsp");
        response.sendRedirect(encodedURL);
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
