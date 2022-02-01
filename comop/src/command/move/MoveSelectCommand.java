package command.move;

import java.util.List;

import bean.CartBean;
import bean.CreditBean;
import command.AbstractCommand;
import dao.cart.CartDAO;
import dao.order.OrderDAO;
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

		String credit_number = "", card_holder = "", security_code = "", expiration_date = "";

		//カートの中身を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		List<CartBean> carts = cd.getCartList(user_id);
		resc.setResult(carts);

		//合計価格と購入点数をセット
		for (CartBean cartBean : carts) {
			total_price += cartBean.getPrice();
			buy_count += cartBean.getBuy_count();
		}

		OrderDAO orderDAO = factory.getOrderDAO();
		List<CreditBean> creditInfo = orderDAO.getCreditInfo(user_id);
		for (CreditBean creditBean : creditInfo) {
			credit_number = creditBean.getCredit_number();
			card_holder = creditBean.getCard_holder();
			security_code = creditBean.getSecurity_code();
			expiration_date = creditBean.getExpiration_date();
		}

		if (!expiration_date.equals("")) {
			String expiration_month = expiration_date.substring(0,2);
			String expiration_year = expiration_date.substring(2);
			reqc.setAttribute("expiration_month", expiration_month);
			reqc.setAttribute("expiration_year", expiration_year);
		}

		reqc.setAttribute("total_price", total_price);
		reqc.setAttribute("buy_count", buy_count);
		reqc.setAttribute("credit_number", credit_number);
		reqc.setAttribute("card_holder", card_holder);
		reqc.setAttribute("security_code", security_code);

		resc.setTarget("select");

		return resc;
	}
}
