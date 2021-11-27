package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class CreateAccountCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		// パラメータを取得
		String name = reqc.getParameter("name")[0];
		String mail = reqc.getParameter("mail")[0];
		String password = reqc.getParameter("password")[0];

		UserBean u = new UserBean();
		u.setName(name);
		u.setMail(mail);
		u.setPassword(password);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserDAO ud = factory.getUserDAO();
		ud.createAccount(u);

		resc.setTarget("signUpComplete");
//		if (msud.getMail(mail).equals("nomail") == false) {
//
//			reqc.setAttribute("mess", "このメールアドレスは使われています");
//
//			resc.setTarget("signUp");
//
//		} else {
//
//			msud.createAccount(u);
//			reqc.setAttribute("mess", "ユーザーを登録しました");
//
//			resc.setTarget("signUpComplete");
//		}
		return resc;

	}
}