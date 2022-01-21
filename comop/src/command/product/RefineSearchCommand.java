package command.product;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import bean.ProductBean;
import command.AbstractCommand;
import dao.Connector;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RefineSearchCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext rc = getRequestContext();

		//パラメータを取得
		Map<String, String[]> promap = rc.getParameterMap();

		//パラメータの値を表示している（後で消す）
		for (String key : promap.keySet()) {
	        System.out.println(key + ":" + Arrays.deepToString(promap.get(key)));
	    }

		Connector.getInstance().beginTransaction();

		//絞り込み検索結果を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO proddao = factory.getProductDAO();
		List<ProductBean> prolist = proddao.refineSearch(promap);
		resc.setResult(prolist);

		Connector.getInstance().commit();

		//商品の取得件数を取得
		rc.setAttribute("targetProducts", prolist.size());

		//productsList.jspに移動
		resc.setTarget("productsList");

		return resc;
	}
}

