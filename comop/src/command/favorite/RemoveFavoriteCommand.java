package command.favorite;

import java.util.HashMap;
import java.util.Map;

import command.AbstractCommand;
import dao.favorite.FavoriteDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;


public class RemoveFavoriteCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		String user_id = (String)rc.getParameter("user_id")[0];
		String[] product_id = rc.getParameter("product_id");

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();

		Map<String, String[]> pid = new HashMap<String, String[]>();

		pid.put("product_id", product_id);

		favdao.removeFavorite(user_id, pid);

		return resc;
	}

}
