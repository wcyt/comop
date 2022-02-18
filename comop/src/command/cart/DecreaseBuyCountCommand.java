package command.cart;

import java.util.List;

import bean.CartBean;
import command.AbstractCommand;
import dao.Connector;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class DecreaseBuyCountCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//パラメータを取得
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		int product_id = Integer.parseInt(reqc.getParameter("product_id")[0]);
		int buy_count = Integer.parseInt(reqc.getParameter("buy_count")[0]);
		int stock_quantity = Integer.parseInt(reqc.getParameter("stock_quantity")[0]);

		CartBean cartBean = new CartBean();
		cartBean.setUser_id(user_id);
		cartBean.setProduct_id(product_id);
		cartBean.setBuy_count(buy_count);
		cartBean.setStock_quantity(stock_quantity);

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		//	購入個数を1個減らす
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cartDAO = factory.getCartDAO();
		cartDAO.decreaseBuyCount(cartBean);

		//カートに入れた商品一覧を取得
		List<CartBean> carts = cartDAO.getCartList(user_id);
		resc.setResult(carts);

		//トランザクションを終了する
		Connector.getInstance().commit();

		reqc.setAttribute("cartInfo", "商品数量を変更しました。");

		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}
