<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestão de Alunos</title>
    <link rel="stylesheet" href="src/CSS/style.css">
</head>
<body>
    <%
        try {
            // Fazer a conexão com o banco de dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/gestao_alunos";
            String user = "root";
            String password = "";
            conecta = DriverManager.getConnection(url, user, password);

            // Consulta SQL
            String sql = "SELECT * FROM alunos";
            st = conecta.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
    %>
    <table class="tab">
        <thead>
            <tr>
                <th>RA</th>
                <th>Nome</th>
                <th>Idade</th>
                <th>Turma</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("ra") %></td>
                <td><%= rs.getString("nome") %></td>
                <td><%= rs.getInt("idade") %></td>
                <td><%= rs.getString("turma") %></td>
                <td>
                    <div class="actions">
                        <!-- Botão de alterar -->
                        <a href="alterar.jsp?ra=<%= rs.getString("ra") %>">
                            <img src="src/img/Alterar.png" width="30" height="30" alt="Alterar">
                        </a>
                        <!-- Barra divisória -->
                        <div class="divider"></div>
                        <!-- Botão de excluir -->
                        <a href="confirma_exclusao.jsp?ra=<%= rs.getString("ra") %>">
                            <img src="src/img/Lixeira_1.png" width="30" height="30" alt="Excluir">
                        </a>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        } catch (Exception e) {
            out.print("Mensagem de erro: " + e.getMessage());
        }
    %>
</body>
</html>
