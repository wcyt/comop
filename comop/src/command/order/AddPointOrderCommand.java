package command.order;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import bean.PointOrderBean;
import bean.UserBean;
import command.AbstractCommand;
import dao.Connector;
import dao.order.PointOrderDAO;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class AddPointOrderCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		//パラメータを取得
		int user_id = Integer.parseInt(rc.getParameter("user_id")[0]);
		int reward_product_id = Integer.parseInt(rc.getParameter("reward_product_id")[0]);
		int total_point_price = Integer.parseInt(rc.getParameter("total_point_price")[0]);

		//Beanにセット
		PointOrderBean pointOrderBean = new PointOrderBean();
		pointOrderBean.setUser_id(user_id);
		pointOrderBean.setReward_product_id(reward_product_id);
		pointOrderBean.setTotal_point_price(total_point_price);

		Connector.getInstance().beginTransaction();

		//ポイント注文テーブルに追加
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointOrderDAO pointOrderDAO = factory.getPointOrderDAO();
		pointOrderDAO.addPointOrder(pointOrderBean);

		//ユーザーのポイントを減らす
		pointOrderDAO.minusPoint(pointOrderBean, user_id);

		Connector.getInstance().commit();

		//sessionの更新
		if (rc.getSessionAttribute("user") != null) {
			//TODO セッションに必要なユーザー情報を持ったBeanInstを登録
			String smail = ((UserBean) rc.getSessionAttribute("user")).getMail();
			UserDAO userDAO = factory.getUserDAO();
			UserBean u = new UserBean();
			u = userDAO.getMyUserInfo(smail);
			rc.setSessionAttribute("user", u);
		}

		//ポイント注文履歴を取得
		List<PointOrderBean> pointOrderList = pointOrderDAO.getPointOrderList(user_id);
		resc.setResult(pointOrderList);

		for (PointOrderBean pOrderBean : pointOrderList) {
			LocalDate accessedDate = LocalDate.now(); // 注文履歴にアクセスした時の日付
			LocalDate orderDate = LocalDate.parse(pOrderBean.getOrder_date(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //注文日時
			long dateDifference = ChronoUnit.DAYS.between(orderDate, accessedDate); // アクセスした時の日付と注文日の差分

			//日付の差分が3日以上の場合、発送済みにする
			if (dateDifference >= 3) pointOrderDAO.updateShipped(user_id,pOrderBean);
		}

		rc.setAttribute("point_order_list_size", pointOrderList.size());

		PointOrderDAO pdao = factory.getPointOrderDAO();
		List<PointOrderBean> shippedProductsList = pdao.getShippedOrderList(user_id);
		rc.setAttribute("shipped_list", shippedProductsList);
		
		System.out.println(shippedProductsList.size());
		rc.setAttribute("shipped_order_list_size", shippedProductsList.size());
		//rewardProductHistory.jspに移動
		resc.setTarget("rewardProductOrderHistory");

		return resc;
	}
}




