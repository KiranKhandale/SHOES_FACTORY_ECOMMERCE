package model.org;

import java.math.BigDecimal;
import java.util.Base64;

public class Product {

    private int id;
    private String productName; // Renamed to follow camelCase convention
    private String description;
    private String category;
    private BigDecimal price;
    private String status;
    private byte[] image;
    // Default constructor
    public Product() {
    }

    // Parameterized constructor (optional, for convenience)
    public Product(int id, String productName, String description, String category, BigDecimal price, String status, byte[] image)
    {
        this.id = id;
        this.productName = productName;
        this.description = description;
        this.category = category;
        this.price = price;
        this.status = status;
        this.image=image;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() { // Renamed to match camelCase convention
        return productName;
    }

    public void setProductName(String productName) { // Renamed to match camelCase convention
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    // covert to base64
    
    public String getBase64Image() {
        if (this.image != null) {
            return Base64.getEncoder().encodeToString(this.image);
        }
        return null;
    }
    
    
}
