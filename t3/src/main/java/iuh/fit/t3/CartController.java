package iuh.fit.t3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        CartBean cart = (CartBean) session.getAttribute("cart");

        if (cart == null) {
            cart = new CartBean();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");

        if (action == null) {
            // Hiển thị giỏ hàng
            request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
            return;
        }

        switch (action) {
            case "add":
                addToCart(request, cart);
                break;
            case "update":
                updateCart(request, cart);
                break;
            case "remove":
                removeFromCart(request, cart);
                break;
            case "clear":
                cart.clear();
                break;
            default:
                break;
        }

        // Cập nhật session
        session.setAttribute("cart", cart);

        // Redirect để tránh resubmit form
        String referer = request.getHeader("Referer");
        if (referer != null && referer.contains("products")) {
            response.sendRedirect("products");
        } else {
            response.sendRedirect("cart");
        }
    }

    private void addToCart(HttpServletRequest request, CartBean cart) {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = 1;

            String quantityParam = request.getParameter("quantity");
            if (quantityParam != null && !quantityParam.isEmpty()) {
                quantity = Integer.parseInt(quantityParam);
            }

            Product product = ProductList.getProductById(productId);
            if (product != null && quantity > 0) {
                cart.addItem(product, quantity);
            }
        } catch (NumberFormatException e) {
            // Log error hoặc xử lý lỗi
            System.err.println("Error adding to cart: " + e.getMessage());
        }
    }

    private void updateCart(HttpServletRequest request, CartBean cart) {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.updateItem(productId, quantity);
        } catch (NumberFormatException e) {
            System.err.println("Error updating cart: " + e.getMessage());
        }
    }

    private void removeFromCart(HttpServletRequest request, CartBean cart) {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            cart.removeItem(productId);
        } catch (NumberFormatException e) {
            System.err.println("Error removing from cart: " + e.getMessage());
        }
    }
}