package command.cart;

import java.util.List;

import bean.CartBean;
import command.AbstractCommand;
import dao.Connector;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RemoveCartCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//パラメータを取得
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		int product_id = Integer.parseInt(reqc.getParameter("product_id")[0]);

		//トランザクションを開始する
		Connector.getInstance().beginTransaction();

		//カートの中身を削除
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cartDAO = factory.getCartDAO();
		cartDAO.removeCart(user_id, product_id);

		//カートの中身を取得
		List<CartBean> carts = cartDAO.getCartList(user_id);
		resc.setResult(carts);

		//トランザクションを終了する
		Connector.getInstance().commit();

		reqc.setAttribute("cartInfo", "カートから削除しました。");
		reqc.setAttribute("cart_list_size", carts.size());

		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}
