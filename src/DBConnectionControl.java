package src;
import java.sql.*;
public class DBConnectionControl {

    public static Connection getConnection() throws SQLException {
        // Use connection string "jdbc:sqlite::memory:"
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSS_Pet_Supplies" +
                    "?user=root&password=Lotus1109!");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return connection;
    }
}
