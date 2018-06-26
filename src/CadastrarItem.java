

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
 * Servlet implementation class CadastrarItem
 */
@WebServlet("/CadastrarItem")
public class CadastrarItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastrarItem() {
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
		String descricao = request.getParameter("descricao");
		String valor = request.getParameter("preco");
		double v = new Double(valor);
		String quantidade = request.getParameter("quantidade");
		int q = new Integer(quantidade);
		
		ItemDAO cd = new ItemDAO();
		
		if((cd.getByNome(nome) != null) || (nome == "")|| (descricao == "") || (valor == "")|| (quantidade == "")){
			response.sendRedirect("itens.jsp");
			return;
		}
		Item c = new Item(nome, descricao, v, q);
		cd.insert(c);
		response.sendRedirect("itens.jsp");
	}

}
