package com.DAO;

import com.entity.ProductDetails;
import java.sql.ResultSet;
import java.sql.Connection; // Import java.sql.Connection instead of jakarta.jms.Connection
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOimpl implements ProductDAO {

    private Connection conn;

    public ProductDAOimpl(Connection conn) {
        this.conn = conn;
    }

    public boolean addProducts(ProductDetails b) {
        boolean f = false;

        try {
            String sql = "INSERT INTO product_details (productname, farmername, price, category, status, photo, user_email) VALUES (?,?,?,?,?,?,?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, b.getProductname());
                ps.setString(2, b.getFarmername());
                ps.setString(3, b.getPrice());
                ps.setString(4, b.getCategory());
                ps.setString(5, b.getStatus());
                ps.setString(6, b.getPhoto());
                ps.setString(7, b.getUser_email());

                int i = ps.executeUpdate();

                if (i == 1) {
                    f = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<ProductDetails> getAllProducts() {

        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails b = null;

        try {
            String sql = "select * from product_details";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            {
                while (rs.next()) {
                    b = new ProductDetails();
                    b.setId(rs.getInt(1));
                    b.setProductname(rs.getString(2));
                    b.setFarmername(rs.getString(3));
                    b.setPrice(rs.getString(4));
                    b.setCategory(rs.getString(5));
                    b.setStatus(rs.getString(6));
                    b.setPhoto(rs.getString(7));
                    b.setUser_email(rs.getString(8));
                    list.add(b);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ProductDetails getProductById(int id) {
        ProductDetails b = null;
        try {
            String sql = "select * from product_details where id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new ProductDetails();
                b.setId(rs.getInt(1));
                b.setProductname(rs.getString(2));
                b.setFarmername(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUser_email(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;
    }

    public boolean updateEditProducts(ProductDetails b) {
        boolean f = false;
        try {
            String sql = "update product_details set productname = ?, farmername = ?, price = ?, status = ? where id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getProductname());
            ps.setString(2, b.getFarmername());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getId());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteProducts(int id) {
        boolean f = false;
        try {
            String sql = "delete from product_details where id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<ProductDetails> getNewProduct() {

        List<ProductDetails> list = new ArrayList<ProductDetails>();

        ProductDetails b = null;
        try {

            String sql = "select * from product_details where category = ? and status = ? order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 4) {
                b = new ProductDetails();
                b.setId(rs.getInt(1));
                b.setProductname(rs.getString(2));
                b.setFarmername(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUser_email(rs.getString(8));
                list.add(b);
                i++;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<ProductDetails> getRecentProduct() {

        List<ProductDetails> list = new ArrayList<ProductDetails>();

        ProductDetails b = null;
        try {
            String sql = "select * from product_details where status = ? order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 4) {
                b = new ProductDetails();
                b.setId(rs.getInt(1));
                b.setProductname(rs.getString(2));
                b.setFarmername(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUser_email(rs.getString(8));
                list.add(b);
                i++;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<ProductDetails> getOldProduct() {

        List<ProductDetails> list = new ArrayList<ProductDetails>();

        ProductDetails b = null;
        try {

            String sql = "select * from product_details where category = ? and status = ? order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 4) {
                b = new ProductDetails();
                b.setId(rs.getInt(1));
                b.setProductname(rs.getString(2));
                b.setFarmername(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUser_email(rs.getString(8));
                list.add(b);
                i++;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<ProductDetails> getAllNewProduct()
    {
        List<ProductDetails> list = new ArrayList<ProductDetails>();

        ProductDetails b = null;
        try {

            String sql = "select * from product_details where category = ? and status = ? order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            
            while (rs.next())
            {
                b = new ProductDetails();
                b.setId(rs.getInt(1));
                b.setProductname(rs.getString(2));
                b.setFarmername(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUser_email(rs.getString(8));
                list.add(b);
                

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<ProductDetails> getAllOldProduct()
    {
         List<ProductDetails> list = new ArrayList<ProductDetails>();

        ProductDetails b = null;
        try {

            String sql = "select * from product_details where category = ? and status = ? order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new ProductDetails();
                b.setId(rs.getInt(1));
                b.setProductname(rs.getString(2));
                b.setFarmername(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUser_email(rs.getString(8));
                list.add(b);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<ProductDetails> getAllRecentProduct()
    {
        
        List<ProductDetails> list = new ArrayList<ProductDetails>();

        ProductDetails b = null;
        try {
            String sql = "select * from product_details where status = ? order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new ProductDetails();
                b.setId(rs.getInt(1));
                b.setProductname(rs.getString(2));
                b.setFarmername(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUser_email(rs.getString(8));
                list.add(b);
             

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
