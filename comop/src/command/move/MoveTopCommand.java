package command.move;

import java.util.List;

import bean.FavoriteBean;
import bean.ProductBean;
import bean.UserBean;
import command.AbstractCommand;
import dao.favorite.FavoriteDAO;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class MoveTopCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext rc = getRequestContext();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favoritedao = factory.getFavoriteDAO();
		ProductDAO prodao = factory.getProductDAO();

		List<ProductBean> sortFavoriteCountList = prodao.sortFavoriteCount();
		rc.setAttribute("favoriteCountList", sortFavoriteCountList);

		List randomProductList = prodao.randomProduct();
		rc.setAttribute("randomProductList", randomProductList);

		//ログインしてるときは自分のお気に入りを表示
		if (rc.getSessionAttribute("user") != null) {
			String user_id = String.valueOf(((UserBean) rc.getSessionAttribute("user")).getUser_id());
			List<FavoriteBean> favoriteList = favoritedao.getFavoriteList(user_id);
			rc.setAttribute("favoriteList", favoriteList);
		}

		resc.setTarget("top");
		return resc;
	}
}
