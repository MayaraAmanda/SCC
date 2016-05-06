<%-- 
    Document   : cadastrarUsuario
    Created on : 05/05/2016, 13:48:37
    Author     : Mayara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Sistema de Cadastro de Curso</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <hgroup>
            <h1>II Apresentação de Minicursos dos Alunos do BSI</h1>
        </hgroup>
        <form action="FrontController?action=GravarUsuario"
              method="post" name="cadastrarUsuario" role="form">
            <center><h3>Cadastro de usuário</h3></center>
            <center>${aux}</center><br>
            <div class="group">
                <input type="text" name="matricula" required><span class="highlight"></span><span class="bar"></span>
                <label>Matrícula</label>
            </div>
            <div class="group">
                <input type="text" name="nome"required><span class="highlight"></span><span class="bar"></span>
                <label>Nome</label>
            </div>
            <div class="group">
                <input type="text" name="email" required><span class="highlight"></span><span class="bar"></span>
                <label>Login</label>
            </div>
            <div class="group">
                <input type="password" name="senha" required><span class="highlight"></span><span class="bar"></span>
                <label>Senha</label>
            </div> 
            <a href="index.jsp">
                <input type="button" class="button buttonBlue" value="Voltar" />
            </a>
            <input type="submit" class="button buttonBlue" value="Cadastrar"/>
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
