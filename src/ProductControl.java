package src;

import java.sql.*;

public class ProductControl {

    public static void listProducts(Connection connection) {
        try {
            Statement statement = connection.createStatement();
            String query = "SELECT * FROM PRODUCT";
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                int sku = resultSet.getInt("SKU");
                String productName = resultSet.getString("ProductName");
                String animal = resultSet.getString("Animal");
                String description = resultSet.getString("Description");
                double price = resultSet.getDouble("Price");

                System.out.println("SKU: " + sku);
                System.out.println("Product Name: " + productName);
                System.out.println("Animal: " + animal);
                System.out.println("Description: " + description);
                System.out.println("Price: " + price);
                System.out.println("------------");
            }

            resultSet.close();
            statement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void createProduct(Connection connection, Product product) {
        try {
            String sql = "INSERT INTO PRODUCT (ProductName, Animal, Description, Price) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setString(2, product.getAnimal());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setDouble(4, product.getPrice());

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("A new product was inserted successfully!");
            }

            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateProduct(Connection connection, int sku, Double newAmount) {
        try {
            // Check if connection is closed
            if (connection.isClosed()) {
                System.out.println("Connection is closed. Cannot perform update operation.");
                return; // Exit method if connection is closed
            }

            // Prepare SQL statement to retrieve the SKU
            String selectSql = "SELECT SKU FROM PRODUCT WHERE SKU = ?";
            PreparedStatement selectStatement = connection.prepareStatement(selectSql);
            selectStatement.setInt(1, sku);

            ResultSet resultSet = selectStatement.executeQuery();

            if (resultSet.next()) {
                // SKU found, proceed with update
                String updateSql = "UPDATE PRODUCT SET Price = ? WHERE SKU = ?";
                PreparedStatement updateStatement = connection.prepareStatement(updateSql);

                updateStatement.setDouble(1, newAmount);
                updateStatement.setInt(2, sku);

                int rowsUpdated = updateStatement.executeUpdate();

                if (rowsUpdated > 0) {
                    System.out.println("The product price was updated successfully!");
                } else {
                    System.out.println("Failed to update product price. No matching SKU found.");
                }

                updateStatement.close();
            } else {
                // SKU not found
                System.out.println("Product with SKU " + sku + " not found.");
            }

            resultSet.close();
            selectStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteProduct(Connection connection, int sku) {
        try {
            // Disable auto-commit to handle transactions
            connection.setAutoCommit(false);

            // Delete inventory records associated with the product
            deleteInventory(connection, sku);

            // Delete the product
            String sql = "DELETE FROM PRODUCT WHERE SKU = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, sku);

                int rowsDeleted = preparedStatement.executeUpdate();

                if (rowsDeleted > 0) {
                    System.out.println("The product was deleted from the inventory successfully!");
                } else {
                    System.out.println("No product found with the given SKU.");
                }

                // Commit the transaction
                connection.commit();
            }
        } catch (SQLException e) {
            try {
                // Rollback the transaction in case of any exception
                connection.rollback();
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
            e.printStackTrace();
        }
    }
    // Method to delete inventory records associated with a product
    public static void deleteInventory(Connection connection, int sku) throws SQLException {
        String sql = "DELETE FROM INVENTORY WHERE SKU = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, sku);
            statement.executeUpdate();
            System.out.println("Inventory records deleted successfully for product SKU: " + sku);
        } catch (SQLException e) {
            System.err.println("Error deleting inventory records: " + e.getMessage());
            throw e; //
        }
    }
    public static void leastPopularProducts(Connection connection, String startDate, String endDate) {
        try {
            // Define the SQL query to get the least popular products in a given time range
            String sql = "SELECT p.ProductName, COUNT(oi.SKU) AS OrderCount " +
                    "FROM PRODUCT p " +
                    "LEFT JOIN ORDER_ITEM oi ON p.SKU = oi.SKU " +
                    "LEFT JOIN ORDER_HISTORY o ON oi.OrderID = o.OrderID AND o.OrderDate BETWEEN ? AND ? " +
                    "GROUP BY p.ProductName " +
                    "ORDER BY OrderCount ASC";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            // Set the start and end dates for the time range
            preparedStatement.setDate(1, java.sql.Date.valueOf(startDate)); // Start date
            preparedStatement.setDate(2, java.sql.Date.valueOf(endDate)); // End date

            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Process the result set
            System.out.println("** Least Popular Products **");
            while (resultSet.next()) {
                String productName = resultSet.getString("ProductName");
                int orderCount = resultSet.getInt("OrderCount");

                // Print the results
                System.out.println("Product: " + productName + " | Orders: " + orderCount);
            }

            // Close the result set, statement, and connection
            resultSet.close();
            preparedStatement.close();
            //connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void mostPopularProducts(Connection connection, String startDate, String endDate) {
        try {
            // Define the SQL query to get the least popular products in a given time range
            String sql = "SELECT p.ProductName, SUM(oi.QuantityPerProduct) AS TotalSold " +
                    "FROM ORDER_ITEM oi " +
                    "JOIN PRODUCT p ON oi.SKU = p.SKU " +
                    "JOIN ORDER_HISTORY oh ON oi.OrderID = oh.OrderID " +
                    "WHERE oh.OrderDate BETWEEN '1024-01-01' AND '2024-06-08' " +
                    "GROUP BY oi.SKU " +
                    "ORDER BY TotalSold DESC " +
                    "LIMIT 2;";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            System.out.println("** Most Popular Products **");
            while (resultSet.next()) {
                String productName = resultSet.getString("ProductName");
                int totalSold = resultSet.getInt("TotalSold");
                System.out.println("Product: " + productName + ", Total Sold: " + totalSold);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void totalProductsSold(Connection connection, String startDate, String endDate) {
        try {
            // Define the SQL query to get the total products sold within the given date range
            String sql = "SELECT COUNT(TotalQuantity) AS TotalProductsSold " +
                    "FROM ORDER_ITEM oi " +
                    "JOIN ORDER_HISTORY o ON " +
                    "oi.OrderID = o.OrderID " +
                    "WHERE o.OrderDate BETWEEN ? AND ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            // Set the start and end dates for the time range
            preparedStatement.setDate(1, java.sql.Date.valueOf(startDate)); // Start date
            preparedStatement.setDate(2, java.sql.Date.valueOf(endDate)); // End date

            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Process the result set
            if (resultSet.next()) {
                int totalProductsSold = resultSet.getInt("TotalProductsSold");

                // Print the total products sold
                System.out.println("Total Products Sold from 2024-01-01 to 2024-06-08: " + totalProductsSold);
            }

            // Close the result set, statement, and connection
            resultSet.close();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void listUsersWhoHaveNotPurchased(Connection connection) {
        try {
            // Define the SQL query to get users who have not made a purchase in the last few months and the products they normally purchase
            String sql = "SELECT UserID, FullName, Email " +
                    "FROM USERS " +
                    "WHERE UserID NOT IN (" +
                    "SELECT DISTINCT UserID " +
                    "FROM ORDER_HISTORY " +
                    "WHERE OrderDate >= DATE_SUB(NOW(), INTERVAL 1 MONTH))";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Process the result set
            System.out.println("** Inactive Users and Products They Normally Purchase **");
            while (resultSet.next()) {
                int userId = resultSet.getInt("UserID");
                String fullName = resultSet.getString("FullName");
                String email = resultSet.getString("Email");

                // Print the results
                System.out.println("UserID: " + userId + " | Name: " + fullName + " | Email: " + email);
            }

            // Close the result set, statement, and connection
            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Ensure the connection is closed in case of an exception
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}