package command.product;

import java.util.List;

import bean.ProductBean;
import command.AbstractCommand;
import dao.Connector;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetProductDetailCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext rc = getRequestContext();

		//パラメータを取得
		String product_id = (String)rc.getParameter("product_id")[0];

		//商品詳細を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO pdao = factory.getProductDAO();

		Connector.getInstance().beginTransaction();
		List<ProductBean> productDetailList = pdao.getProductDetail(product_id);
		resc.setResult(productDetailList);

		//productDetail.jspに移動
		resc.setTarget("productDetail");

		return resc;
	}
}


