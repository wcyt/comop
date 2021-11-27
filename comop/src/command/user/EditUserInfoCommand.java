package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class EditUserInfoCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		// パラメータを取得
		String firstName = reqc.getParameter("firstName")[0];
		String lastName = reqc.getParameter("lastName")[0];
		String firstNameKana = reqc.getParameter("firstNameKana")[0];
		String lastNameKana = reqc.getParameter("lastNameKana")[0];
		String address = reqc.getParameter("address")[0];
		String postalCode = reqc.getParameter("postalCode")[0];

		UserBean u = new UserBean();
		u.setFirst_name(firstName);
		u.setLast_name(lastName);
		u.setFirst_name_kana(firstNameKana);
		u.setLast_name_kana(lastNameKana);
		u.setAddress(address);
		u.setPostal_code(postalCode);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
<<<<<<< HEAD
		MySQLUserDAO msud = factory.getMySQLUserDAO();
		msud.editUserInfo(u);
=======
		UserDAO ud = factory.getUserDAO();
		ud.editUserInfo(u);
>>>>>>> branch 'main' of git@github.com:wcyt/comop.git

//		reqc.setAttribute("mess","ユーザー情報を変更しました");

		resc.setTarget("トップに行くか、編集ページに戻るか選ぶページをはさむ");
		return resc;
	}
}

