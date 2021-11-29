package command.admin;

import java.util.List;

import command.AbstractCommand;
import dao.admin.MySQLPointProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetRewardProductsListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLPointProductManagementDAO msppmd = factory.getMySQLPointProductManagemantDAO();

		List pointProducts = msppmd.getRewardProductsList();


		resc.setResult(pointProducts);
		resc.setTarget("productManagement");

		return resc;
	}
}




