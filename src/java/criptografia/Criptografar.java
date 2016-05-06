/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package criptografia;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


/**
 *
 * @author Angelo
 */
public class Criptografar {
    public String obterCriptografia (String senha) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        
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
