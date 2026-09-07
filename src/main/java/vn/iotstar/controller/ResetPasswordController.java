package vn.iotstar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

@WebServlet("/reset-password")
public class ResetPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserService userService =
            new UserServiceImpl();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        String email =
                (String) session.getAttribute(
                        "resetEmail"
                );

        Boolean verified =
                (Boolean) session.getAttribute(
                        "resetVerified"
                );

        if (email == null
                || verified == null
                || !verified) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/forgot-password"
            );

            return;
        }

        request.getRequestDispatcher(
                "/views/reset-password.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session =
                request.getSession();

        String email =
                (String) session.getAttribute(
                        "resetEmail"
                );

        Boolean verified =
                (Boolean) session.getAttribute(
                        "resetVerified"
                );

        if (email == null
                || verified == null
                || !verified) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/forgot-password"
            );

            return;
        }

        String password =
                request.getParameter("password");

        String confirmPassword =
                request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {

            request.setAttribute(
                    "error",
                    "Mat khau xac nhan khong khop"
            );

            request.getRequestDispatcher(
                    "/views/reset-password.jsp"
            ).forward(request, response);

            return;
        }

        userService.resetPassword(
                email,
                password
        );

        session.removeAttribute("resetEmail");
        session.removeAttribute("resetVerified");

        response.sendRedirect(
                request.getContextPath()
                        + "/login"
        );
    }
}