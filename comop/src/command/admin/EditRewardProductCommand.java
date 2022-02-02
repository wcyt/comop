package command.admin;

import java.util.List;

import bean.PointRewardBean;
import command.AbstractCommand;
import dao.Connector;
import dao.admin.PointProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class EditRewardProductCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//パラメータを取得
		String reward_product_id = reqc.getParameter("reward_product_id")[0];
		String reward_product_name = reqc.getParameter("reward_product_name")[0];
		String reward_product_image = reqc.getParameter("reward_product_image")[0];
		String stock_quantity = reqc.getParameter("stock_quantity")[0];
		String reward_product_description = reqc.getParameter("reward_product_description")[0];
		String point_price = reqc.getParameter("point_price")[0];

		//Beanにセット
		PointRewardBean prb = new PointRewardBean();
		prb.setReward_product_id(Integer.parseInt(reward_product_id));
		prb.setReward_product_name(reward_product_name);
		prb.setReward_product_image(reward_product_image);
		prb.setStock_quantity(Integer.parseInt(stock_quantity));
		prb.setReward_product_description(reward_product_description);
		prb.setPoint_price(Integer.parseInt(point_price));

		Connector.getInstance().beginTransaction();

		//ポイント商品情報の変更
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductManagementDAO msppm = factory.getPointProductManagementDAO();
		msppm.editRewardProduct(prb);

		List<PointRewardBean> pointRewardList = msppm.getRewardProductsList();
		resc.setResult(pointRewardList);

		Connector.getInstance().commit();

		//productManagement.jspに移動
		resc.setTarget("rewardProductManagement");

		return resc;
	}
}















