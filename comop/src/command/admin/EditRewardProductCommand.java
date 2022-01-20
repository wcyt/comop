package command.admin;

import bean.PointRewardBean;
import command.AbstractCommand;
import dao.admin.PointProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class EditRewardProductCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//パラメータを取得
		String[] reward_product_names = reqc.getParameter("reward_product_name");
		String[] reward_product_images = reqc.getParameter("reward_product_image");
		String[] stock_quantites = reqc.getParameter("stock_quantity");
		String[] reward_product_descriptions = reqc.getParameter("reward_product_decription");
		String[] point_prices = reqc.getParameter("point_price");


		String reward_product_name = reward_product_names[0];
		String reward_product_image = reward_product_images[0];
		String stock_quantity = stock_quantites[0];
		String reward_product_description = reward_product_descriptions[0];
		String point_price = point_prices[0];


		PointRewardBean prb = new PointRewardBean();

		//Beanにセット
		prb.setReward_product_name(reward_product_name);
		prb.setReward_product_image(reward_product_image);
		prb.setStock_quantity(Integer.parseInt(stock_quantity));
		prb.setReward_product_description(reward_product_description);
		prb.setPoint_price(Integer.parseInt(point_price));

		//ポイント商品情報の変更
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductManagementDAO msppm = factory.getPointProductManagementDAO();
		msppm.editRewardProduct(prb);

		//productManagement.jspに移動
		resc.setTarget("productManagement");

		return resc;
	}
}














