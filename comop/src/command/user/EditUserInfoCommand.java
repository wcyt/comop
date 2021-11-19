package command.user;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import bean.UserBean;
import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.user.MySQLUserDAO;
import tera.RequestContext;
import tera.ResponseContext;

public class EditUserInfoCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {


		RequestContext reqc = getRequestContext();

		String name = reqc.getParameter("name");
		String mail = reqc.getParameter("mail");
		String address = reqc.getParameter("address");
		String kana = reqc.getParameter("kana");
		String tel = reqc.getParameter("tel");
		String postalCode = reqc.getParameter("postalCode");


		UserBean u = new UserBean();

		u.setName(name);
		u.setMail(mail);
		u.setAddress(address);
		u.setKana(kana);
		u.setTel(tel);
		u.setPostalCode(postalCode);


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLUserDAO msud = factory.getFactory();
		msud.editUseInfo(u);

		resc.setTarget("トップに行くか、編集ページに戻るか選ぶページをはさむ");
		return resc;
	}
}

