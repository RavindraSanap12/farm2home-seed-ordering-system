package com.DAO;

import com.entity.ProductDetails;
import java.util.List;

public interface ProductDAO {

    public boolean addProducts(ProductDetails b);

    public List<ProductDetails> getAllProducts();

    public ProductDetails getProductById(int id);

    public boolean updateEditProducts(ProductDetails b);

    public boolean deleteProducts(int id);

    public List<ProductDetails> getNewProduct();

    public List<ProductDetails> getRecentProduct();

    public List<ProductDetails> getOldProduct();

    public List<ProductDetails> getAllRecentProduct();

    public List<ProductDetails> getAllNewProduct();

    public List<ProductDetails> getAllOldProduct();

}
