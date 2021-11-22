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

		Map<String, String> promap = new HashMap<>();

		promap.put("size", (String)rc.getParameter("size")[0]);
		promap.put("material", (String)rc.getParameter("material")[0]);
		promap.put("packing_type", (String)rc.getParameter("packing_type")[0]);
		promap.put("pmin", (String)rc.getParameter("pmin")[0]);
		promap.put("pmax", (String)rc.getParameter("pmax")[0]);
		promap.put("color_id", (String)rc.getParameter("color_id")[0]);

		List prolist = prodao.getProductsList(promap);

		resc.setResult(prolist);
		resc.setTarget("/WEB-INF/jsp/productsList.jsp");



		return resc;
	}
}

