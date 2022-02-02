package command.user;

import command.AbstractCommand;
import dao.Connector;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class UpdatePointCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		// パラメータを取得
		String user_id = reqc.getParameter("user_id")[0];
		String pt = reqc.getParameter("point")[0];
		String total_price = reqc.getParameter("total_price")[0];

		//ポイントの計算
		int total_point = Integer.parseInt(pt);
		int point = totalPrice / 10;
		total_point += point;


		Connector.getInstance().beginTransaction();

		//ポイントの付与
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = factory.getUserDAO();
		userDAO.updatePoint(user_id,total_point);

		Connector.getInstance().commit();

		reqc.setAttribute("message","ポイントが付与されました。");

		//default.jspに移動
		resc.setTarget("default");
		return resc;
	}
}

