package command.move;

import java.util.List;

import bean.CartBean;
import command.AbstractCommand;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class MoveSelectCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		//パラメータを取得
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		int total_price = 0;
		int buy_count = 0;

		//カートの中身を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		List<CartBean> carts = cd.getCartList(user_id);
		resc.setResult(carts);

		//合計価格と購入点数を取得
		for (CartBean cartBean : carts) {
			total_price += cartBean.getPrice();
			buy_count += cartBean.getBuy_count();
		}

		reqc.setAttribute("total_price", total_price);
		reqc.setAttribute("buy_count", buy_count);

		resc.setTarget("select");

		return resc;
	}
}
