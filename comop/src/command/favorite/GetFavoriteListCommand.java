package command.favorite;

import java.util.List;

import bean.FavoriteBean;
import command.AbstractCommand;
import dao.Connector;
import dao.favorite.FavoriteDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetFavoriteListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		//パラメータを取得
		String user_id = rc.getParameter("user_id")[0];

		Connector.getInstance().beginTransaction();

		//user_idに合致したお気に入りリストを取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();
		List<FavoriteBean> favlist = favdao.getFavoriteList(user_id);
		resc.setResult(favlist);

		Connector.getInstance().commit();

		//お気に入り数を取得
		rc.setAttribute("favorites", favlist.size());

		// favorite.jspに移動
		resc.setTarget("favorite");

		return resc;
	}
}
