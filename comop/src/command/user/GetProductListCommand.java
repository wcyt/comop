package command.user;

import java.util.List;
import java.util.Map;

import command.AbstractCommand;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetProductListCommand  extends AbstractCommand {
	private Map parameters;

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//パラメータを取得
		parameters = reqc.getParameterMap();

		//商品リストを取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO pd = factory.getProductDAO();
		List productsList = pd.getProductsList(parameters);

		resc.setResult(productsList);

		//productsList.jspに移動
		resc.setTarget("productsList");

		return resc;
	}
}
