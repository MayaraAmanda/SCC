/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessao;

import model.Usuario;

/**
 *
 * @author Angelo
 */
public class Sessao {

    public static void setSessao(Sessao aSessao) {
        sessao = aSessao;
    }
    private Usuario usuario;
    private static Sessao sessao = new Sessao();

    private Sessao() {
    }

    ;
    public static Sessao getSessao() {
        return sessao;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

}
