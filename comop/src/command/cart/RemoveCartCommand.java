package command.cart;

import command.AbstractCommand;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RemoveCartCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();


		//パラメータを取得
		String[] user_ids = reqc.getParameter("user_id");
		String user_id = user_ids[0];

		String[] product_ids = reqc.getParameter("product_id");
		String product_id = product_ids[0];

		//カートの中身を削除
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		cd.removeCart(user_id,product_id);


		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}
