package command.favorite;

import java.util.List;

import bean.FavoriteBean;
import command.AbstractCommand;
import dao.favorite.FavoriteDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class AddFavoriteCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		//パラメータを取得
		String user_id = rc.getParameter("user_id")[0];
		String product_id = rc.getParameter("product_id")[0];

		//Beanにセット
		FavoriteBean f = new FavoriteBean();
		f.setUser_id(user_id);
		f.setProduct_id(product_id);

		//お気に入りに追加
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();
		favdao.addFavorite(f);

		//お気に入りリストを取得
		List<FavoriteBean> favlist = favdao.getFavoriteList(user_id);
		resc.setResult(favlist);

		//お気に入り数を取得
		rc.setAttribute("favorites", favlist.size());
		rc.setAttribute("addedFavorite", "お気に入りに追加しました。");

		//favorite.jspに移動
		resc.setTarget("favorite");

		return resc;
	}

}
