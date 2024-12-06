<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Aluno</title>
        <link rel="stylesheet" href="src/CSS/consultar.css">
    </head>
    <body>
<%
    String n = request.getParameter("nome");
    try{
        Connection conecta;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/gestao_alunos";
        String user = "root";
        String password = "";
        conecta = DriverManager.getConnection(url, user, password);
        
        String sql = "SELECT * FROM alunos WHERE nome LIKE ?";
        st = conecta.prepareStatement(sql);
        st.setString(1, "%" + n + "%");
        
        ResultSet rs = st.executeQuery();
%>
        <table class="tab">
            <thead>
                <tr>
                    <th>RA</th>
                    <th>Nome</th>
                    <th>Idade</th>
                    <th>Turma</th>
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
