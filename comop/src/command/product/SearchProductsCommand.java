package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class SearchProductsCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();
		String key = rc.getParameter("key")[0];

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO pdao = factory.getProductDAO();

		List psearch =  pdao.searchProducts(key);
		resc.setResult(psearch);
		resc.setTarget("productsList");

		return resc;
	}
}

