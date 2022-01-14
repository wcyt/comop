package command.favorite;

import java.util.List;

import bean.FavoriteBean;
import command.AbstractCommand;
import dao.favorite.FavoriteDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetFavoriteListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		String user_id = rc.getParameter("user_id")[0];

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		FavoriteDAO favdao = factory.getFavoriteDAO();
		List<FavoriteBean> favlist = favdao.getFavoriteList(user_id);

		System.out.println("SIZE: "+ favlist.size());

		resc.setResult(favlist);
		resc.setTarget("favorite");

		return resc;
	}
}
