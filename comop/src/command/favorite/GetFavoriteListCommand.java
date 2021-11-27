package command.favorite;

import java.util.List;

import command.AbstractCommand;
import dao.favorite.FavoriteDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;


public class GetFavoriteListCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		String user_id = (String)rc.getParameter("user_id")[0];

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();
		List favlist = favdao.getFavoriteList(user_id);

		resc.setResult(favlist);
		resc.setTarget("favorite");

		return resc;
	}
}


