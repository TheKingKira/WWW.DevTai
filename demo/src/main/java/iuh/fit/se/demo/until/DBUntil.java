package iuh.fit.se.demo.until;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUntil {
    private static final String URL = "jdbc:mariadb://localhost:3306/tai";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "1234";
    static {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {}
    }
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}
