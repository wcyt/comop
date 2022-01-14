package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.Connector;
import dao.product.PointProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetRewardProductsListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductDAO ppdao = factory.getPointProductDAO();
		List pointlist = ppdao.getRewardProductsList();
		resc.setResult(pointlist);

		//トランザクションを終了する
		Connector.getInstance().commit();

		resc.setTarget("rewardProductsList");

		return resc;
	}
}
