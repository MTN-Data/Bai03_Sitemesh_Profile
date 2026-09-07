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

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserService userService =
            new UserServiceImpl();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/views/forgot-password.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email =
                request.getParameter("email");

        if (!userService.checkEmailExist(email)) {

            request.setAttribute(
                    "error",
                    "Email khong ton tai"
            );

            request.getRequestDispatcher(
                    "/views/forgot-password.jsp"
            ).forward(request, response);

            return;
        }

        boolean result =
                userService.sendResetOtp(email);

        if (result) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "resetEmail",
                    email
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/verify-reset-otp"
            );

        } else {

            request.setAttribute(
                    "error",
                    "Khong the gui OTP"
            );

            request.getRequestDispatcher(
                    "/views/forgot-password.jsp"
            ).forward(request, response);
        }
    }
}