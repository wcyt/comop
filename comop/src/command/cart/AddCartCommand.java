package command.cart;

import bean.CartBean;
import command.AbstractCommand;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class AddCartCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//パラメータを取得
		String[] user_ids = reqc.getParameter("user_id");
		String[] product_ids = reqc.getParameter("product_id");


		String user_id = user_ids[0];
		String product_id = product_ids[0];


		CartBean cb = new CartBean();
		cb.setUser_id(Integer.parseInt(user_id));
		cb.setProduct_id(Integer.parseInt(product_id));

		//カートに追加
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		cd.addCart(cb);

		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}
