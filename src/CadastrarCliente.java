

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClienteDAO;
import model.Cliente;

/**
 * Servlet implementation class cadastrarUsuario
 */
@WebServlet("/CadastrarCliente")
public class CadastrarCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastrarCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String reSenha = request.getParameter("reSenha");
		
		ClienteDAO cd = new ClienteDAO();
		
		if((cd.getByEmail(email) != null) || (nome == "")|| (email == "") || (senha == "")|| (reSenha == "") || !(senha.equals(reSenha))){
			response.sendRedirect("index.jsp");
			return;
		}
		Cliente c = new Cliente(nome, email, senha);
		cd.insert(c);
		response.sendRedirect("index.jsp");
	}

}
