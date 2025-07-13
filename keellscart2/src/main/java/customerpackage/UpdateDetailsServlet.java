package customerpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateDetailsServlet
 */
@WebServlet("/UpdateDetailsServlet")
public class UpdateDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private UpdateDetailsDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UpdateDetailsDAO(); // Initialize UserDAO
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userid");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        try {
            userDAO.updateUserDetails(userId, name, phone, password, address); // Use UserDAO to update details
            session.setAttribute("name", name);
            session.setAttribute("phone", phone);
            session.setAttribute("address", address); // Update address in session
            response.sendRedirect("userdetails.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception (e.g., show an error message)
        }
	}

}
