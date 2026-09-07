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

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserService userService =
            new UserServiceImpl();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/views/login.jsp"
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

        String password =
                request.getParameter("password");

        User user =
                userService.getByEmail(email);

        if (user == null) {

            request.setAttribute(
                    "error",
                    "Email khong ton tai"
            );

            request.getRequestDispatcher(
                    "/views/login.jsp"
            ).forward(request, response);

            return;
        }

        if (!user.isActive()) {

            request.setAttribute(
                    "error",
                    "Tai khoan chua duoc kich hoat"
            );

            request.getRequestDispatcher(
                    "/views/login.jsp"
            ).forward(request, response);

            return;
        }

        User loginUser =
                userService.login(
                        email,
                        password
                );

        if (loginUser == null) {

            request.setAttribute(
                    "error",
                    "Mat khau khong dung"
            );

            request.getRequestDispatcher(
                    "/views/login.jsp"
            ).forward(request, response);

            return;
        }

        HttpSession session =
                request.getSession();

        session.setAttribute(
                "account",
                loginUser
        );

        response.sendRedirect(
                request.getContextPath()
                        + "/home"
        );
    }
}