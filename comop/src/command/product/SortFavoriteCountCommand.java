package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.ResponseContext;

public class SortFavoriteCountCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO pdao = factory.getProductDAO();

		List favsort = pdao.sortFavoriteCount();

		resc.setResult(favsort);

		resc.setTarget("top");

		return resc;
	}
}


