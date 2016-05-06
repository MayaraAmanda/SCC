<%-- 
    Document   : login
    Created on : 02/05/2016, 15:26:48
    Author     : Mayara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        ${msg}
        <form action="FrontController?action=LerUsuario" method="post" name="usuario">
            <label for="email">
                Email: 
            </label> 
            <input type="text" name="email">

            <label for="senha">
                Senha:
            </label> 
            <input type="password" name="senha">
                
            <input type="submit" name="btnConfirmar" value="Confirmar"> 

        </form><br><br>
        <a href="cadastrarUsuario.jsp">Cadastre-se</a>
    </body>
</html>
