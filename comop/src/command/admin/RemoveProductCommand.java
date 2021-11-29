package command.admin;

import command.AbstractCommand;
import dao.admin.ProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RemoveProductCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();
		String productId = rc.getParameter("product_id")[0];

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductManagementDAO pmd = factory.getProductManagementDAO();
		System.out.println(productId + "削除作業中");

		pmd.removeProduct(productId);

		resc.setTarget("getProductsList");

		return resc;
	}
}






