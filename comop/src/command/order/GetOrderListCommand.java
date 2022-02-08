package command.order;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import bean.OrderBean;
import command.AbstractCommand;
import dao.order.OrderDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetOrderListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		//パラメータを取得
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		System.out.println(user_id);
		int total_price = 0;

		//注文リストを取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		OrderDAO msod = factory.getOrderDAO();
		List<OrderBean> orderList = msod.getOrderList(user_id);
		resc.setResult(orderList);

		for (OrderBean orderBean : orderList) {
			total_price += orderBean.getPrice();

			LocalDate accessedDate = LocalDate.now(); // 注文履歴にアクセスした時の日付
			LocalDate orderDate = LocalDate.parse(orderBean.getOrder_date(), DateTimeFormatter.ofPattern(
					"yyyy-MM-dd HH:mm:ss")); //注文日時
			long dateDifference = ChronoUnit.DAYS.between(orderDate, accessedDate); // アクセスした時の日付と注文日の差分

			//日付の差分が3日以上の場合、発送済みにする
			if (dateDifference >= 3)
				msod.updateShipped(user_id, orderBean);
		}

		List<OrderBean> shippedProductsList = msod.getShippedOrderList(user_id);
		reqc.setAttribute("shipped_list", shippedProductsList);
		reqc.setAttribute("shipped_order_list_size", shippedProductsList.size());

		reqc.setAttribute("total_price", total_price);
		reqc.setAttribute("order_list_size", orderList.size());

		//orderHistory.jspに移動
		resc.setTarget("orderHistory");

		return resc;
	}
}
