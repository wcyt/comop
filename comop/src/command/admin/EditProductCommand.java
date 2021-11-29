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


		String[] product_names = reqc.getParameter("product_name");
		String[] product_images = reqc.getParameter("product_image");
		String[] stock_quantites = reqc.getParameter("stock_quantity");
		String[] product_descriptions = reqc.getParameter("product_decription");
		String[] prices = reqc.getParameter("price");
		String[] color_ids = reqc.getParameter("color_id");
	  //String[] color_names = reqc.getParameter("color_name");
		String[] sizes = reqc.getParameter("size");


		String product_name = product_names[0];
		String product_image = product_images[0];
		String stock_quantity = stock_quantites[0];
		String product_description = product_descriptions[0];
		String price = prices[0];
		String color_id = color_ids[0];
	  //String color_name = color_names[0];
		String size = sizes[0];


		ProductBean pb = new ProductBean();
		pb.setProduct_name(product_name);
		pb.setProduct_image(product_image);
		pb.setStock_quantity(Integer.parseInt(stock_quantity));
		pb.setProduct_description(product_description);
		pb.setPrice(Integer.parseInt(price));
		pb.setColor_id(Integer.parseInt(color_id));
	  //pb.setColor_name(color_name);
		pb.setSize(size);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductManagementDAO pmd = factory.getProductManagementDAO();

		pmd.editProduct(pb);

		resc.setTarget("productManagement");


		return resc;
	}
}




