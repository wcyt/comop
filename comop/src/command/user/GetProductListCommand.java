package command.user;

import command.AbstractCommand;
import dao.product.ProductDAO;
import tera.ResponseContext;

public class GetProductListCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		ProductDAO pd = new ProductDAO();

		resc.setResult(pd.getProductsList());

		return resc;
	}
}
