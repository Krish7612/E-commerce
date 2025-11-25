package com.shop.servlet;

import com.shop.dao.ProductDAO;
import com.shop.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProductServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam != null) {
            long id = Long.parseLong(idParam);
            Product product = productDAO.findById(id);
            if (product == null) {
                resp.sendRedirect(req.getContextPath() + "/products");
                return;
            }
            req.setAttribute("product", product);
            RequestDispatcher rd = req.getRequestDispatcher("product-details.jsp");
            rd.forward(req, resp);
        } else {
            List<Product> products = productDAO.findAll();
            req.setAttribute("products", products);
            RequestDispatcher rd = req.getRequestDispatcher("products.jsp");
            rd.forward(req, resp);
        }
    }
}
