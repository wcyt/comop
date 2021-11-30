package command.admin;

import bean.ProductBean;
import command.AbstractCommand;
import dao.admin.ProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class AddProductCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		// パラメータの取得
		String product_name = reqc.getParameter("product_name")[0];
		String product_image = reqc.getParameter("product_image")[0];
		String stock_quantity = reqc.getParameter("stock_quantity")[0];
		String product_description = reqc.getParameter("product_description")[0];
		String price = reqc.getParameter("price")[0];
		String size = reqc.getParameter("size")[0];
		String material = reqc.getParameter("material")[0];
		String packing_type = reqc.getParameter("packing_type")[0];
		String color_id = reqc.getParameter("color_id")[0];

		// Beanにセットする
		ProductBean pb = new ProductBean();
		pb.setProduct_name(product_name);
		pb.setProduct_image(product_image);
		pb.setProduct_description(product_description);
		pb.setStock_quantity(Integer.parseInt(stock_quantity));
		pb.setPrice(Integer.parseInt(price));
		pb.setSize(size);
		pb.setMaterial(material);
		pb.setPacking_type(packing_type);
		pb.setColor_id(Integer.parseInt(color_id));

		// DBに追加
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductManagementDAO productManagementDAO = factory.getProductManagementDAO();
		productManagementDAO.addProduct(pb);

		// 商品一覧を取得
		GetProductsListCommand getProductsListCommand = new GetProductsListCommand();
		getProductsListCommand.execute(resc);

		// productManagement.jspに移動
		resc.setTarget("productManagement");

		return resc;
	}
}





