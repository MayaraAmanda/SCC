<%--
    Document   : index
    Created on : 05/05/2016, 13:29:29
    Author     : Mayara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Cadastro de Curso</title>
        <link rel="stylesheet" href="css/estilo.css">
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body>

        <hgroup>
            <h1>II Apresentação de Minicursos dos Alunos do BSI</h1>
        </hgroup>
        <form action="FrontController?action=LerUsuario" method="post" name="usuario">
            <center><h3>Login</h3></center>
            <center>${msg}</center>
            <div class="group">
                <input type="text" name="login"><span class="highlight"></span><span class="bar"></span>
                <label>Login</label>
            </div>
            <div class="group">
                <input type="password" name="senha"><span class="highlight"></span><span class="bar"></span>
                <label>Senha</label>

            </div>&nbsp;
            <a href="cadastrarUsuario.jsp">
                <input type="button" class="button buttonBlue" value="Cadastre-se" />
            </a>
            <input type="submit" class="button buttonBlue" value="Login"/>


        </form>
        <footer>

            <p>Realização:
                <a href="https://www.facebook.com/CASIBSI/" target="_blank"><br>
                    <img src="img/casi.png"></a><br>
        </footer>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>

    </body>
</html>
