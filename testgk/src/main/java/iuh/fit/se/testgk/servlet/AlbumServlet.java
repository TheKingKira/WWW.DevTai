package iuh.fit.se.testgk.servlet;

import iuh.fit.se.testgk.dao.AlbumDao;
import iuh.fit.se.testgk.model.Album;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/album")
public class AlbumServlet extends HttpServlet{
    private final AlbumDao dao = new AlbumDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        List<Album> ds;
        ds = dao.findAll();
        req.setAttribute("albums", ds);
        req.getRequestDispatcher("/album-list.jsp").forward(req,resp);
    }
}
