package command.favorite;

import bean.FavoriteBean;
import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.favorite.FavoriteDAO;
import tera.RequestContext;
import tera.ResponseContext;

public class AddFavoriteCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		int user_id = Integer.parseInt(rc.getParameter("user_id")[0]);

		int product_id = Integer.parseInt(rc.getParameter("product_id")[0]);

		FavoriteBean f = new FavoriteBean();

		f.setUser_id(user_id);
		f.setProduct_id(product_id);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();

		favdao.addFavorite(f);

		return resc;
	}

}
