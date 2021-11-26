package command.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.product.ProductDAO;
import tera.RequestContext;
import tera.ResponseContext;

class GetProductListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO prodao = factory.getProductDAO();

		RequestContext rc = getRequestContext();

		Map<String, String[]> promap = new HashMap<>();

		promap.put("size", rc.getParameter("size"));
		promap.put("material", rc.getParameter("material"));
		promap.put("packing_type", rc.getParameter("packing_type"));
		promap.put("pmin", rc.getParameter("pmin"));
		promap.put("pmax", rc.getParameter("pmax"));
		promap.put("color_id", rc.getParameter("color_id"));

		List prolist = prodao.getProductsList(promap);

		resc.setResult(prolist);
		resc.setTarget("/WEB-INF/jsp/productsList.jsp");



		return resc;
	}
}

