package vn.iotstar.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = "/image")
public class DownloadImageController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        String fileName =
                req.getParameter("fname");

        File file =
                new File(
                        Constant.DIR
                        + "/"
                        + fileName);

        if (file.exists()) {

            resp.setContentType("image/jpeg");

            FileInputStream input =
                    new FileInputStream(file);

            IOUtils.copy(
                    input,
                    resp.getOutputStream());

            input.close();
        }
    }
}