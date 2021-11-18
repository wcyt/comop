package command.user;

import command.AbstractCommand;
import dao.user.UserDAO;
import tera.ResponseContext;

class GetUserInfoCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		User id;
		UserDAO ud = new UserDAO();

		resc.setResult(ud.getGetUserInfo(id));

		return resc;
	}
}