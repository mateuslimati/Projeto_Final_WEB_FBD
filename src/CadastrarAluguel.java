

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AluguelDAO;
import DAO.ClienteDAO;
import DAO.ItemDAO;
import model.Aluguel;
import model.Cliente;
import model.Item;

/**
 * Servlet implementation class CadastrarAluguel
 */
@WebServlet("/CadastrarAluguel")
public class CadastrarAluguel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastrarAluguel() {
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
		String data = request.getParameter("data");
		Date d;
		try {
			d = new SimpleDateFormat("yyyy-MM-dd").parse(data);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("alugueis.jsp");
			return;
		}
		
		ClienteDAO cd = new ClienteDAO();
		ItemDAO idao = new ItemDAO();
		Cliente c = cd.getByEmail(email);
		Item i = idao.getByNome(nome);
		
		if((c == null) || (i == null) || (data == "") || (nome == "")|| (email == "")){
			response.sendRedirect("alugueis.jsp");
			return;
		}
		
		Aluguel a = new Aluguel(c.getId(), i.getId(), d, null);
		AluguelDAO ad = new AluguelDAO();
		ad.insert(a);
		response.sendRedirect("alugueis.jsp");
	}

}
