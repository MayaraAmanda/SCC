<%-- 
    Document   : home
    Created on : 06/05/2016, 17:16:35
    Author     : Mayara
--%>

<!DOCTYPE html>
<html lang="pt-br">
    <meta charset="UTF-8">
    <meta name="description" content="Tela de cadastro de usuários e de cursos">
    <meta name="keywords" content="home,cadastrar, cursis, usuários">
    <meta name="author" content="Mayara Amanda">
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <body>
        <header>
            <hgroup>
                <h1>II Apresentação de Minicursos dos Alunos do BSI</h1>
            </hgroup>
        </header>

        <section>
            <div class="conteudo">
                <div class="opcoes">
                    <i class="fa fa-graduation-cap" aria-hidden="true"></i> <a href="cadastrarCurso.jsp"> Cadastrar Curso</a>
                    <br>
                    <i class="fa fa-list-alt" aria-hidden="true"></i> <a href="FrontController?action=LerCurso">Cursos disponíveis</a>
                    <br>
                    <i class="fa fa-user" aria-hidden="true"></i> <a href="FrontController?action=ListarUsuarios">Usuários cadastrados</a>
                    <br>

                </div>

                <div class="sair">
                    <a href="FrontController?action=Logout">
                        <button class="button" style="vertical-align:middle"><span>Sair </span></button>
                    </a>
                </div>

            </div>
        </section>

        <footer>
            <p>Realização:
                <a href="https://www.facebook.com/CASIBSI/" target="_blank"><br>
                    <img src="img/casi.png"></a><br>
        </footer>

    </body>
</html>
