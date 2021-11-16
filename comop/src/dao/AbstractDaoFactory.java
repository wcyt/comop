package dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import tera.CommandFactory;


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
	public abstract ProductsDao getProductsDao();
}