package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.model.Category;
import vn.iotstar.model.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/admin/product/edit" })
public class ProductEditController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            Product product = productService.get(id);

            if (product == null) {
                resp.sendRedirect(
                        req.getContextPath() + "/admin/product/list");
                return;
            }

            List<Category> cateList = categoryService.getAll();

            req.setAttribute("product", product);
            req.setAttribute("cateList", cateList);

            RequestDispatcher dispatcher =
                    req.getRequestDispatcher(
                            "/views/admin/edit-product.jsp");

            dispatcher.forward(req, resp);

        } catch (NumberFormatException e) {

            resp.sendRedirect(
                    req.getContextPath() + "/admin/product/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {
            int productId =
                    Integer.parseInt(req.getParameter("productId"));

            String productName =
                    req.getParameter("productName");

            String images =
                    req.getParameter("images");

            double price =
                    Double.parseDouble(req.getParameter("price"));

            String description =
                    req.getParameter("description");

            int cateId =
                    Integer.parseInt(req.getParameter("cateId"));

            Product product = new Product();

            product.setProductId(productId);
            product.setProductName(productName);
            product.setImages(images);
            product.setPrice(price);
            product.setDescription(description);
            product.setCateId(cateId);

            productService.edit(product);

            resp.sendRedirect(
                    req.getContextPath() + "/admin/product/list");

        } catch (NumberFormatException e) {

            resp.sendRedirect(
                    req.getContextPath() + "/admin/product/list");
        }
    }
}