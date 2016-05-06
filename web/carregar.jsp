<%-- 
    Document   : teste
    Created on : 05/05/2016, 22:55:44
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
        <form action="FrontController?action=ListarUsuarios"
              method="post" name="listarUsuario" role="form">
            <select name="curso">
                <c:forEach items="${cursos}" var="cursos">
                    <option value="${curso.nome}"
            </c:forEach>
        </select><br/>
        
        <input type="submit">
        
    </form>
</body>
</html>
