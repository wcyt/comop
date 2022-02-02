package command.admin;

import java.util.List;

import bean.ProductBean;
import command.AbstractCommand;
import dao.Connector;
import dao.admin.ProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RemoveProductCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();
		String productId = rc.getParameter("product_id")[0];

		Connector.getInstance().beginTransaction();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductManagementDAO pmd = factory.getProductManagementDAO();
		pmd.removeProduct(productId);

		List<ProductBean> productsList = pmd.getProductList();
		resc.setResult(productsList);

		Connector.getInstance().commit();

		resc.setTarget("productManagement");

		return resc;
	}
}






