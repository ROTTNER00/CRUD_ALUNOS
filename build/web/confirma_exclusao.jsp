<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Confirmar Exclusão</title>
    <link rel="stylesheet" href="src/CSS/excluir.css">
</head>
<body>
    <div class="container">
        <h2>Deseja realmente excluir esse aluno?</h2>
        <div class="button-container">
            <!-- Botão "Sim" -->
            <form action="excluir.jsp" method="post">
                <input type="hidden" name="ra" value="<%= request.getParameter("ra") %>">
                <button type="submit">Sim</button>
            </form>
            <!-- Botão "Não" -->
            <form action="listar.jsp" method="get">
                <button type="button" onclick="window.location.href='listar.jsp'">Não</button>
            </form>
        </div>
    </div>

</body>
</html>
