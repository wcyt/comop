package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.ResponseContext;

class SortProductsCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO pdao = factory.getProductDAO();
		List pricesort = pdao.sortProducts();

		resc.setResult(pricesort);
		resc.setTarget("productsList");

		return resc;
	}
}
