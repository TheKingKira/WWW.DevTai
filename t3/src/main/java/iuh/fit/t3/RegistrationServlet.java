package iuh.fit.t3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registration-servlet")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegistrationServlet() {
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

        // Create Student object
        Student student = new Student();

        // Get form data and set to Student object
        student.setFirstName(request.getParameter("firstName"));
        student.setLastName(request.getParameter("lastName"));
        student.setDayOfBirth(request.getParameter("dayOfBirth"));
        student.setEmail(request.getParameter("email"));
        student.setMobileNumber(request.getParameter("mobileNumber"));
        student.setGender(request.getParameter("gender"));
        student.setAddress(request.getParameter("address"));
        student.setCity(request.getParameter("city"));
        student.setPinCode(request.getParameter("pinCode"));
        student.setState(request.getParameter("state"));
        student.setCountry(request.getParameter("country"));

        // Get array parameters
        String[] hobbies = request.getParameterValues("hobbies");
        String[] qualifications = request.getParameterValues("qualifications");
        String[] courses = request.getParameterValues("courses");

        student.setHobbies(hobbies);
        student.setQualifications(qualifications);
        student.setCourses(courses);

        // Set student object as request attribute
        request.setAttribute("student", student);

        // Forward to result page
        request.getRequestDispatcher("result-form.jsp").forward(request, response);
    }
}