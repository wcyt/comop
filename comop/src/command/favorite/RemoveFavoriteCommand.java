package command.favorite;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.FavoriteBean;
import command.AbstractCommand;
import dao.Connector;
import dao.favorite.FavoriteDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;


public class RemoveFavoriteCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {

		RequestContext rc = getRequestContext();

		//パラメータを取得
		String user_id = (String)rc.getParameter("user_id")[0];
		String[] product_id = rc.getParameter("product_id");

		Map<String, String[]> pid = new HashMap<String, String[]>();
		pid.put("product_id", product_id);

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		//お気に入りを削除
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();
		favdao.removeFavorite(user_id, pid);

		//お気に入りに入れた商品一覧を取得
		List<FavoriteBean> favoriteList = favdao.getFavoriteList(user_id);
		resc.setResult(favoriteList);

		//トランザクションを終了する
		Connector.getInstance().commit();

		//お気に入り数を取得
		rc.setAttribute("favorites", favoriteList.size());
		rc.setAttribute("removedFavorite", "お気に入りを削除しました。");

		//favorite.jspに移動
		resc.setTarget("favorite");

		return resc;
	}

}
