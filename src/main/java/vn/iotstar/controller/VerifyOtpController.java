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

@WebServlet("/verify-otp")
public class VerifyOtpController extends HttpServlet {

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
                        "verifyEmail"
                );

        if (email == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/register"
            );

            return;
        }

        request.getRequestDispatcher(
                "/views/verify-otp.jsp"
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
                        "verifyEmail"
                );

        if (email == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/register"
            );

            return;
        }

        String otp =
                request.getParameter("otp");

        boolean result =
                userService.verifyActivationOtp(
                        email,
                        otp
                );

        if (result) {

            session.removeAttribute(
                    "verifyEmail"
            );

            session.setAttribute(
                    "message",
                    "Kich hoat tai khoan thanh cong"
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/home"
            );

        } else {

            request.setAttribute(
                    "error",
                    "OTP khong dung hoac da het han"
            );

            request.getRequestDispatcher(
                    "/views/verify-otp.jsp"
            ).forward(request, response);
        }
    }
}