package customerpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserRegistrationDAO registrationDAO = new UserRegistrationDAO();

        if (registrationDAO.checkExistingUser(username, email)) {
            response.sendRedirect("userregistration.jsp?error=exists");
        } else {
            User newUser = new User(0, name, email, phone, address, username, password);
            try {
                registrationDAO.registerUser(newUser);
                response.sendRedirect("login.jsp?success=registered");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("userregistration.jsp?error=db");
            }
        }
	}

}
