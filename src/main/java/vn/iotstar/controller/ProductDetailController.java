package vn.iotstar.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.model.Product;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/product/detail" })
public class ProductDetailController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            Product product = productService.get(id);

            if (product == null) {
                resp.sendRedirect(
                        req.getContextPath() + "/product");
                return;
            }

            req.setAttribute("product", product);

            RequestDispatcher dispatcher =
                    req.getRequestDispatcher(
                            "/views/product/detail-product.jsp");

            dispatcher.forward(req, resp);

        } catch (NumberFormatException e) {

            resp.sendRedirect(
                    req.getContextPath() + "/product");
        }
    }
}