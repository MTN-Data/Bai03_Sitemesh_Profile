package vn.iotstar.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private final String serverName = "localhost";
    private final String portNumber = "14330";
    private final String dbName = "ServletCRUDMVC";

    private final String userID = "sa";
    private final String password = "Aa@123456";

    public Connection getConnection() throws Exception {

        String url =
                "jdbc:sqlserver://" + serverName + ":" + portNumber
                + ";databaseName=" + dbName
                + ";encrypt=true"
                + ";trustServerCertificate=true";

        Class.forName(
                "com.microsoft.sqlserver.jdbc.SQLServerDriver"
        );

        return DriverManager.getConnection(
                url,
                userID,
                password
        );
    }

    public static void main(String[] args) {

        try {

            DBConnection db =
                    new DBConnection();

            Connection conn =
                    db.getConnection();

            if (conn != null) {

                System.out.println(
                        "KET NOI SQL THANH CONG"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}