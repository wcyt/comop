package command.admin;

import java.util.List;

import command.AbstractCommand;
import dao.admin.PointProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetRewardProductsListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointProductManagementDAO msppmd = factory.getPointProductManagementDAO();

		List pointProducts = msppmd.getRewardProductsList();


		resc.setResult(pointProducts);
		resc.setTarget("productManagement");

		return resc;
	}
}




