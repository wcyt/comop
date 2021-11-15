package tera;

import java.util.ArrayList;
import java.util.List;

import dao.MySQLProductsDao;

class GetProductsCommand extends AbstractCommand {
	public WebResponseContext execute(ResponseContext responseContext) {
		System.out.println("-- GetProductsCommand -- ");
		List<Product> products = new ArrayList<Product>();
		MySQLProductsDao mySQLProductsDao = new MySQLProductsDao();
		products = mySQLProductsDao.getAllProducts();

		WebResponseContext webResponseContext = new WebResponseContext();
		webResponseContext.setResult(products);

		for (Product product : products) {
				System.out.println("Name: " + product.getName() + " Price: " + product.getPrice());
		}

		System.out.println("-- GetProductsCommand -- ");

		webResponseContext.setTarget("view");
		return webResponseContext;
	}
}

//
//ArrayList<Product> products = new ArrayList<Product>();
//products = DbDummy.getDatabase();
//setResult(products);
//
//for (Product product : products) {
//	System.out.println("Name: " + product.getName() + " Price: " + product.getPrice());
//}
//

//
