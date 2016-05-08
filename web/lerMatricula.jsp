<%--
    Document   : lerMatricula1
    Created on : 06/05/2016, 17:59:32
    Author     : Mayara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html >
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
        <hgroup>
            <h2>II Apresentação de Minicursos dos Alunos do BSI</h2>
        </hgroup>
        <form>
            <center><h4>Você está cadastrado nos cursos:</h4></center>
            <center>${msg}</center>

            <table id="matricula"><br><br>
                <tr>

                    <th><span>Curso</span></th>
                    <th><span>Sala</span></th>
                    <th><span>Data</span></th>
                    <th><span>Hora</span></th>
                    <th><span>Remover</span></th>


                </tr>
                <c:forEach items="${matriculas}" var="matricula">
                    <tr>

                        <td><c:out value="${matricula.curso.nome}" /></td>
                        <td><c:out value="${matricula.curso.laboratorio}" /></td>
                        <td><c:out value="${matricula.curso.data}" /></td>
                        <td><c:out value="${matricula.curso.hora}" /></td>

                        <td><a href="FrontController?action=ApagarMatricula&codigocurso=<c:out value='${matricula.curso.codigo}'/>&pagina=LerMatricula" class="glyphicon glyphicon-remove"></a>&nbsp;&nbsp;
                    </tr>
                </c:forEach>
            </table><br/><br/>
            <a href="FrontController?action=VoltarInicio">
                <center><input type="button" class="button buttonBlue" value="Voltar" /></center>
            </a>
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
