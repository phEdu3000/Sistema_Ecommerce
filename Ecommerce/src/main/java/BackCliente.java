import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BackCliente")
public class BackCliente extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Configurações do Banco
    private static final String URL = "jdbc:mysql://localhost:3306/Ecommerce?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root"; 
    private static final String PASS = "33948823"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // UTF-8 para request e response
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Capturar dados do formulário
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");

        // Validação mínima
        if(nome == null || nome.isEmpty() || email == null || email.isEmpty()) {
            out.println("<h2>❌ Nome e Email são obrigatórios!</h2>");
            out.println("<a href='CadastroCliente.html'>Voltar</a>");
            return;
        }

        // Inserção no banco
        String sql = "INSERT INTO cliente (nome, email, telefone) VALUES (?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, nome);
                stmt.setString(2, email);
                stmt.setString(3, telefone);

                int linhas = stmt.executeUpdate();

                if(linhas > 0) {
                    out.println("<html><body>");
                    out.println("<h2>✅ Cliente '" + nome + "' cadastrado com sucesso!</h2>");
                    out.println("<a href='CadastroCliente.html'>Voltar</a>");
                    out.println("</body></html>");
                } else {
                    out.println("<h2>❌ Erro ao cadastrar o cliente.</h2>");
                    out.println("<a href='CadastroCliente.html'>Voltar</a>");
                }

            }
        } catch (ClassNotFoundException e) {
            out.println("❌ Erro: Driver JDBC não encontrado.");
            e.printStackTrace(out);
        } catch (SQLException e) {
            out.println("❌ Erro no banco de dados: " + e.getMessage());
            e.printStackTrace(out);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("CadastroCliente.html"); // Redireciona para o formulário
    }
}