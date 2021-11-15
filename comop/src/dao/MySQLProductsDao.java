package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tera.Product;

public class MySQLProductsDao implements ProductsDao {
	@Override
	public void addProduct(Product p) {
		Connection cn = null;
		PreparedStatement st = null;

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nozawa?characterEncoding=UTF-8&serverTimezone=JST", "infox", "prox");
			cn.setAutoCommit(false);

			String sql = "insert into t_products values(?,?,?)";
			st = cn.prepareStatement(sql);

			st.setString(1, p.getPid());
			st.setString(2, p.getName());
			st.setString(3, p.getPrice());

			st.executeUpdate();

			cn.commit();
		}catch (ClassNotFoundException e) {
		}catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			} finally {
				try {
					if (cn != null) {
						cn.close();
					}
				} catch (SQLException e3) {
					e3.printStackTrace();
				}
			}
		}
	}

	@Override
	public Product getProduct(String pid) {
		return null;
	}

	@Override
	public List<Product> getAllProducts() {
		Connection cn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		List<Product> products = new ArrayList<Product>();

		try {
			cn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/nozawa?characterEncoding=UTF-8&serverTimezone=JST", "infox", "prox");

			cn.setAutoCommit(false);

			String sql = "SELECT pid, name, price FROM t_products";
			st = cn.prepareStatement(sql);

			rs = st.executeQuery();

			while (rs.next()) {
				Product product = new Product();

				product.setPid(rs.getString(1));
				product.setName(rs.getString(2));
				product.setPrice(rs.getString(3));

				products.add(product);
			}
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			} finally {
				try {
					if (cn != null) {
						cn.close();
					}
				} catch (SQLException e3) {
					e3.printStackTrace();
				}
			}
		}
		return products;
	}
}
