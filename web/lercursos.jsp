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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <table BORDER="1">
            <tr>
                <th><span>CÓDIGO</span>
                <th><span>CURSO</span>
                </th>
                <th><span>PALESTRANTE</span></th>
                <th><span>OPÇÕES</span></th>


            </tr>
            <c:forEach items="${cursos}" var="cursos">
                <tr>
                    <td><c:out value="${cursos.codigo}" /></td>
                    <td><c:out value="${cursos.nome}" /></td>
                    <td><c:out value="${cursos.palestrante}" /></td>
                    <td><a href="FrontController?action=ApagarCurso&codigo=<c:out value='${cursos.codigo}'/>">Excluir</a>&nbsp;&nbsp;
                </tr>
            </c:forEach>
        </table><br/><br/>

    </body>
</html>
