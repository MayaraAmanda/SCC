<%--
    Document   : lercursos
    Created on : 06/05/2016, 14:25:41
    Author     : Mayara
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html >
    <head>
        <title>Sistema de Cadastro de Curso</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <hgroup>
            <h2>II Apresentação de Minicursos dos Alunos do BSI</h2>
        </hgroup>
        <form>
            <center><h3>Cursos disponíveis</h3></center>
            <center>${msg}</center><br><br>

            <table>
                <tr>
                    <th>Vagas</th>
                    <th>Nome</th>
                    <th>Palestrante</th>
                    <th>Sala</th>
                    <th>Matricular</th>
                </tr>
                <c:forEach items="${cursos}" var="cursos">
                    <tr>
                        <td><c:out value="${cursos.vagas}" /></td>
                        <td><c:out value="${cursos.nome}" /></td>
                        <td><c:out value="${cursos.palestrante}" /></td>
                        <td><c:out value="${cursos.laboratorio}" /></td>
                        <td><a href="FrontController?action=GravarMatricula&codigo=<c:out value='${cursos.codigo}'/>" class="glyphicon glyphicon-ok"></a>&nbsp;&nbsp;
                    </tr>
                </c:forEach>
            </table><br/><br/>
            <div id="botao">
                &nbsp; &nbsp; &nbsp;
                <a href="FrontController?action=VoltarInicio">
                    <input type="button" class="button buttonBlue" value="Voltar" />
                </a>
                <a href="FrontController?action=LerMatricula">
                    <input type="button" class="button buttonBlue" value="Listar Matriculas"/>
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
