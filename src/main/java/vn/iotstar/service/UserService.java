package vn.iotstar.service;

import vn.iotstar.model.User;

public interface UserService {

    boolean register(User user);

    User getByEmail(String email);

    boolean checkEmailExist(String email);

    boolean verifyActivationOtp(
            String email,
            String otp
    );

    User login(
            String email,
            String password
    );

    boolean sendResetOtp(String email);

    boolean verifyResetOtp(
            String email,
            String otp
    );

    void resetPassword(
            String email,
            String newPassword
    );
}