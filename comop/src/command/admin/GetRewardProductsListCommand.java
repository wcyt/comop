package command.admin;

import java.util.List;

import bean.PointRewardBean;
import command.AbstractCommand;
import dao.admin.PointProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetRewardProductsListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		// ポイント商品一覧を取得
		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		PointProductManagementDAO pointProductManagementDAO = daoFactory.getPointProductManagementDAO();
		List<PointRewardBean> pointRewardList = pointProductManagementDAO.getRewardProductsList();

		resc.setResult(pointRewardList);

		//rewardProductManagement.jspに移動
		resc.setTarget("rewardProductManagement");

		return resc;
	}
}
