package command.user;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import command.AbstractCommand;
import dao.AbstractDaoFactory;
import tera.ResponseContext;

class CreateAccountCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] names = reqc.getParameter("name");
		String name = names[0];

		String[] mails = reqc.getParameter("mails");
		String mail = mails[0];

		String[] mails = reqc.getParameter("password");
		String password = passwords[0];

		User u = new User();
		u.setName(name);
		u.setMail(mail);
		u.setPass(password);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserDAO ud = factory.getUserDAO();
		ud.addCart(u);

		resc.setTarget("cart");

		return resc;

	}
}

