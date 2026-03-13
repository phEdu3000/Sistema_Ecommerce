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

@WebServlet("/BackProduto")
public class BackProduto extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String URL = "jdbc:mysql://localhost:3306/Ecommerce?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root"; 
    private static final String PASS = "33948823"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Capturar dados
        String nome = request.getParameter("produto");
        String precoStr = request.getParameter("preco");
        String quantidadeStr = request.getParameter("quantidade");
        System.out.println("Recebido do formulário: " + nome + ", " + precoStr + ", " + quantidadeStr);
        // Validação mínima
        if(nome == null || nome.isEmpty() || precoStr == null || precoStr.isEmpty() || quantidadeStr == null || quantidadeStr.isEmpty()) {
            out.println("<h2>❌ Todos os campos são obrigatórios!</h2>");
            out.println("<a href='CadastroProduto.html'>Voltar</a>");
            return;
        }

        double preco;
        int quantidade;
        try {
            preco = Double.parseDouble(precoStr);
            quantidade = Integer.parseInt(quantidadeStr);
        } catch(NumberFormatException e) {
            out.println("<h2>❌ Preço ou quantidade inválidos!</h2>");
            out.println("<a href='CadastroProduto.html'>Voltar</a>");
            return;
        }

        String sql = "INSERT INTO produtos (nome, preco, quantidade) VALUES (?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, nome);
                stmt.setDouble(2, preco);
                stmt.setInt(3, quantidade);

                int linhas = stmt.executeUpdate();

                if(linhas > 0) {
                    out.println("<html><body>");
                    out.println("<h2>✅ Produto '" + nome + "' cadastrado com sucesso!</h2>");
                    out.println("<a href='CadastroProduto.html'>Voltar</a>");
                    out.println("</body></html>");
                } else {
                    out.println("<h2>❌ Erro ao cadastrar o produto.</h2>");
                    out.println("<a href='CadastroProduto.html'>Voltar</a>");
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
        response.sendRedirect("CadastroProduto.html"); 
    }
}
