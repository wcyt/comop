package command.user;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import bean.UserBean;
import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.user.MySQLUserDAO;
import tera.RequestContext;
import tera.ResponseContext;

class CreateAccountCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] names = reqc.getParameter("name");
		String name = names[0];

		String[] mails = reqc.getParameter("mails");
		String mail = mails[0];

		String[] eeeee = reqc.getParameter("password");
		String password = passwords[0];

		UserBean u = new UserBean();
		u.setName(name);
		u.setMail(mail);
		u.setPass(password);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLUserDAO msud = factory.getFactory();


		resc.setTarget("sineUpComplete");

		if(msud.getMail(mail).equals("nomail") == false) {

			reqc.setAttribute("mess", "このメールアドレスは使われています");

			resc.setTarget("signUp");

		}else {

			msud.createAccount(u);
			reqc.setAttribute("mess","ユーザーを登録しました");

			resc.setTarget("signUpComplete");
		}
		return resc;

	}
}