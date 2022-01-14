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
		String user_id = reqc.getParameter("user_id")[0];
		String product_id = reqc.getParameter("product_id")[0];

		//カートの中身を削除
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cartDAO = factory.getCartDAO();
		cartDAO.removeCart(user_id,product_id);

		//カートの一覧を取得
		GetCartListCommand getCartListCommand = new GetCartListCommand();
		getCartListCommand.execute(resc);

		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}
