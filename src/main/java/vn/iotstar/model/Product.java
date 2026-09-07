package vn.iotstar.model;

import java.time.LocalDateTime;

public class Product {

    private int productId;
    private String productName;
    private String images;
    private double price;
    private String description;
    private int cateId;
    private LocalDateTime createdAt;

    public Product() {
    }

    public Product(int productId, String productName, String images,
            double price, String description, int cateId,
            LocalDateTime createdAt) {

        this.productId = productId;
        this.productName = productName;
        this.images = images;
        this.price = price;
        this.description = description;
        this.cateId = cateId;
        this.createdAt = createdAt;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}