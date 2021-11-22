package command.cart;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.cart.CartDAO;
import tera.RequestContext;
import tera.ResponseContext;

class AddCartCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] uids = null;
		String[] pids = null;
		String[] bc = null;

		String uid = null;
		String pid = null;
		String bc2 = null;

		String[] uids = reqc.getParameter("uid");

		if(rqsc.getSessionAttribute("pid")==null) {
			pids = rqsc.getParameter("pid")[0];
			bc = rqsc.getParameter("bc")[0];
		}else {
			pids = (String) rqsc.getSessionAttribute("pid");
			bc = (String) rqsc.getSessionAttribute("bc");

		}


		String uid = uids[0];
		String pid = pids[0];


		Product p = new Product();
		p.setUid(uid);
		p.setPid(pid);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		cd.addCart(p);

		resc.setTarget("cart");

		return resc;
	}
}

public class AddCartCommand extends AbstractCommand{


	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();
		System.out.println("AddCartCommandだよ");

		String userId = (String)rc.getSessionAttribute("userId");
		System.out.println("USERID:" + (String)rc.getSessionAttribute("userId"));

		String itemId=null;
		String buyCount=null;

		if(rc.getSessionAttribute("itemId")==null) {
			itemId = rc.getParameter("itemId")[0];
			buyCount = rc.getParameter("buyCount")[0];
		}else {
			itemId = (String) rc.getSessionAttribute("itemId");
			buyCount = (String) rc.getSessionAttribute("buyCount");

		}



		int buyCount2 = Integer.parseInt(buyCount);


		Cart c = new Cart();
		c.setUserId(userId);
		c.setItemId(itemId);
		c.setBuyCount(buyCount2);
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		AddCartDao dao = factory.getAddCartDao();

		int stock = dao.getStockCount(c);
		int cartcount = dao.getCartCount(c);

		System.out.println(stock+"\t"+cartcount);
		if(stock>=buyCount2+cartcount) {
			dao.addCart(c);
			rc.setAttribute("mess1",itemId+"を"+buyCount+"個カートに追加しました");
			resc.setTarget("getcartlist");
			LoginDao cart = factory.getLoginDao();
			String cartCount = cart.getCartCount(userId);

			String buyCount1 = cart.getBuyCount(userId);
			rc.setSessionAttribute("buyCount", buyCount1);
			System.out.println("buyCount"+buyCount1);

			rc.setSessionAttribute("cartCount", cartCount);
		}else if(stock<buyCount2+cartcount) {
			rc.setAttribute("mess1","すでにカートに入っているか、在庫が足りません");
			resc.setTarget("getitemdetail");
		}



		System.out.println("target:"+resc.getTarget());

		return resc;
	}
}
