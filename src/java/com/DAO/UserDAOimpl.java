package com.DAO;

import com.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOimpl implements UserDAO {

    private Connection conn;

    public UserDAOimpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean userRegister(User us) {
        boolean f = false;
        try {
            String sql = "INSERT INTO user(name, email, phone_no, password) VALUES(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPh_no());
            ps.setString(4, us.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return the actual result of user registration
    }

    @Override
    public User login(String email, String password) {
        User us = null;
        try {
            String sql = "SELECT * FROM user WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt("id"));
                us.setName(rs.getString("name"));
                us.setEmail(rs.getString("email"));
                us.setPh_no(rs.getString("phone_no"));
                us.setPassword(rs.getString("password"));
                us.setAddress(rs.getString("address"));
                us.setLandmark(rs.getString("landmark"));
                us.setCity(rs.getString("city"));
                us.setState(rs.getString("state"));
                us.setZip_code(rs.getString("zip_code"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }
}
