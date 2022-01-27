
package dao.cart;

import java.util.List;

import bean.CartBean;

public interface CartDAO {
	public void addCart(CartBean c);
	public void removeCart(int user_id,int product_id);
	public List<CartBean> getCartList(int user_id);
	public void increaseBuyCount(CartBean cartBean);
	public void decreaseBuyCount(CartBean cartBean);
}
