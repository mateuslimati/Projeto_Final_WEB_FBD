

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AluguelDAO;
import model.Aluguel;

/**
 * Servlet implementation class DeletarAluguel
 */
@WebServlet("/DeletarAluguel")
public class DeletarAluguel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletarAluguel() {
        super();
        // TODO Auto-generated constructor stub
    }
    																																					
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub																				
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		AluguelDAO cd = new AluguelDAO();

		Aluguel c = cd.getById(Integer.parseInt(id));
		
		if(c != null){
			cd.delete(Integer.parseInt(id));
			response.sendRedirect("alugueis.jsp");
			return;
		}																																																																																																																																																																																																																														
		response.sendRedirect("alugueis																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																												.jsp");
		return;
	}

}
