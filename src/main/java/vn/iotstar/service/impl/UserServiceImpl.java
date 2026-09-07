package vn.iotstar.service.impl;

import java.time.LocalDateTime;
import java.util.Random;

import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.util.EmailUtil;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    @Override
    public boolean register(User user) {

        if (userDao.checkEmailExist(user.getEmail())) {
            return false;
        }

        String otp = generateOtp();

        user.setActive(false);
        user.setActivationOtp(otp);
        user.setActivationOtpExpiry(
                LocalDateTime.now().plusMinutes(5)
        );

        userDao.insert(user);

        return EmailUtil.sendOtp(
                user.getEmail(),
                otp
        );
    }

    @Override
    public User getByEmail(String email) {

        return userDao.getByEmail(email);
    }

    @Override
    public boolean checkEmailExist(String email) {

        return userDao.checkEmailExist(email);
    }

    @Override
    public boolean verifyActivationOtp(
            String email,
            String otp) {

        User user = userDao.getByEmail(email);

        if (user == null) {
            return false;
        }

        if (user.isActive()) {
            return false;
        }

        if (user.getActivationOtp() == null) {
            return false;
        }

        if (!user.getActivationOtp().equals(otp)) {
            return false;
        }

        if (user.getActivationOtpExpiry() == null) {
            return false;
        }

        if (LocalDateTime.now()
                .isAfter(user.getActivationOtpExpiry())) {

            return false;
        }

        userDao.activateAccount(email);

        return true;
    }

    @Override
    public User login(
            String email,
            String password) {

        User user = userDao.getByEmail(email);

        if (user == null) {
            return null;
        }

        if (!user.isActive()) {
            return null;
        }

        if (!user.getPasswordHash().equals(password)) {
            return null;
        }

        return user;
    }

    @Override
    public boolean sendResetOtp(String email) {

        User user = userDao.getByEmail(email);

        if (user == null) {
            return false;
        }

        String otp = generateOtp();

        LocalDateTime expiry =
                LocalDateTime.now().plusMinutes(5);

        userDao.updateResetOtp(
                email,
                otp,
                expiry
        );

        return EmailUtil.sendOtp(
                email,
                otp
        );
    }

    @Override
    public boolean verifyResetOtp(
            String email,
            String otp) {

        User user = userDao.getByEmail(email);

        if (user == null) {
            return false;
        }

        if (user.getResetOtp() == null) {
            return false;
        }

        if (!user.getResetOtp().equals(otp)) {
            return false;
        }

        if (user.getResetOtpExpiry() == null) {
            return false;
        }

        if (LocalDateTime.now()
                .isAfter(user.getResetOtpExpiry())) {

            return false;
        }

        return true;
    }

    @Override
    public void resetPassword(
            String email,
            String newPassword) {

        userDao.updatePassword(
                email,
                newPassword
        );
    }

    private String generateOtp() {

        Random random = new Random();

        int number =
                100000 + random.nextInt(900000);

        return String.valueOf(number);
    }
}