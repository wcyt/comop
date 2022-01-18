package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.Connector;
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

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		UserBean u = new UserBean();
		u.setName(name);
		u.setMail(mail);
		//TODO パスワードのハッシュ化
		u.setPassword(password);

		//アカウントを作成
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserDAO ud = factory.getUserDAO();
		ud.createAccount(u);

		//トランザクションを終了する
		Connector.getInstance().commit();

		System.out.println(name + " " + mail + " " + password);

		//signUpComplete.jspに移動
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