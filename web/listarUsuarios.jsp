<%--
    Document   : lerUsuarios
    Created on : 06/05/2016, 16:58:16
    Author     : Mayara
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        <div id="usuarios">
            <center><h3>Usuários cadastrados</h3></center>
            <center>${msg}</center><br><br>
            <table>
                <tr>
                    <th><span>Matrícula</span></th>
                    <th><span>Usuário</span></th>
                    <th><span>Curso</span></th>
                    <th><span>Assinatura</span></th>
                </tr>

                <c:forEach items="${matriculas}" var="matriculas">
                    <tr>
                        <td><c:out value="${matriculas.usuario.matricula}" /></td>
                        <td><c:out value="${matriculas.usuario.nome}" /></td>
                        <td><c:out value="${matriculas.curso.nome}" /></td>
                        <td><c:out value="_____________________________________________________" /></td>
                    </tr>
                </c:forEach>

            </table><br/><br/>

            <a href="FrontController?action=VoltarInicio">
                <center><input type="button" class="button buttonBlue" value="Voltar" /></center>
            </a>

        </div>
        <footer>

            <p>Realização:
                <a href="https://www.facebook.com/CASIBSI/" target="_blank"><br>
                    <img src="img/casi.png"></a><br>
        </footer>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>

    </body>
</html>
