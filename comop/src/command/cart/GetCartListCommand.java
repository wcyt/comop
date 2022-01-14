package command.cart;

import java.util.List;

import bean.CartBean;
import command.AbstractCommand;
import dao.Connector;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetCartListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		//パラメータを取得
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);

		//カートの中身を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		List<CartBean> carts = cd.getCartList(user_id);
		resc.setResult(carts);

		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}