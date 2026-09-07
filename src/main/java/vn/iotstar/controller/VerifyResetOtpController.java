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

@WebServlet("/verify-reset-otp")
public class VerifyResetOtpController extends HttpServlet {

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

        if (email == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/forgot-password"
            );

            return;
        }

        request.getRequestDispatcher(
                "/views/verify-reset-otp.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        String email =
                (String) session.getAttribute(
                        "resetEmail"
                );

        if (email == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/forgot-password"
            );

            return;
        }

        String otp =
                request.getParameter("otp");

        boolean result =
                userService.verifyResetOtp(
                        email,
                        otp
                );

        if (result) {

            session.setAttribute(
                    "resetVerified",
                    true
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/reset-password"
            );

        } else {

            request.setAttribute(
                    "error",
                    "OTP khong dung hoac da het han"
            );

            request.getRequestDispatcher(
                    "/views/verify-reset-otp.jsp"
            ).forward(request, response);
        }
    }
}