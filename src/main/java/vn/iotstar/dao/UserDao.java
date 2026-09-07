package vn.iotstar.dao;

import java.time.LocalDateTime;

import vn.iotstar.model.User;

public interface UserDao {

    void insert(User user);

    User getByEmail(String email);

    boolean checkEmailExist(String email);

    void activateAccount(String email);

    void updateResetOtp(
            String email,
            String otp,
            LocalDateTime expiry
    );

    void updatePassword(
            String email,
            String newPassword
    );
}