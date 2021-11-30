package command.admin;

import java.util.List;

import bean.ProductBean;
import command.AbstractCommand;
import dao.admin.ProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetProductsListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		// 商品一覧を取得
		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		ProductManagementDAO productManagementDAO = daoFactory.getProductManagementDAO();
		List<ProductBean> productsList = productManagementDAO.getProductList();

		resc.setResult(productsList);
		resc.setTarget("productManagement");

		return resc;
	}
}
