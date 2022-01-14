package command.cart;

import java.util.List;

import bean.CartBean;
import command.AbstractCommand;
import dao.Connector;
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

		//トランザクションを開始する
		Connector.getInstance().beginTransaction();

		//カートの中身を削除
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cartDAO = factory.getCartDAO();
		cartDAO.removeCart(user_id,product_id);

		//カートの中身を取得
		int userid=Integer.parseInt(user_id);
		CartDAO cd = factory.getCartDAO();
		List<CartBean> carts = cd.getCartList(userid);
		resc.setResult(carts);

		//トランザクションを終了する
		Connector.getInstance().commit();

				//コネクションを切断する
		Connector.getInstance().close();

		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}
