<%--
    Document   : home
    Created on : 25/04/2016, 12:39:48
    Author     : Mayara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Cadastro de Curso</title>
        <link rel="stylesheet" href="css/estilo.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">

    </head>
    <body>
        <hgroup>
            <h1>II Apresentação de Minicursos dos Alunos do BSI</h1>
        </hgroup>
        <form>
            <center><h3>Bem vindo, ${usuario.nome}</h3></center>
            <div class="conteudo">
                <div class="opcoes">
                    <div <c:if test="${usuario.tipousuario.id != 1}"> hidden </c:if>>
                        <i class="fa fa-graduation-cap" aria-hidden="true" ></i>&nbsp; <a href="cadastrarCurso.jsp"> Cadastrar Curso</a></div>
                    <br>
                    <i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp; <a href="FrontController?action=LerCurso">Cursos disponíveis</a>
                    <br><br>
                    <div  <c:if test="${usuario.tipousuario.id != 1}"> hidden </c:if>> 
                        <i class="fa fa-user" aria-hidden="true"></i>&nbsp; <a href="FrontController?action=ListarUsuarios">Usuários cadastrados</a></div>

                </div>
                <a href="FrontController?action=Logout">
                    <center><input type="button" class="button buttonBlue" value="Sair" /></center>
                </a>
            </div>
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
