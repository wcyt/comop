package daofactory;

import dao.AbstractDaoFactory;
import dao.admin.ColorManagementDAO;
import dao.admin.MySQLColorManagementDAO;
import dao.admin.MySQLPointProductManagementDAO;
import dao.admin.MySQLStockDAO;
import dao.admin.MySQLUserManagementDAO;
import dao.admin.PointProductManagementDAO;
import dao.admin.ProductManagementDAO;
import dao.admin.StockDAO;
import dao.admin.UserManagementDAO;
import dao.cart.CartDAO;
import dao.cart.MySQLCartDAO;
import dao.favorite.FavoriteDAO;
import dao.favorite.MySQLFavoriteDAO;
import dao.order.MySQLOrderDAO;
import dao.order.MySQLPointOrderDAO;
import dao.order.OrderDAO;
import dao.order.PointOrderDAO;
import dao.product.MySQLProductDAO;
import dao.product.ProductDAO;
import dao.user.MySQLUserDAO;
import dao.user.UserDAO;

public class MySQLDaoFactory extends AbstractDaoFactory {

	@Override
	public ColorManagementDAO getColorManagementDAO() {
		return  new MySQLColorManagementDAO();
	}
	@Override
	public UserManagementDAO getUserManagementDAO() {
		return new MySQLUserManagementDAO();
	}
	@Override
	public ProductManagementDAO getProductManagementDAO() {
		return MySQLProductManagementDAO();
	}

	@Override
	public PointProductManagementDAO getPointProductManagementDAO() {
		return new MySQLPointProductManagementDAO();
	}

	@Override
	public StockDAO getStockDAO() {
		return new MySQLStockDAO();
	}

	@Override
	public FavoriteDAO getFavoriteDAO() {
		return new MySQLFavoriteDAO();
	}

	@Override
	public CartDAO getCartDAO() {
		return new MySQLCartDAO();
	}

	@Override
	public ProductDAO getProductDAO() {
		return new MySQLProductDAO();
	}

	@Override
	public PointProductManagementDAO getPointProductDAO() {
		return new MySQLPointProductManagementDAO();
	}

	@Override
	public UserDAO getUserDAO() {
		return new MySQLUserDAO();
	}

	@Override
	public OrderDAO getOrderDAO() {
		return new MySQLOrderDAO();
	}

	@Override
	public PointOrderDAO getPointOrderDAO() {
		return new MySQLPointOrderDAO();
	}

}
