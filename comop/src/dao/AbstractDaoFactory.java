package dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;


public abstract class AbstractDaoFactory {
	public static AbstractDaoFactory getFactory() {
		// nameによって異なるConcreteFactoryを返す
		AbstractDaoFactory factory= null;
		Properties prop = new Properties();

		try {
			// プロパティファイルを読み込む
			prop.load(new FileInputStream("c:/j2ee4.1/dao.properties"));

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