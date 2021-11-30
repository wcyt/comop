package command.admin;

import bean.ProductBean;
import command.AbstractCommand;
import dao.admin.ProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;


public class EditProductCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String product_name = reqc.getParameter("product_name")[0];
		String product_image = reqc.getParameter("product_image")[0];
		String stock_quantity = reqc.getParameter("stock_quantity")[0];
		String product_description = reqc.getParameter("product_decription")[0];
		String price = reqc.getParameter("price")[0];
		String color_id = reqc.getParameter("color_id")[0];
		String size = reqc.getParameter("size")[0];

		ProductBean pb = new ProductBean();
		pb.setProduct_name(product_name);
		pb.setProduct_image(product_image);
		pb.setStock_quantity(Integer.parseInt(stock_quantity));
		pb.setProduct_description(product_description);
		pb.setPrice(Integer.parseInt(price));
		pb.setColor_id(Integer.parseInt(color_id));
		pb.setSize(size);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductManagementDAO pmDAO = factory.getProductManagementDAO();
		pmDAO.editProduct(pb);

		GetProductsListCommand getProductsListCommand = new GetProductsListCommand();
		getProductsListCommand.execute(resc);

		resc.setTarget("productManagement");

		return resc;
	}
}




