package src;

public class Product {
    private String productName;
    private String animal;
    private String description;
    private Double price;

    public Product(String productName, String animal, String description, Double price) {
        this.productName = productName;
        this.animal = animal;
        this.description = description;
        this.price = price;
    }
    public String getProductName() {

        return productName;
    }
    public String getAnimal() {

        return animal;
    }
    public String getDescription() {
        return description;
    }
    public Double getPrice() {
        return price;
    }
}