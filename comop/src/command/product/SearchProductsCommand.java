package command.product;

import java.util.List;

import bean.ProductBean;
import command.AbstractCommand;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class SearchProductsCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		//検索ワードを取得
		String key = rc.getParameter("key")[0];

		//検索ワードに合致した商品一覧を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO pdao = factory.getProductDAO();
		List<ProductBean> psearch =  pdao.searchProducts(key);
		resc.setResult(psearch);

		rc.setAttribute("message", "検索結果: " + key);
		rc.setAttribute("targetProducts", psearch.size());

		//productsList.jspに移動
		resc.setTarget("productsList");

		return resc;
	}
}

