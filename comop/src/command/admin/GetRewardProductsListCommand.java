package command.admin;

import java.util.List;

import bean.PointRewardBean;
import command.AbstractCommand;
import dao.Connector;
import dao.admin.PointProductManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetRewardProductsListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		// ポイント商品一覧を取得
		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		PointProductManagementDAO pointProductManagementDAO = daoFactory.getPointProductManagementDAO();
		List<PointRewardBean> pointRewardList = pointProductManagementDAO.getRewardProductsList();

		resc.setResult(pointRewardList);

		//トランザクションを終了する
		Connector.getInstance().commit();

		//rewardProductManagement.jspに移動
		resc.setTarget("rewardProductManagement");

		return resc;
	}
}
