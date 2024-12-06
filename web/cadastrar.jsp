<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Variável para exibir mensagem de feedback
    request.setCharacterEncoding("UTF-8");
    String mensagem = "";

    // Verifica se o formulário foi enviado
    if (request.getParameter("nome") != null && request.getParameter("idade") != null && request.getParameter("turma") != null) {
        String nome = request.getParameter("nome");
        String idadeStr = request.getParameter("idade");
        String turma = request.getParameter("turma");

        try {
            int idade = Integer.parseInt(idadeStr);

            // Valida a idade (apenas entre 15 e 100 anos)
            if (idade < 15 || idade > 100) {
                mensagem = "Erro: A idade deve estar entre 15 e 100 anos.";
            } else {
                // Conexão com o banco de dados (com a configuração UTF-8)
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestao_alunos?characterEncoding=UTF-8", "root", "");

                // Inserir os dados no banco de dados
                String sql = "INSERT INTO alunos (nome, idade, turma) VALUES (?, ?, ?)";
                PreparedStatement st = conecta.prepareStatement(sql);
                st.setString(1, nome);
                st.setInt(2, idade);
                st.setString(3, turma);
                st.executeUpdate();

                mensagem = "Aluno cadastrado com sucesso!";
            }
        } catch (NumberFormatException e) {
            mensagem = "Erro: Idade inválida. Insira um número.";
        } catch (Exception ex) {
            mensagem = "Erro ao cadastrar: " + ex.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="src/CSS/cadastrar.css">
    </head>
    <body>
        <header> 
            <h1>SENAI</h1>
        </header>
        
        <main>
            <button class="imagem-botao" onclick="window.location.href='index.html'">
                <img src="src/img/Seta Voltar.png" alt="Seta para voltar" class="seta_voltar">
            </button>
            
            <!-- Exibe a mensagem de sucesso ou erro -->
            <% if (!mensagem.isEmpty()) { %>
                <p class="mensagem"><%= mensagem %></p>
            <% } %>
            
            <form class="form-container" method="post" action="cadastrar.jsp">
                <div class="form-group">
                    <label for="nome">NOME:</label>
                    <input type="text" id="nome" name="nome" required>
                </div>
                <div class="form-group">
                    <label for="idade">IDADE:</label>
                    <!-- Limitação da idade no front-end -->
                    <input type="number" id="idade" name="idade" min="15" max="100" required>
                </div>
                <div class="form-group">
                    <label for="turma">TURMA:</label>
                    <input type="text" id="turma" name="turma" required>
                </div>
                <button type="submit">Cadastrar</button>
            </form>
        </main>
        
        <footer>
            <img src="src/img/Bandeira Senai.png" alt="Bandeira Senai" class="bandeira"/>
        </footer>
    </body>
</html>
