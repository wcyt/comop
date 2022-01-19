package command.cart;

import java.util.List;

import bean.CartBean;
import command.AbstractCommand;
import dao.Connector;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class AddCartCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//パラメータを取得
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		int product_id = Integer.parseInt(reqc.getParameter("product_id")[0]);

		CartBean cartBean = new CartBean();
		cartBean.setUser_id(user_id);
		cartBean.setProduct_id(product_id);

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		//カートに追加
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cartDAO = factory.getCartDAO();
		cartDAO.addCart(cartBean);

		//カートに入れた商品一覧を取得
		List<CartBean> carts = cartDAO.getCartList(user_id);
		resc.setResult(carts);

		//トランザクションを終了する
		Connector.getInstance().commit();

		reqc.setAttribute("cartInfo", "カートに追加しました。");

		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}
