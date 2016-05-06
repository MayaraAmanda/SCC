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
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Sistema de cadastro de cursos</title>
        </head>

        <body>
            <table border="1">
                <tr>
                    <th><span>USUÁRIO</span>
                    </th>
                    <th><span>CURSO</span></th>
                </tr>

                            <select name="optTipoBolsa" id="tipobolsa" class="form-control">
                            <c:forEach items="${tipoBolsas}" var="tipoBolsa">
                                <option value="${tipobolsa.codigoTipoBolsa}"
                                        <c:if test="${tipobolsa.codigoTipoBolsa == edital.tipobolsa.codigoTipoBolsa}"> selected </c:if>> ${tipoBolsa.nomeTipoBolsa}</option>
                            </c:forEach>
                        </select><br><br>

                <c:forEach items="${usuarios}" var="usuarios">
                    <tr>
                        <td><c:out value="${usuarios.nome}" /></td>
                        <td><c:out value="${usuarios.curso}" /></td>

                    </tr>
                </c:forEach>


            </table><br/><br/>

        </body>
    </html>
