package iuh.fit.se.testgk.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL  = "jdbc:mariadb://localhost:3306/amnhac";
    private static final String USER = "root";
    private static final String PASS = "1234";

    static {
        try { Class.forName("org.mariadb.jdbc.Driver"); }  // ĐÚNG
        catch (ClassNotFoundException e) { throw new RuntimeException(e); }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}

