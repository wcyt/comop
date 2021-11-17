package dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import command.CommandFactory;
import dao.admin.*;
import dao.favorite.*;
import dao.cart.*;
import dao.product.*;
import dao.user.*;
import dao.order.*;


public abstract class AbstractDaoFactory {
	public static AbstractDaoFactory getFactory() {
		// nameによって異なるConcreteFactoryを返す
		AbstractDaoFactory factory= null;
		Properties prop = new Properties();

		try {
			// プロパティファイルを読み込む
			InputStream file = CommandFactory.class.getClassLoader().getResourceAsStream("dao.properties");
			prop.load(file);


			String name = prop.getProperty("dao");

			Class c = Class.forName(name);

			factory = (AbstractDaoFactory) c.newInstance();

		} catch (FileNotFoundException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		} catch (IOException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		} catch (ClassNotFoundException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		} catch (InstantiationException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		} catch (IllegalAccessException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		}
		return factory;
	}

	public abstract ColorManagementDAO getColorManagementDAO();
	public abstract UserManagementDAO getUserManagementDAO();
	public abstract ProductManagementDAO getProductManagementDAO();
	public abstract PointProductManagementDAO getPointProductManagementDAO();
	public abstract StockDAO getStockDAO();

	public abstract FavoriteDAO getFavoriteDAO();
	public abstract CartDAO getCartDAO();
	public abstract ProductDAO getProductDAO();
	public abstract PointProductDAO getPointProductDAO();
	public abstract UserDAO getUserDAOo();
	public abstract OrderDAO getOrderDAO();
	public abstract PointOrderDAO getPointOrderDAO();

}