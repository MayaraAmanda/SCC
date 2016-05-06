<%-- 
    Document   : index
    Created on : 25/04/2016, 12:39:48
    Author     : Mayara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="FrontController?action=PrepararUsuarios" <c:if test="${usuario.tipousuario.id !=1}"> hidden </c:if>> Listar Usuarios</a>
        <a href="cadastrarCurso.jsp" <c:if test="${usuario.tipousuario.id !=1}"> hidden </c:if>> Cadastrar curso</a>
        <a href="FrontController?action=LerCurso">Cursos Disponíveis</a>
        <a href="FrontController?action=LerMatricula">Listar matriculas</a>
        
        <input type="button" value="Logout" onclick="location.href='FrontController?action=Logout'">
        
    </body>
</html>
