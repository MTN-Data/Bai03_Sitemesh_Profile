package vn.iotstar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.connection.DBConnection;
import vn.iotstar.dao.ProductDao;
import vn.iotstar.model.Product;

public class ProductDaoImpl extends DBConnection implements ProductDao {

    @Override
    public void insert(Product product) {
        String sql = "INSERT INTO Products(product_name, images, price, description, cate_id) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {
            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getImages());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getCateId());

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Product product) {
        String sql = "UPDATE Products "
                   + "SET product_name = ?, images = ?, price = ?, description = ?, cate_id = ? "
                   + "WHERE product_id = ?";

        try {
            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getImages());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getCateId());
            ps.setInt(6, product.getProductId());

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM Products WHERE product_id = ?";

        try {
            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Product get(int id) {
        String sql = "SELECT * FROM Products WHERE product_id = ?";

        try {
            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Product product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setImages(rs.getString("images"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setCateId(rs.getInt("cate_id"));

                if (rs.getTimestamp("created_at") != null) {
                    product.setCreatedAt(
                        rs.getTimestamp("created_at").toLocalDateTime()
                    );
                }

                rs.close();
                ps.close();
                con.close();

                return product;
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Product> getAll() {
        List<Product> products = new ArrayList<Product>();

        String sql = "SELECT * FROM Products ORDER BY created_at DESC";

        try {
            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setImages(rs.getString("images"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setCateId(rs.getInt("cate_id"));

                if (rs.getTimestamp("created_at") != null) {
                    product.setCreatedAt(
                        rs.getTimestamp("created_at").toLocalDateTime()
                    );
                }

                products.add(product);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public List<Product> getByPage(int page, int pageSize) {
        List<Product> products = new ArrayList<Product>();

        String sql = "SELECT * FROM Products "
                   + "ORDER BY created_at DESC "
                   + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            int offset = (page - 1) * pageSize;

            ps.setInt(1, offset);
            ps.setInt(2, pageSize);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setImages(rs.getString("images"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setCateId(rs.getInt("cate_id"));

                if (rs.getTimestamp("created_at") != null) {
                    product.setCreatedAt(
                        rs.getTimestamp("created_at").toLocalDateTime()
                    );
                }

                products.add(product);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public int count() {
        String sql = "SELECT COUNT(*) FROM Products";

        try {
            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int total = rs.getInt(1);

                rs.close();
                ps.close();
                con.close();

                return total;
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public List<Product> getTop10Newest() {
        List<Product> products = new ArrayList<Product>();

        String sql = "SELECT TOP 10 * FROM Products ORDER BY created_at DESC";

        try {
            Connection con = super.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setImages(rs.getString("images"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setCateId(rs.getInt("cate_id"));

                if (rs.getTimestamp("created_at") != null) {
                    product.setCreatedAt(
                        rs.getTimestamp("created_at").toLocalDateTime()
                    );
                }

                products.add(product);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
}