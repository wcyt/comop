package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetProductsListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext rc = getRequestContext();

		//商品一覧を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO proddao = factory.getProductDAO();
		List prolist = proddao.getProductsList();
		resc.setResult(prolist);

		//productsList.jspに移動
		resc.setTarget("productsList");

		return resc;
	}
}

