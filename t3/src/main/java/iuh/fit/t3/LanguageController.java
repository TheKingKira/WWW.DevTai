package iuh.fit.t3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/language-controller")
public class LanguageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LanguageController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String languageCode = request.getParameter("lang");

        HttpSession session = request.getSession();

        if ("change".equals(action) && languageCode != null) {
            // Change language
            session.setAttribute("languageCode", languageCode);
            request.setAttribute("message", "Language changed successfully!");
        } else if (session.getAttribute("languageCode") == null) {
            // Set default language if not set
            session.setAttribute("languageCode", "en");
        }

        // Forward to multilingual page
        request.getRequestDispatcher("multilingual.jsp").forward(request, response);
    }
}