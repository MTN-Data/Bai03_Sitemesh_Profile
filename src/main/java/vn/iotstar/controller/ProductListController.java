package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.model.Product;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/product" })
public class ProductListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int page = 1;
        int pageSize = 6;

        String pageParam = req.getParameter("page");

        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);

                if (page < 1) {
                    page = 1;
                }

            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        int totalProducts = productService.count();

        int totalPages =
                (int) Math.ceil((double) totalProducts / pageSize);

        if (totalPages > 0 && page > totalPages) {
            page = totalPages;
        }

        List<Product> productList =
                productService.getByPage(page, pageSize);

        req.setAttribute("productList", productList);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);

        RequestDispatcher dispatcher =
                req.getRequestDispatcher(
                        "/views/product/list-product.jsp");

        dispatcher.forward(req, resp);
    }
}