package com.shop.servlet;

import com.shop.dao.ProductDAO;
import com.shop.model.Cart;
import com.shop.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class CartServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    private Cart getCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Cart cart = getCart(session);

        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "add": {
                long id = Long.parseLong(req.getParameter("id"));
                int qty = Integer.parseInt(req.getParameter("qty"));
                Product p = productDAO.findById(id);
                if (p != null) {
                    cart.add(p, qty);
                }
                break;
            }
            case "update": {
                long id = Long.parseLong(req.getParameter("id"));
                int qty = Integer.parseInt(req.getParameter("qty"));
                cart.update(id, qty);
                break;
            }
            case "remove": {
                long id = Long.parseLong(req.getParameter("id"));
                cart.remove(id);
                break;
            }
            case "clear": {
                cart.clear();
                break;
            }
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
