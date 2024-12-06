<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão</title>
        <link rel="stylesheet" href="src/CSS/excluir.css">
    </head>
    <body>
        <div class="container">
            <%
                int ra = Integer.parseInt(request.getParameter("ra"));
                try {
                    Connection conecta;
                    PreparedStatement st;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/gestao_alunos";
                    String user = "root";
                    String password = "";
                    conecta = DriverManager.getConnection(url, user, password);

                    // Exclui o registro
                    String sql = "DELETE FROM alunos WHERE ra=?";
                    st = conecta.prepareStatement(sql);
                    st.setInt(1, ra);
                    int resultado = st.executeUpdate();

                    if (resultado == 0) {
                        out.print("<p class='error'>O aluno não foi encontrado!</p>");
                    } else {
                        out.print("<p class='success'>O aluno foi excluído com sucesso!</p>");
                    }
                } catch (Exception erro) {
                    out.print("<p class='error'>Erro ao excluir: " + erro.getMessage() + "</p>");
                }
            %>
            <a href="listar.jsp">Voltar para a lista</a>
        </div>
    </body>
</html>
