package daofactory;

import java.io.InputStream;
import java.util.Properties;

import command.CommandFactory;
import dao.admin.ColorManagementDAO;
import dao.admin.PointProductManagementDAO;
import dao.admin.ProductManagementDAO;
import dao.admin.StockDAO;
import dao.admin.UserManagementDAO;
import dao.cart.CartDAO;
import dao.favorite.FavoriteDAO;
import dao.order.OrderDAO;
import dao.order.PointOrderDAO;
import dao.product.PointProductDAO;
import dao.product.ProductDAO;
import dao.user.UserDAO;

public abstract class AbstractDaoFactory {
	public static AbstractDaoFactory getFactory() {
		AbstractDaoFactory factory = null;
		Properties properties = new Properties();

		try {
			InputStream file = CommandFactory.class.getClassLoader().getResourceAsStream("dao.properties");

			properties.load(file);

			String name = properties.getProperty("dao");
			System.out.println("AbstractDaoFactory:" + name);
			Class c = Class.forName(name);
			factory = (AbstractDaoFactory)c.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return factory;
	}

	public abstract ColorManagementDAO getColorManagementDAO();
	public abstract ProductManagementDAO getProductManagementDAO();
	public abstract PointProductManagementDAO getPointProductManagementDAO();
	public abstract StockDAO getStockDAO();
	public abstract UserManagementDAO getUserManagementDAO();

	public abstract CartDAO getCartDAO();
	public abstract FavoriteDAO getFavoriteDAO();
	public abstract OrderDAO getOrderDAO();
	public abstract PointOrderDAO getPointOrderDAO();
	public abstract ProductDAO getProductDAO();
	public abstract PointProductDAO getPointProductDAO();
	public abstract UserDAO getUserDAO();
}