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

@WebServlet(urlPatterns = { "/admin/product/add" })
public class ProductAddController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        List<Category> cateList = categoryService.getAll();

        req.setAttribute("cateList", cateList);

        RequestDispatcher dispatcher =
                req.getRequestDispatcher(
                        "/views/admin/add-product.jsp");

        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String productName = req.getParameter("productName");
        String images = req.getParameter("images");
        String priceParam = req.getParameter("price");
        String description = req.getParameter("description");
        String cateIdParam = req.getParameter("cateId");

        try {
            double price = Double.parseDouble(priceParam);
            int cateId = Integer.parseInt(cateIdParam);

            Product product = new Product();

            product.setProductName(productName);
            product.setImages(images);
            product.setPrice(price);
            product.setDescription(description);
            product.setCateId(cateId);

            productService.insert(product);

            resp.sendRedirect(
                    req.getContextPath() + "/product");

        } catch (NumberFormatException e) {

            req.setAttribute("error",
                    "Giá hoặc danh mục không hợp lệ.");

            List<Category> cateList =
                    categoryService.getAll();

            req.setAttribute("cateList", cateList);

            RequestDispatcher dispatcher =
                    req.getRequestDispatcher(
                            "/views/admin/add-product.jsp");

            dispatcher.forward(req, resp);
        }
    }
}