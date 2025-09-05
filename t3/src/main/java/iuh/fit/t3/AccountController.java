package iuh.fit.t3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/account-controller")
public class AccountController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;

    public AccountController() {
        super();
        accountDAO = new AccountDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "register":
                showRegisterForm(request, response);
                break;
            case "list":
                listAccounts(request, response);
                break;
            default:
                listAccounts(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            registerAccount(request, response);
        } else {
            doGet(request, response);
        }
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("account-register.jsp").forward(request, response);
    }

    private void registerAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Get form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String country = request.getParameter("country");

        // Validation
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("error", "Username is required!");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Password is required!");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        // Create new account
        Account newAccount = new Account(username, password, firstName, lastName,
                email, phone, gender, country);

        // Try to add account
        boolean success = accountDAO.addAccount(newAccount);

        if (success) {
            request.setAttribute("success", "Account registered successfully!");
            listAccounts(request, response);
        } else {
            request.setAttribute("error", "Username already exists!");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
        }
    }

    private void listAccounts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Account> accounts = accountDAO.getAllAccounts();
        request.setAttribute("accounts", accounts);
        request.setAttribute("totalAccounts", accountDAO.getTotalAccounts());
        request.getRequestDispatcher("account-list.jsp").forward(request, response);
    }
}