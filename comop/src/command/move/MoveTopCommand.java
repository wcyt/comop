package command.move;

import java.util.ArrayList;

import command.AbstractCommand;
import dao.favorite.FavoriteDAO;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class MoveTopCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext rc = getRequestContext();
		ArrayList list = new ArrayList();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favoritedao = factory.getFavoriteDAO();
		ProductDAO prodao = factory.getProductDAO();
/*
		//ログインしてるときは自分のお気に入りを表示
		if(rc.getSessionAttribute("user") != null) {
			String user_id = String.valueOf(((UserBean) rc.getSessionAttribute("user")).getUser_id());
			list.add(favoritedao.getFavoriteList(user_id));

		}else {
			list.add(prodao.sortFavoriteCount());
		}
		*/
		list.add(prodao.sortFavoriteCount());
		list.add(prodao.randomProduct());

		resc.setResult(list);

		resc.setTarget("top");
		return resc;
	}
}
