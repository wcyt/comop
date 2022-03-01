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
		int point = 0;

		String credit_number = "", card_holder = "", security_code = "", expiration_date = "";

		//カートの中身を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		List<CartBean> carts = cd.getCartList(user_id);
		resc.setResult(carts);

		//カートに何も入っていないとき、カートページに戻す
		if (carts.size() == 0) {
			reqc.setAttribute("cartInfo", "カートが空です。カートに商品を追加してください。");
			reqc.setAttribute("cart_list_size", carts.size());
			resc.setTarget("cart");
			return resc;
		}

		//商品の値段と購入個数を合計金額に加算
		for (CartBean cartBean : carts) {
			total_price += cartBean.getPrice() * cartBean.getBuy_count();
			point += total_price * 0.05;
			System.out.println(point);
		}

		//DBからユーザーIDに合致するクレジット情報を持ってきて、セットする
		OrderDAO orderDAO = factory.getOrderDAO();
		List<CreditBean> creditInfo = orderDAO.getCreditInfo(user_id);
		for (CreditBean creditBean : creditInfo) {
			credit_number = creditBean.getCredit_number();
			card_holder = creditBean.getCard_holder();
			security_code = creditBean.getSecurity_code();
			expiration_date = creditBean.getExpiration_date();
		}

		//有効期限がDBに存在しているとき
		if (!expiration_date.equals("")) {
			String expiration_month = expiration_date.substring(0,2);
			String expiration_year = expiration_date.substring(2);
			reqc.setAttribute("expiration_month", expiration_month);
			reqc.setAttribute("expiration_year", expiration_year);
		}

		reqc.setAttribute("point", point);
		reqc.setAttribute("total_price", total_price);
		reqc.setAttribute("credit_number", credit_number);
		reqc.setAttribute("card_holder", card_holder);
		reqc.setAttribute("security_code", security_code);
		System.out.println("point" + point);

		resc.setTarget("select");

		return resc;
	}
}
