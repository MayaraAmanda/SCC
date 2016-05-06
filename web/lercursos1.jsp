<%-- 
    Document   : lercursos
    Created on : 27/04/2016, 15:12:48
    Author     : Mayara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>

        <table BORDER="1">
            <tr>
                <th><span>CÓDIGO</span>
                <th><span>CURSO</span>
                </th>
                <th><span>PALESTRANTE</span></th>
                <th colspan="2"><span>OPÇÕES</span></th>

        <input type="button" value="Logout" onclick="location.href='FrontController?action=Logout'">

            </tr>
            <c:forEach items="${cursos}" var="cursos">
                <tr>
                    <td><c:out value="${cursos.codigo}" /></td>
                    <td><c:out value="${cursos.nome}" /></td>
                    <td><c:out value="${cursos.palestrante}" /></td>
                    <td><a href="FrontController?action=GravarMatricula&codigo=<c:out value='${cursos.codigo}'/>" class="glyphicon glyphicon-ok">Cadastrar</a>&nbsp;&nbsp;
                    <td><a href="FrontController?action=ApagarMatricula&codigo=<c:out value='${cursos.codigo}'/>" class="glyphicon glyphicon-remove">Remover</a>&nbsp;&nbsp;
                </tr>
            </c:forEach>
        </table><br/><br/>
        <p>${msg}</p>
           
    </body>
</html>
