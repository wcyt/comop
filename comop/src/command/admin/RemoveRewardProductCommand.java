package command.admin;

import command.AbstractCommand;
import dao.admin.PointProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RemoveRewardProductCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		//パラメータを取得
		String reProductId = rc.getParameter("reward_product_id")[0];


		//ポイント商品の削除
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductManagementDAO pmd = factory.getPointProductManagementDAO();
		System.out.println(reProductId + "削除作業中");
		pmd.removeRewardProduct(reProductId);

		//getRewardProductsList.jspに移動
		resc.setTarget("getRewardProductsList");

		return resc;
	}
}









