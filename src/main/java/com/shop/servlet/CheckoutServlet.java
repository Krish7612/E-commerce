package com.shop.servlet;

import com.shop.model.Cart;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.UUID;

public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("checkout.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            req.setAttribute("error", "Your cart is empty.");
            RequestDispatcher rd = req.getRequestDispatcher("checkout.jsp");
            rd.forward(req, resp);
            return;
        }

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        if (name == null || name.isBlank() ||
            email == null || email.isBlank() ||
            address == null || address.isBlank()) {
            req.setAttribute("error", "Please fill all fields.");
            RequestDispatcher rd = req.getRequestDispatcher("checkout.jsp");
            rd.forward(req, resp);
            return;
        }

        String orderId = UUID.randomUUID().toString().substring(0, 8).toUpperCase();
        req.setAttribute("orderId", orderId);
        req.setAttribute("total", cart.getTotal());
        cart.clear();
        RequestDispatcher rd = req.getRequestDispatcher("success.jsp");
        rd.forward(req, resp);
    }
}
