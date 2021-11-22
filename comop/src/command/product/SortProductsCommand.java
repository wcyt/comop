package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.product.ProductDAO;
import tera.ResponseContext;

class SortProductsCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO pdao = factory.getProductDAO();
		List pricesort = pdao.sortProducts();

		resc.setResult(pricesort);
		resc.setTarget("/WEB-INF/jsp/productsList.jsp");


		return resc;
	}
}
