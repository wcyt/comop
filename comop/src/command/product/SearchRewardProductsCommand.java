package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.product.PointProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class SearchRewardProductsCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();
		String key = rc.getParameter("key")[0];

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductDAO pdao = factory.getPointProductDAO();

		List ppsearch =  pdao.searchRewardProducts(key);
		resc.setResult(ppsearch);
		resc.setTarget("rewardProductsList");

		return resc;
	}
}

