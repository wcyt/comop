package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

class GetProductDetailCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO pdao = factory.getProductDAO();

		String product_id = (String)rc.getParameter("product_id")[0];

		List detaillist = pdao.getProductDetail(product_id);

		resc.setResult(detaillist);
		resc.setTarget("WEB-INF/jsp/productDetail.jsp");

		return resc;
	}
}


