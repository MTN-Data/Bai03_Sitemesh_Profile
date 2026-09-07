package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import vn.iotstar.dao.impl.UserJpaDao;
import vn.iotstar.model.User;

@WebServlet(urlPatterns = "/profile")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 10 * 1024 * 1024
)
public class ProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserJpaDao userJpaDao;

    @Override
    public void init() throws ServletException {

        userJpaDao =
                new UserJpaDao();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }

        User account =
                (User) session.getAttribute(
                        "account"
                );

        if (account == null) {

            account =
                    (User) session.getAttribute(
                            "user"
                    );
        }

        if (account == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }

        User user =
                userJpaDao.findById(
                        account.getUserId()
                );

        if (user == null) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Không tìm thấy người dùng"
            );

            return;
        }

        request.setAttribute(
                "user",
                user
        );

        request.getRequestDispatcher(
                "/views/profile.jsp"
        ).forward(
                request,
                response
        );
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding(
                "UTF-8"
        );

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }

        User account =
                (User) session.getAttribute(
                        "account"
                );

        if (account == null) {

            account =
                    (User) session.getAttribute(
                            "user"
                    );
        }

        if (account == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }

        String fullName =
                request.getParameter(
                        "fullName"
                );

        String phone =
                request.getParameter(
                        "phone"
                );

        if (fullName != null) {
            fullName =
                    fullName.trim();
        }

        if (phone != null) {
            phone =
                    phone.trim();
        }

        if (fullName == null ||
                fullName.isEmpty()) {

            showError(
                    request,
                    response,
                    account.getUserId(),
                    "Họ và tên không được để trống."
            );

            return;
        }

        if (phone != null &&
                !phone.isEmpty() &&
                !phone.matches(
                        "^0[0-9]{9}$"
                )) {

            showError(
                    request,
                    response,
                    account.getUserId(),
                    "Số điện thoại phải gồm 10 chữ số và bắt đầu bằng 0."
            );

            return;
        }

        String imagePath = null;

        Part imagePart =
                request.getPart(
                        "images"
                );

        if (imagePart != null &&
                imagePart.getSize() > 0) {

            String originalName =
                    Paths.get(
                            imagePart
                                    .getSubmittedFileName()
                    )
                    .getFileName()
                    .toString();

            String extension =
                    getExtension(
                            originalName
                    );

            if (!extension.equals(".jpg")
                    && !extension.equals(".jpeg")
                    && !extension.equals(".png")
                    && !extension.equals(".gif")) {

                showError(
                        request,
                        response,
                        account.getUserId(),
                        "Chỉ được upload ảnh JPG, JPEG, PNG hoặc GIF."
                );

                return;
            }

            String newFileName =
                    UUID.randomUUID()
                            .toString()
                            + extension;

            String uploadDirectory =
                    getServletContext()
                            .getRealPath(
                                    "/uploads"
                            );

            File directory =
                    new File(
                            uploadDirectory
                    );

            if (!directory.exists()) {
                directory.mkdirs();
            }

            Path destination =
                    Paths.get(
                            uploadDirectory,
                            newFileName
                    );

            try (InputStream inputStream =
                         imagePart
                                 .getInputStream()) {

                Files.copy(
                        inputStream,
                        destination,
                        StandardCopyOption
                                .REPLACE_EXISTING
                );
            }

            imagePath =
                    "uploads/"
                            + newFileName;
        }

        try {

            User updatedUser =
                    userJpaDao.updateProfile(
                            account.getUserId(),
                            fullName,
                            phone,
                            imagePath
                    );

            if (updatedUser == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Không tìm thấy người dùng"
                );

                return;
            }

            session.setAttribute(
                    "account",
                    updatedUser
            );

            session.setAttribute(
                    "user",
                    updatedUser
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/profile?success=1"
            );

        } catch (Exception e) {

            e.printStackTrace();

            showError(
                    request,
                    response,
                    account.getUserId(),
                    "Có lỗi khi cập nhật thông tin."
            );
        }
    }

    private void showError(
            HttpServletRequest request,
            HttpServletResponse response,
            int userId,
            String error)
            throws ServletException, IOException {

        User user =
                userJpaDao.findById(
                        userId
                );

        request.setAttribute(
                "user",
                user
        );

        request.setAttribute(
                "error",
                error
        );

        request.getRequestDispatcher(
                "/views/profile.jsp"
        ).forward(
                request,
                response
        );
    }

    private String getExtension(
            String fileName) {

        int index =
                fileName.lastIndexOf(
                        '.'
                );

        if (index < 0) {
            return "";
        }

        return fileName
                .substring(index)
                .toLowerCase();
    }
}