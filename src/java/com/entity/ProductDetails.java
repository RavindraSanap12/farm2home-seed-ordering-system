    
package com.entity;

public class ProductDetails {
    private int id;
    private String productname;
    private String farmername;
    private String price;
    private String category;
    private String status;
    private String photo;
    private String user_email;
    
    public ProductDetails()
    {
        super();
    }
    
    public ProductDetails(String productname, String farmername, String price, String category, String status, String photo, String user_email)
    {
        super();
        this.productname = productname;
        this.farmername = farmername;
        this.price = price;
        this.category = category;
        this.status = status;
        this.status = status;
        this.photo = photo;
        this.user_email = user_email;
        
        
        
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getFarmername() {
        return farmername;
    }

    public void setFarmername(String farmername) {
        this.farmername = farmername;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    @Override
    public String toString() {
        return "ProductDetails{" + "id=" + id + ", productname=" + productname + ", farmername=" + farmername + ", price=" + price + ", category=" + category + ", status=" + status + ", photo=" + photo + ", user_email=" + user_email + '}';
    }
    
}
