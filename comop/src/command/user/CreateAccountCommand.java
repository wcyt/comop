package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.user.MySQLUserDAO;
import tera.RequestContext;
import tera.ResponseContext;

class CreateAccountCommand extends AbstractCommand {

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
		MySQLUserDAO msud = factory.getFactory();

		resc.setTarget("sineUpComplete");

		if (msud.getMail(mail).equals("nomail") == false) {

			reqc.setAttribute("mess", "このメールアドレスは使われています");

			resc.setTarget("signUp");

		} else {

			msud.createAccount(u);
			reqc.setAttribute("mess", "ユーザーを登録しました");

			resc.setTarget("signUpComplete");
		}
		return resc;

	}
}