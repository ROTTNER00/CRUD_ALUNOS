<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar produto</title>
        <link rel="stylesheet" href="src/CSS/alterar.css">
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            
            
            int ra;
            ra = Integer.parseInt(request.getParameter("ra"));
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/gestao_alunos?characterEncoding=UTF-8";
            String user = "root";
            String password = "";
            conecta = DriverManager.getConnection(url, user, password);

            String sql = "SELECT * FROM alunos WHERE ra = ?";
            st = conecta.prepareStatement(sql);
            st.setInt(1, ra);
            
            ResultSet resultado = st.executeQuery();

            if (!resultado.next()) {
                out.print("Este aluno não foi localizado!");
            } else { // Se encontrou o aluno na tabela, vamos carregar os dados no formulário
        %>
        <form action="alterar_aluno.jsp" method="post">
            <input type="hidden" name="ra" value="<%= ra %>" /> <!-- Passa o RA como campo oculto -->
            <p>
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" value="<%= resultado.getString("nome") %>">
            </p>
            
            <p>
                <label for="idade">Idade:</label>
                <input type="number" name="idade" id="idade" value="<%= resultado.getInt("idade") %>">
            </p>
            
            <p>
                <label for="turma">Turma:</label>
                <input type="text" name="turma" id="turma" value="<%= resultado.getString("turma") %>">
            </p>
            
            <p>
                <input type="submit" id="btnSalvar" value="Salvar alterações">
            </p>
            
            <a href="listar.jsp">Voltar para a lista</a>
            
            
        </form>
        <%
            }
        %>
    </body>
</html>

