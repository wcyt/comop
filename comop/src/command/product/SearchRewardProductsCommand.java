package command.product;

import java.util.List;

import bean.PointRewardBean;
import command.AbstractCommand;
import dao.product.PointProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class SearchRewardProductsCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		//検索ワードを取得
		String key = rc.getParameter("key")[0];

		//検索結果を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductDAO pdao = factory.getPointProductDAO();
		List<PointRewardBean> ppsearch =  pdao.searchRewardProducts(key);
		resc.setResult(ppsearch);

		//rewardProductsList.jspに移動
		resc.setTarget("rewardProductsList");

		return resc;
	}
}

