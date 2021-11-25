package command.admin;

import bean.ProductBean;
import command.AbstractCommand;
import tera.RequestContext;
import tera.ResponseContext;

public class AddProductCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqs = getRequestContext();

		String[] product_ids = reqs.getParameter("product_id");
		String[] product_names = reqs.getParameter("product_name");
		String[] product_images = reqs.getParameter("product_image");
		String[] stock_quantites = reqs.getParameter("stock_quantity");
		String[] product_descriptions = reqs.getParameter("product_decription");
		String[] prices = reqs.getParameter("price");
		String[] color_ids = reqs.getParameter("color_id");
		String[] color_names = reqs.getParameter("color_name");
		String[] sizes = reqs.getParameter("size");
		
		
		String product_id = product_ids[0];
		String product_name = product_names[0];
		String product_image = product_images[0];
		String stock_quantity = stock_quantites[0];
		String product_description = product_descriptions[0];
		String price = prices[0];
		String color_id = color_ids[0];
		String color_name = color_names[0];
		String size = sizes[0];
		
		
		ProductBean pb = new ProductBean();
		pb.setProduct_id(Integer.parseInt(product_id));
		pb.setProduct_name(product_name);
		pb.setProduct_image(product_image);
		pb.setStock_quantity(Integer.parseInt(stock_quantity));
		pb.setProduct_description(product_description);
		pb.setPrice(Integer.parseInt(price));
		pb.setColor_id(Integer.parseInt(color_id));
		pb.setColor_name(color_name);
		pb.setSize(size);
		
		

		return resc;
	}
}





