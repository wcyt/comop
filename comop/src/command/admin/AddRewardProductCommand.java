package command.admin;

import bean.PointRewardBean;
import command.AbstractCommand;
import dao.admin.PointProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class AddRewardProductCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqs = getRequestContext();

		// パラメータの取得
		String reward_product_name = reqs.getParameter("reward_product_name")[0];
		String reward_product_image = reqs.getParameter("reward_product_image")[0];
		String reward_product_description = reqs.getParameter("reward_product_description")[0];
		String stock_quantity = reqs.getParameter("stock_quantity")[0];
		String point_price = reqs.getParameter("point_price")[0];

		// Beanにセット
		PointRewardBean prb = new PointRewardBean();
		prb.setReward_product_name(reward_product_name);
		prb.setReward_product_image(reward_product_image);
		prb.setStock_quantity(Integer.parseInt(stock_quantity));
		prb.setReward_product_description(reward_product_description);
		prb.setPoint_price(Integer.parseInt(point_price));

		// DBに追加
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductManagementDAO pointProductManagementDAO = factory.getPointProductManagementDAO();
		pointProductManagementDAO.addRewardProduct(prb);

		// ポイント商品一覧を取得
		GetRewardProductsListCommand getRewardProductsListCommand = new GetRewardProductsListCommand();
		getRewardProductsListCommand.execute(resc);

		// productManagement.jspに移動
		resc.setTarget("rewardProductManagement");

		return resc;
	}
}
