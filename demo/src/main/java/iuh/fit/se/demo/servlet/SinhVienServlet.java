package iuh.fit.se.demo.servlet;

import iuh.fit.se.demo.dao.SinhVienDao;
import iuh.fit.se.demo.model.SinhVien;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;
import java.io.IOException;


@WebServlet("/sinhvien")
public class SinhVienServlet extends HttpServlet {
    private final SinhVienDao dao = new SinhVienDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException {
        List<SinhVien> ds;
        ds = dao.findAll();

        req.setAttribute("sinhviens", ds);
        req.getRequestDispatcher("/sinhvien-list.jsp").forward(req,resp );
    }
}
