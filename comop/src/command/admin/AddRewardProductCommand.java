package command.admin;

import bean.PointRewardBean;
import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.admin.MySQLPointProductManagementDAO;
import tera.RequestContext;
import tera.ResponseContext;

public class AddRewardProductCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqs = getRequestContext();


		String[] reward_product_names = reqs.getParameter("reward_product_name");
		String[] reward_product_images = reqs.getParameter("reward_product_image");
		String[] stock_quantites = reqs.getParameter("stock_quantity");
		String[] reward_product_descriptions = reqs.getParameter("reward_product_decription");
		String[] point_prices = reqs.getParameter("point_price");


		String reward_product_name = reward_product_names[0];
		String reward_product_image = reward_product_images[0];
		String stock_quantity = stock_quantites[0];
		String reward_product_description = reward_product_descriptions[0];
		String point_price = point_prices[0];


		PointRewardBean prb = new PointRewardBean();

		prb.setReward_product_name(reward_product_name);
		prb.setReward_product_image(reward_product_image);
		prb.setStock_quantity(Integer.parseInt(stock_quantity));
		prb.setReward_product_description(reward_product_description);
		prb.setPoint_price(Integer.parseInt(point_price));


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLPointProductManagementDAO msppm = new MySQLPointProductManagementDAO();

		msppm.addProduct(prb);

		resc.setAttribute("ポイント商品を追加しました");
		resc.setTarget("productManagement");

		return resc;
	}
}














