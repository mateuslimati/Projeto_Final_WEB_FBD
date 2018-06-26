

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClienteDAO;
import DAO.ItemDAO;
import model.Cliente;
import model.Item;

/**
 * Servlet implementation class EditarValor
 */
@WebServlet("/EditarValor")
public class EditarValor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarValor() {
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
		String valor = request.getParameter("valor");
		double v = new Double(valor);
		ItemDAO cd = new ItemDAO();

		Item c = cd.getByNome(nome);
		
		if(c != null){
			c.setPreco(v);
			cd.updadePreco(c);
			response.sendRedirect("itens.jsp");
			return;
		}
		response.sendRedirect("itens.jsp");
		return;
	}

}
