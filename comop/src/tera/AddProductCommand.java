package tera;

import dao.AbstractDaoFactory;
import dao.ProductsDao;

public class AddProductCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext responseContext) {
		System.out.println("-- AddProductCommand --");

		RequestContext requestContext = getRequestContext();

		String[] pidArray = requestContext.getParameter("pid");
		String[] nameArray = requestContext.getParameter("name");
		String[] priceArray = requestContext.getParameter("price");

		String pid = String.join("", pidArray);
		String name = String.join("", nameArray);
		String price = String.join("", priceArray);

		System.out.println("AddProductCommand: " + pid);
		System.out.println("AddProductCommand: " + name);
		System.out.println("AddProductCommand: " + price);

		Product product = new Product();
		product.setPid(pid);
		product.setName(name);
		product.setPrice(price);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductsDao dao = factory.getProductsDao();
		dao.addProduct(product);

		System.out.println("-- AddProductCommand --");
		System.out.println("");

		responseContext.setTarget("start");
		return responseContext;


//		WebResponseContext webResponseContext = new WebResponseContext();
//		webResponseContext.setTarget("start");
//		return webResponseContext;
	}
}
//Map map = getParameters();
//String[] nameArray = (String[]) map.get("name");
//String[] priceArray = (String[]) map.get("price");
//
//String name = String.join("", nameArray);
//String price = String.join("", priceArray);
//
//System.out.println("AddProductCommand: " + name);
//System.out.println("AddProductCommand: " + price);
//
//Product product = new Product();
//product.setName(name);
//product.setPrice(price);
//
//DbDummy.addProduct(product);