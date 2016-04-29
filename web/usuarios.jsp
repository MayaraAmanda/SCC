<%-- 
    Document   : usuario
    Created on : 29/04/2016, 13:49:50
    Author     : Mayara
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de usuários</title>
    </head>
    <body>

        <h1>Cadastro de Usuários</h1>
        <form action="FrontController?action=GravarUsuario"
              method="post" name="cadastrarUsuarios" role="form">
            Codigo
            <input type="text" name="matricula" required/><br/>
            Nome:
            <input type="text" name="nome" required/><br/>
            Login:
            <input type="text" name="email" required/><br/>
            Senha
            <input type="password" name="senha"/><br/>

            <input type="submit"/>
        </form>
        <p>${aux}</p>
    </body>
</html>
