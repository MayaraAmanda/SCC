<%-- 
    Document   : listarUsuarios
    Created on : 05/05/2016, 22:15:17
    Author     : Mayara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Sistema de Cadastro de Cursos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
    </head>

    <body>
        <h4>Usuários cadastrados</h4>
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

        <a href="FrontController?action=VoltarInicio">Voltar</a>
        <a href="FrontController?action=LerMatricula">Listar matriculas</a>
    </body>
</html>
