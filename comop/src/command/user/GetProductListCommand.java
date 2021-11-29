package command.user;

import java.util.List;
import java.util.Map;

import command.AbstractCommand;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetProductListCommand  extends AbstractCommand {
	private Map parameters;

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		parameters = reqc.getParameterMap();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO pd = factory.getProductDAO();
		List productsList = pd.getProductsList(parameters);

		resc.setResult(productsList);
		resc.setTarget("productsList");

		return resc;
	}
}
