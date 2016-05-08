<%-- 
    Document   : cadastrarCurso
    Created on : 05/05/2016, 13:46:01
    Author     : Mayara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Sistema de Cadastro de Curso</title>

        <link rel="stylesheet" href="css/estilo.css">

    </head>
    <body>
        <hgroup>
            <h1>II Apresentação de Minicursos dos Alunos do BSI</h1>
        </hgroup>

        <form action="FrontController?action=GravarCurso"
              method="POST" name="cadastrarCursos" role="form">
            <center><h3>Cadastro de cursos</h3></center>
            <div class="group">
                <center>${aux}</center><br>
                <input type="text" name="codigo"><span class="highlight"></span><span class="bar"></span>
                <label>Código</label>
            </div>
            <div class="group">
                <input type="text" name="nome"><span class="highlight"></span><span class="bar"></span>
                <label>Curso</label>
            </div>
            <div class="group">
                <input type="text" name="descricao"><span class="highlight"></span><span class="bar"></span>
                <label>Descrição</label>
            </div>
            <div class="group">
                <input type="text" name="palestrante"><span class="highlight"></span><span class="bar"></span>
                <label>Palestrante</label>
            </div>
            <div class="group">
                <input type="text" name="cargaHoraria"><span class="highlight"></span><span class="bar"></span>
                <label>Carga Horária</label>
            </div>
            <div class="group">
                <input type="text" name="data"><span class="highlight"></span><span class="bar"></span>
                <label>Data</label>
            </div>
            <div class="group">
                <input type="text" name="hora"><span class="highlight"></span><span class="bar"></span>
                <label>Hora</label>
            </div>
            <div class="group">
                <input type="text" name="laboratorio"><span class="highlight"></span><span class="bar"></span>
                <label>Laboratório</label>
            </div>
            <div class="group">
                <input type="text" name="vagas"><span class="highlight"></span><span class="bar"></span>
                <label>Nº de Vagas</label>
            </div>&nbsp; 
            <a href="FrontController?action=VoltarInicio">
                <input type="button" class="button buttonBlue" value="Voltar" />
            </a>
            <input type="submit" class="button buttonBlue" value="Cadastrar"/>
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
