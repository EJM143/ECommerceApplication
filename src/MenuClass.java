package src;

import java.sql.*;
import java.util.Scanner;

public class MenuClass {

    private Scanner reader;
    private DBConnectionControl connectionControl;

    public MenuClass() {
        this.reader = new Scanner(System.in);
        this.connectionControl = new DBConnectionControl();
    }

    private void mainMenu() {
        try (Connection connection = connectionControl.getConnection()) {
            while (true) {
                showMenuOptions();
                int choice = readChoice();

                ProductControl pc = new ProductControl();

                switch (choice) {
                    case 1:
                        createProduct(connection);
                        break;
                    case 2:
                        updateProduct(connection);
                        break;
                    case 3:
                        deleteProduct(connection);
                        break;
                    case 4:
                        ProductControl.listProducts(connection);
                        break;
                    case 5:
                        ProductControl.totalProductsSold(connection, "2024-01-01", "2024-06-08");
                        break;
                    case 6:
                        ProductControl.mostPopularProducts(connection, "2024-01-01", "2024-06-08");
                        break;
                    case 7:
                        leastPopularProducts(connection, "2024-01-01", "2024-06-08");
                        break;
                    case 8:
                        ProductControl.listUsersWhoHaveNotPurchased(connection);
                        break;
                    case 9:
                        exit();
                        break;
                    default:
                        System.out.println("Invalid choice. Please try again.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void start() {
        System.out.println();
        System.out.println("********************************************************");
        System.out.println("Welcome to Seattle Spoiled & Sassy Pet Supplies");
        System.out.println("          Product Management System!           ");
        mainMenu();
    }
    private void showMenuOptions() {
        System.out.println("********************************************************");
        System.out.println("1. Create Product");
        System.out.println("2. Modify Product");
        System.out.println("3. Delete Product");
        System.out.println("4. List All Products");
        System.out.println("5. List Sold Products");
        System.out.println("6. List of Most Popular Products");
        System.out.println("7. List of Least Popular Products");
        System.out.println("8. List Users Who Have Not Purchased Recently");
        System.out.println("9. Exit");
        System.out.println("********************************************************");

    }

    private int readChoice() {
        System.out.print("Enter your choice: ");
        int choice = reader.nextInt();
        // Consume the newline character
        reader.nextLine();
        return choice;
    }

    private void createProduct(Connection connection) {
        // Gather product details from user input
        System.out.println("** Enter product details **");
        System.out.print("Product Name: ");
        String productName = reader.nextLine();
        System.out.print("Animal: ");
        String animal = reader.nextLine();
        System.out.print("Description: ");
        String description = reader.nextLine();
        System.out.print("Price: ");
        double price = reader.nextDouble();
        reader.nextLine();

        System.out.println("Creating Product with Name: " + productName + ", Animal: " + animal + ", Description: " + description + ", Price: " + price);

        // Create a Product object with the gathered details
        Product product = new Product(productName, animal, description, price);

        // Call the createProduct method from ProductControl class
        ProductControl.createProduct(connection, product);
    }

    private void updateProduct(Connection connection) {
        // Gather product details from user input
        System.out.println("** Enter product details to update **");
        System.out.print("Please enter the SKU of the product to update: ");
        int sku = reader.nextInt();
        System.out.print("New Price: ");
        double newPrice = reader.nextDouble();


        // Call the updateProduct method from ProductControl class
        ProductControl.updateProduct(connection, sku, newPrice);
    }

    private void deleteProduct(Connection connection) {
        // Gather product details from user input
        System.out.println("** Enter product details to delete **");
        System.out.print("Enter the SKU of the product to delete: ");
        int sku = reader.nextInt();
        reader.nextLine();

        // Call the deleteProduct method from ProductControl class
        ProductControl.deleteProduct(connection, sku);
    }

    private void leastPopularProducts(Connection connection, String startDate, String endDate) {
        // Call the leastPopularProducts method from ProductControl class
        ProductControl.leastPopularProducts(connection, startDate, endDate);
    }

    private void exit() {
        // Exit the program
        System.exit(0);
    }
}
