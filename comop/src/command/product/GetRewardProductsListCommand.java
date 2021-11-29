package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.product.PointProductDAO;
import daofactory.AbstractDaoFactory;
import tera.ResponseContext;

public class GetRewardProductsListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductDAO ppdao = factory.getPointProductDAO();

		List pointlist = ppdao.getRewardProductsList();

		resc.setResult(pointlist);
		resc.setTarget("/WEB-INF/jsp/rewardProductsList.jsp");

		return resc;
	}
}


