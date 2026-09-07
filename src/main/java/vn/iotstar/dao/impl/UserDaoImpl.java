package vn.iotstar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import vn.iotstar.connection.DBConnection;
import vn.iotstar.dao.UserDao;
import vn.iotstar.model.User;

public class UserDaoImpl extends DBConnection implements UserDao {

    @Override
    public void insert(User user) {

        String sql = "INSERT INTO Users "
                + "(full_name, email, password_hash, active, "
                + "activation_otp, activation_otp_expiry) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPasswordHash());
            ps.setBoolean(4, user.isActive());
            ps.setString(5, user.getActivationOtp());

            if (user.getActivationOtpExpiry() != null) {

                ps.setTimestamp(
                        6,
                        Timestamp.valueOf(
                                user.getActivationOtpExpiry()
                        )
                );

            } else {

                ps.setTimestamp(6, null);
            }

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    @Override
    public User getByEmail(String email) {

        String sql =
                "SELECT * FROM Users WHERE email = ?";

        try {

            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setUserId(
                        rs.getInt("user_id")
                );

                user.setFullName(
                        rs.getString("full_name")
                );

                user.setEmail(
                        rs.getString("email")
                );

                user.setPasswordHash(
                        rs.getString("password_hash")
                );

                user.setActive(
                        rs.getBoolean("active")
                );

                user.setActivationOtp(
                        rs.getString("activation_otp")
                );

                if (rs.getTimestamp(
                        "activation_otp_expiry"
                ) != null) {

                    user.setActivationOtpExpiry(
                            rs.getTimestamp(
                                    "activation_otp_expiry"
                            ).toLocalDateTime()
                    );
                }

                user.setResetOtp(
                        rs.getString("reset_otp")
                );

                if (rs.getTimestamp(
                        "reset_otp_expiry"
                ) != null) {

                    user.setResetOtpExpiry(
                            rs.getTimestamp(
                                    "reset_otp_expiry"
                            ).toLocalDateTime()
                    );
                }

                if (rs.getTimestamp(
                        "created_at"
                ) != null) {

                    user.setCreatedAt(
                            rs.getTimestamp(
                                    "created_at"
                            ).toLocalDateTime()
                    );
                }

                rs.close();
                ps.close();
                con.close();

                return user;
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean checkEmailExist(String email) {

        String sql =
                "SELECT user_id FROM Users WHERE email = ?";

        try {

            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            boolean exist = rs.next();

            rs.close();
            ps.close();
            con.close();

            return exist;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public void activateAccount(String email) {

        String sql =
                "UPDATE Users "
                + "SET active = 1, "
                + "activation_otp = NULL, "
                + "activation_otp_expiry = NULL "
                + "WHERE email = ?";

        try {

            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    @Override
    public void updateResetOtp(
            String email,
            String otp,
            LocalDateTime expiry) {

        String sql =
                "UPDATE Users "
                + "SET reset_otp = ?, "
                + "reset_otp_expiry = ? "
                + "WHERE email = ?";

        try {

            Connection con = super.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, otp);

            ps.setTimestamp(
                    2,
                    Timestamp.valueOf(expiry)
            );

            ps.setString(3, email);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    @Override
    public void updatePassword(
            String email,
            String newPassword) {

        String sql =
                "UPDATE Users "
                + "SET password_hash = ?, "
                + "reset_otp = NULL, "
                + "reset_otp_expiry = NULL "
                + "WHERE email = ?";

        try {

            Connection con = super.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, newPassword);
            ps.setString(2, email);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}