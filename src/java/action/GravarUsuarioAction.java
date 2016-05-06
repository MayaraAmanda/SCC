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
import model.Tipousuario;
import model.Usuario;
import persistence.UsuarioDAO;
import sessao.Sessao;

/**
 *
 * @author Mayara
 */
public class GravarUsuarioAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (Sessao.getSessao().getUsuario() == null) {
            RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
            view.forward(request, response);
        }

        try {

            int matricula = Integer.parseInt(request.getParameter("matricula"));
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = pegaSenha(request.getParameter("senha"));
            int tipo = 2;

            if (matricula == 0 || senha.equals("")) {
                RequestDispatcher view = request.getRequestDispatcher("/cadastrarUsuario.jsp");
                request.setAttribute("msg", "Um ou mais campos vazios");
                view.forward(request, response);
            } else {
                try {
                    Tipousuario tipousuario = null;
                    tipousuario = Tipousuario.obterTipo(tipo);
                    Usuario usuario = new Usuario(matricula, nome, email, senha, tipousuario);
                    UsuarioDAO.getInstance().save(usuario);
                    RequestDispatcher view = request.getRequestDispatcher("/cadastrarUsuario.jsp");
                    request.setAttribute("msg", "Usuário cadastrado com sucesso");
                    view.forward(request, response);
                } catch (IOException e) {
                    throw e;
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(GravarUsuarioAction.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(GravarUsuarioAction.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(GravarUsuarioAction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(GravarUsuarioAction.class.getName()).log(Level.SEVERE, null, ex);
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
