package command.favorite;

import bean.FavoriteBean;
import command.AbstractCommand;
import dao.favorite.FavoriteDAO;
import dao.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class AddFavoriteCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		String user_id = (String)rc.getSessionAttribute("user_id");

		String product_id = (String)rc.getParameter("product_id")[0];

		FavoriteBean f = new FavoriteBean();

		f.setUserId(user_id);
		f.setProduct_id(product_id);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();

		favdao.addFavorite(f);//

		return resc;
	}

}
