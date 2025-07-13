package customerpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        LoginDAO loginDAO = new LoginDAO();
        
        if (loginDAO.validate(username, password)) {
            HttpSession session = request.getSession(); // Create a new session
            Integer userId = loginDAO.getUserId(username);
            User user = loginDAO.getUserDetails(userId);
            session.setAttribute("userid", userId);
            session.setAttribute("username", user.getUsername()); // Store username for display purposes
            session.setAttribute("name", user.getName());
            session.setAttribute("phone", user.getPhone());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("address", user.getAddress());
            response.sendRedirect("ProductServlet");
        } else {
            response.sendRedirect("customerlogin.jsp?error=1");
        }
	}

}
