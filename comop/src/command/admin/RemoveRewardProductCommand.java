package command.admin;

import java.util.List;

import bean.PointRewardBean;
import command.AbstractCommand;
import dao.Connector;
import dao.admin.PointProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RemoveRewardProductCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		//パラメータを取得
		String reward_product_id = rc.getParameter("reward_product_id")[0];

		Connector.getInstance().beginTransaction();

		//ポイント商品の削除
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductManagementDAO pmd = factory.getPointProductManagementDAO();
		pmd.removeRewardProduct(reward_product_id);

		List<PointRewardBean> pointRewardList = pmd.getRewardProductsList();
		resc.setResult(pointRewardList);

		Connector.getInstance().commit();

		//getRewardProductsList.jspに移動
		resc.setTarget("rewardProductManagement");

		return resc;
	}
}









