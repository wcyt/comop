package command.move;

import java.util.List;

import bean.ProductBean;
import command.AbstractCommand;
import command.admin.GetProductsListCommand;
import dao.Connector;
import dao.admin.ProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.ResponseContext;

public class MoveProductManagementCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		// 商品一覧を取得
		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		ProductManagementDAO productManagementDAO = daoFactory.getProductManagementDAO();
		List<ProductBean> productsList = productManagementDAO.getProductList();
		resc.setResult(productsList);

		// productManagement.jspに移動
		resc.setTarget("productManagement");

		//トランザクションを終了する
		Connector.getInstance().commit();

		return resc;
	}
}
