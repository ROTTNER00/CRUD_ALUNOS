/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.95
 * Generated at: 2024-12-05 16:37:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public final class salvar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(6);
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(6);
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("java.sql.DriverManager");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title>Salvar</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    ");

        int id = 0;
        String nome = "";
        String categoria = "";
        String preco = "";
        String data_de_validade_str = "";
        Date data_de_validade = null;

        // Obtendo os parâmetros da requisição
        if (request.getParameter("id") != null) {
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException e) {
                out.print("<p style='color:red;'>Erro: ID inválido.</p>");
            }
        }
        if (request.getParameter("nome") != null) {
            nome = request.getParameter("nome");
        }
        if (request.getParameter("categoria") != null) {
            categoria = request.getParameter("categoria");
        }
        if (request.getParameter("preco") != null) {
            preco = request.getParameter("preco");
        }
        if (request.getParameter("data_de_validade") != null) {
            data_de_validade_str = request.getParameter("data_de_validade");

            // Convertendo a data de DD/MM/YYYY para o formato adequado para o banco de dados (YYYY-MM-DD)
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                data_de_validade = sdf.parse(data_de_validade_str);
            } catch (Exception e) {
                out.print("<p style='color:red;'>Erro ao converter a data: " + e.getMessage() + "</p>");
            }
        }

        // Se os dados estiverem completos
        if (!nome.isEmpty() && !categoria.isEmpty() && !preco.isEmpty() && data_de_validade != null) {
            try {
                // Fazendo a conexão com o banco de dados
                Connection conecta = null;
                PreparedStatement st = null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/crud?useUnicode=true&characterEncoding=UTF-8";
                String user = "root";
                String password = "";
                conecta = DriverManager.getConnection(url, user, password);

                // Inserindo dados na tabela obsidian
                String sql = "INSERT INTO obsidian (id, nome, categoria, preco, data_de_validade) VALUES (?, ?, ?, ?, ?)";
                st = conecta.prepareStatement(sql);
                st.setInt(1, id); // Define o valor do id
                st.setString(2, nome); // Define o valor do nome
                st.setString(3, categoria); // Define o valor da categoria
                st.setString(4, preco); // Define o valor do preço
                st.setDate(5, new java.sql.Date(data_de_validade.getTime())); // Define o valor da data de validade

                // Executando a inserção no banco de dados
                int rowsAffected = st.executeUpdate();

                // Mensagem de sucesso
                if (rowsAffected > 0) {
                    out.print("<p style='color:blue; font-size:25px;'>CADASTRADO COM SUCESSO...</p>");
                    out.print("<button onclick='window.location.href=\"index.html\"'>Voltar</button>");
                }
            } catch (Exception e) {
                // Caso haja erro na conexão ou inserção, será exibida uma mensagem de erro
                out.print("<p style='color:red;'>Erro: " + e.getMessage() + "</p>");
            }
        } else {
            out.print("<p style='color:red;'>Por favor, preencha todos os campos.</p>");
        }

        // Exibindo a data no formato dd/MM/yyyy após inserção (se houver sucesso)
        if (data_de_validade != null) {
            SimpleDateFormat sdfExibicao = new SimpleDateFormat("dd/MM/yyyy");
            String dataExibicao = sdfExibicao.format(data_de_validade);
            out.print("<p>Data de validade registrada: " + dataExibicao + "</p>");
        }
    
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
