package command.order;

import java.util.ArrayList;
import java.util.List;

import bean.CreditBean;
import bean.OrderBean;
import bean.OrderDetailBean;
import bean.UserBean;
import command.AbstractCommand;
import dao.Connector;
import dao.cart.CartDAO;
import dao.order.OrderDAO;
import dao.product.ProductDAO;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class AddOrderCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		//EditUserInfo用
		String name = rc.getParameter("name")[0];
		String mail = rc.getParameter("mail")[0];
		String firstName = rc.getParameter("firstName")[0];
		String lastName = rc.getParameter("lastName")[0];
		String firstNameKana = rc.getParameter("firstNameKana")[0];
		String lastNameKana = rc.getParameter("lastNameKana")[0];
		String address = rc.getParameter("address")[0];
		String postalCode = rc.getParameter("postalCode")[0];
		String tel = rc.getParameter("tel")[0];

		//addCreditInfo用
		String credit_number = rc.getParameter("creditNumber")[0];
		String card_holder = rc.getParameter("cardHolder")[0];
		String security_code = rc.getParameter("securityCode")[0];
		String expirationMonth = rc.getParameter("expirationMonth")[0];
		String expirationYear = rc.getParameter("expirationYear")[0];
		String expiration_date = expirationMonth + expirationYear;

		//ポイント用
		String stringpoint = rc.getParameter("point")[0]; // "207.0"
		double doublepoint = Double.parseDouble(stringpoint);
		int point = (int) doublepoint;
		System.out.println("point: " + point);

		//Order用
		int user_id = Integer.parseInt(rc.getParameter("user_id")[0]);
		int total_price = Integer.parseInt(rc.getParameter("total_price")[0]);
		int buy_count = 0;

		List<OrderDetailBean> list = new ArrayList<>();

		for(int i = 0; i < rc.getParameter("product_id").length; i++) {
			OrderDetailBean od = new OrderDetailBean();
			od.setProduct_id(Integer.parseInt(rc.getParameter("product_id")[i]));
			od.setBuy_count(Integer.parseInt(rc.getParameter("buy_count")[i]));

			list.add(od);

			buy_count += Integer.parseInt(rc.getParameter("buy_count")[i]);
		}

		OrderBean o = new OrderBean();
		o.setUser_id(user_id);
		o.setTotal_price(total_price);
		o.setBuy_count(buy_count);

		UserBean userBean = new UserBean();
		userBean.setName(name);
		userBean.setMail(mail);
		userBean.setAddress(address);
		userBean.setFirst_name(firstName);
		userBean.setLast_name(lastName);
		userBean.setFirst_name_kana(firstNameKana);
		userBean.setLast_name_kana(lastNameKana);
		userBean.setTel(tel);
		userBean.setPostal_code(postalCode);
		userBean.setPoint(point);

		CreditBean creditBean = new CreditBean();
		creditBean.setUser_id(user_id);
		creditBean.setCredit_number(credit_number);
		creditBean.setCard_holder(card_holder);
		creditBean.setSecurity_code(security_code);
		creditBean.setExpiration_date(expiration_date);

		Connector.getInstance().beginTransaction();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		OrderDAO orderDAO = factory.getOrderDAO();
		ProductDAO productDAO = factory.getProductDAO();
		CartDAO cartDAO = factory.getCartDAO();
		UserDAO userDAO = factory.getUserDAO();

		userDAO.updatePoint(user_id, point);
		Connector.getInstance().commit();

		//ユーザ情報を変更(動かない)
		userDAO.editUserInfo(userBean);
		Connector.getInstance().commit();//毎回コミットしないとなぜか動かなくなる

		//注文テーブルに追加
		orderDAO.addOrder(o, list);
		Connector.getInstance().commit();

		//在庫を減らす
		productDAO.reduceStock(list);
		Connector.getInstance().commit();

		//クレジットカード情報を登録
		orderDAO.addCreditInfo(creditBean);
		Connector.getInstance().commit();

		//カートの中身を空にする
		for (int i = 0; i < list.size(); i++) {
			OrderDetailBean od = (OrderDetailBean) list.get(i);
			cartDAO.removeCart(user_id,od.getProduct_id());
		}
		Connector.getInstance().commit();

		List<OrderBean> orderlist = orderDAO.getOrderList(user_id);
		resc.setResult(orderlist);
		rc.setAttribute("order_list_size", orderlist.size());
		rc.setAttribute("total_price", total_price);

		resc.setTarget("orderHistory");

		return resc;
	}
}




