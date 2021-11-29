package command.admin;

import java.util.List;

import command.AbstractCommand;
import dao.admin.ProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetProductsListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductManagementDAO mspmd = factory.getProductManagementDAO();

		List products = mspmd.getProductList();


		resc.setResult(products);
		resc.setTarget("productManagement");

		return resc;
	}
}




