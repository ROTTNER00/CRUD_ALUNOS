<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alterar</title>
    <link rel="stylesheet" href="src/CSS/alterar.css">
</head>
<body>
    <% 
        
     request.setCharacterEncoding("UTF-8");
    
    // Inicializa as variáveis
    String nome;
    int idade;
    String turma;
    int ra;

    // Recebe os dados do formulário
    nome = request.getParameter("nome");
    idade = Integer.parseInt(request.getParameter("idade"));
    turma = request.getParameter("turma"); // Corrigido de "tuma" para "turma"
    ra = Integer.parseInt(request.getParameter("ra"));  // Recebendo o RA para atualizar o aluno específico

    try {
        // Conexão com o banco de dados
        Connection conecta;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/gestao_alunos?characterEncoding=UTF-8";
        String user = "root";
        String password = "";
        conecta = DriverManager.getConnection(url, user, password);

        // Atualiza os dados na tabela com base no RA
        String sql = "UPDATE alunos SET nome=?, idade=?, turma=? WHERE ra=?";
        st = conecta.prepareStatement(sql);
        st.setString(1, nome);
        st.setInt(2, idade);
        st.setString(3, turma);
        st.setInt(4, ra);  // Usando RA para identificar qual aluno será atualizado
        st.executeUpdate(); // Executa o update

        out.print("<p class='success'>As informações foram alteradas com sucesso!</p>");
        conecta.close(); // Fechar a conexão após a atualização
    } catch (SQLException e) {
        out.print("<p class='error'>Erro ao alterar dados:</p>" + e.getMessage());
    } catch (Exception e) {
        out.print("Erro geral: " + e.getMessage());
    }
    %>
    <button type="button" onclick="window.location.href='listar.jsp'">Voltar para a lista</button>
</body>
</html>
