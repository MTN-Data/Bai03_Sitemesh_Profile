package vn.iotstar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserService userService =
            new UserServiceImpl();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/views/register.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String fullName =
                request.getParameter("fullName");

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        if (userService.checkEmailExist(email)) {

            request.setAttribute(
                    "error",
                    "Email da ton tai"
            );

            request.getRequestDispatcher(
                    "/views/register.jsp"
            ).forward(request, response);

            return;
        }

        User user = new User();

        user.setFullName(fullName);
        user.setEmail(email);
        user.setPasswordHash(password);

        boolean result =
                userService.register(user);

        if (result) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "verifyEmail",
                    email
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/verify-otp"
            );

        } else {

            request.setAttribute(
                    "error",
                    "Dang ky that bai"
            );

            request.getRequestDispatcher(
                    "/views/register.jsp"
            ).forward(request, response);
        }
    }
}