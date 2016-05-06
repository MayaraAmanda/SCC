<%-- 
    Document   : matricula
    Created on : 27/04/2016, 16:27:25
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
        <title>JSP Page</title>
    </head>
    <body>
<h4>Você está cadastrado nos cursos:</h4>
        <table>
            <tr>
                
                <th><span>CURSO</span>
                </th>
                <th><span>REMOVER</span></th>


            </tr>
            <c:forEach items="${matriculas}" var="matricula">
                <tr>
                    
                    <td><c:out value="${matricula.curso.nome}" /></td>
                    
                    <td><a href="FrontController?action=ApagarMatricula&codigocurso=<c:out value='${matricula.curso.codigo}'/>&pagina=LerMatricula" class="glyphicon glyphicon-remove"></a>&nbsp;&nbsp;
                </tr>
            </c:forEach>
        </table><br/><br/>
        
        <p>${msg}</p>
        <a href="FrontController?action=VoltarInicio">Voltar</a>
    </body>
</html>
