
package dao.product;

import java.util.List;
import java.util.Map;

import bean.OrderDetailBean;
import bean.ProductBean;

public interface ProductDAO {
	 public List<ProductBean> refineSearch(Map<String,String[]> parameters);
	 public List<ProductBean> getProductsList();
	 public List<ProductBean> getProductDetail(String product_id);
	 public List<ProductBean> searchProducts(String key);
	 public int getStock_quantity(String product_id);
	 public List<ProductBean> sortProducts();
	 public List<ProductBean> sortFavoriteCount();
	 public void reduceStock(List<OrderDetailBean> order_details);
	 public List randomProduct();
}
