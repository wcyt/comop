
package dao.cart;

import java.util.List;

import bean.CartBean;

public interface CartDAO {
	public void addCart(CartBean c);
	public void removeCart(String user_id,String product_id);
	public List<CartBean> getCartList(int user_id);
}
