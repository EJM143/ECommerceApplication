package src;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        try {
            Connection connection = DBConnectionControl.getConnection();

            MenuClass menu = new MenuClass();
            menu.start();

            // Close the connection when the program exits
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}