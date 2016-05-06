<%-- 
    Document   : cursos
    Created on : 25/04/2016, 12:41:32
    Author     : Mayara
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

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
        <div class="container">
            <form class="form-horizontal" action="FrontController?action=GravarCurso"
                  method="POST" name="cadastrarCursos" role="form">
                <h2>Cadastro de Curso</h2>
                <div class="form-group">
                    <label for="codigo" class="col-sm-3 control-label">	Código: </label>
                    <div class="col-sm-9">
                        <input type="text" name="codigo" placeholder="Código" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="nome" class="col-sm-3 control-label">	Curso: </label>
                    <div class="col-sm-9">
                        <input type="text" name="nome" placeholder="Curso" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="descricao" class="col-sm-3 control-label">	Descrição: </label>
                    <div class="col-sm-9">
                        <input type="text" name="descricao" placeholder="Descrição" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="palestrante" class="col-sm-3 control-label">Palestrante:</label>
                    <div class="col-sm-9">
                        <input type="text" name="palestrante" placeholder="Palestrante" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="cargaHoraria" class="col-sm-3 control-label">Carga Horária:</label>
                    <div class="col-sm-9">
                        <input type="text" name="cargaHoraria" placeholder="Carga Horária" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="data" class="col-sm-3 control-label">Data:</label>
                    <div class="col-sm-9">
                        <input type="date" name="data" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="hora" class="col-sm-3 control-label">Hora:</label>
                    <div class="col-sm-9">
                        <input type="text" name="hora" placeholder="Hora" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="laboratorio" class="col-sm-3 control-label">Laboratório:</label>
                    <div class="col-sm-9">
                        <input type="text" name="laboratorio" placeholder="Laboratório" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="vagas" class="col-sm-3 control-label">Nº de vagas:</label>
                    <div class="col-sm-9">
                        <input type="text" name="vagas" placeholder="Número de vagas" class="form-control">
                    </div>
                </div>
                <div class="form-group">

                    <center>&nbsp; &nbsp; &nbsp; ${aux}</center><br>

                    <div class="col-sm-9 col-sm-offset-3">
                         <button type="submit" class="btn btn-primary btn-block">Voltar</button>&nbsp;
                        <button type="submit" class="btn btn-primary btn-block">Cadastrar</button>
                    </div>
                </div>
            </form>
        </div> 
    </body>
</html>