package command.admin;

import java.util.List;

import bean.ProductBean;
import command.AbstractCommand;
import dao.Connector;
import dao.admin.ProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetProductsListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		// 商品一覧を取得
		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		ProductManagementDAO productManagementDAO = daoFactory.getProductManagementDAO();
		List<ProductBean> productsList = productManagementDAO.getProductList();
		resc.setResult(productsList);

		//トランザクションを終了する
		Connector.getInstance().commit();

		//productManagement.jspに移動
		resc.setTarget("productManagement");

		return resc;
	}
}