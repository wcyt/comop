package command.favorite;

import java.util.List;

import command.AbstractCommand;
import dao.favorite.FavoriteDAO;
import dao.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;


class GetFavoriteCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();

		String user_id = (String)rc.getSessionAttribute("user_id")

		List favlist = favdao.getFavoriteList(user_id);

		resc.setResult(favlist);
		resc.setTarget("/WEB-INF/jsp/favorite.jsp");



		return resc;//
	}
}


