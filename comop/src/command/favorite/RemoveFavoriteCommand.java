package command.favorite;

import command.AbstractCommand;
import dao.favorite.FavoriteDAO;
import dao.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;


public class RemoveFavoriteCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		String user_id = (String)rc.getSessionAttribute("user_id");

		String product_id = (String)rc.getParameter("product_id")[0];

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();

		favdao.removeFavorite(user_id, product_id);

		return resc;
	}

}
