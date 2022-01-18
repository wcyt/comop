package command.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import command.AbstractCommand;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RefineSearchCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext rc = getRequestContext();

		//パラメータを取得
		Map<String, String[]> promap = new HashMap<>();
		promap.put("size", rc.getParameter("size"));
		promap.put("material", rc.getParameter("material"));
		promap.put("packing_type", rc.getParameter("packing_type"));
		promap.put("pmin", rc.getParameter("pmin"));
		promap.put("pmax", rc.getParameter("pmax"));
		promap.put("color_id", rc.getParameter("color_id"));

		//絞り込み検索結果を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ProductDAO proddao = factory.getProductDAO();
		List prolist = proddao.refineSearch(promap);

		resc.setResult(prolist);
		resc.setTarget("productsList");

		return resc;
	}
}

