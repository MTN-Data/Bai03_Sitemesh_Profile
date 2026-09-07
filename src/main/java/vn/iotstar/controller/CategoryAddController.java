package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import vn.iotstar.model.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = { "/admin/category/add" })
public class CategoryAddController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        RequestDispatcher dispatcher =
                req.getRequestDispatcher(
                        "/views/admin/add-category.jsp");

        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        Category category = new Category();

        DiskFileItemFactory factory =
                new DiskFileItemFactory();

        ServletFileUpload upload =
                new ServletFileUpload(factory);

        upload.setHeaderEncoding("UTF-8");

        try {

            List<FileItem> items =
                    upload.parseRequest(req);

            for (FileItem item : items) {

                if (item.isFormField()) {

                    if (item.getFieldName().equals("name")) {
                        category.setName(
                                item.getString("UTF-8"));
                    }

                } else {

                    if (item.getFieldName().equals("icon")
                            && item.getSize() > 0) {

                        String originalFileName =
                                item.getName();

                        int index =
                                originalFileName.lastIndexOf(".");

                        String ext =
                                originalFileName.substring(index + 1);

                        String fileName =
                                System.currentTimeMillis()
                                + "." + ext;

                        File folder =
                                new File(Constant.DIR + "/category");

                        if (!folder.exists()) {
                            folder.mkdirs();
                        }

                        File file =
                                new File(folder, fileName);

                        item.write(file);

                        category.setIcon(
                                "category/" + fileName);
                    }
                }
            }

            cateService.insert(category);

            resp.sendRedirect(
                    req.getContextPath()
                    + "/admin/category/list");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}