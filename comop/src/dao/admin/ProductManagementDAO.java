package dao.admin;

import java.util.List;

import bean.ProductBean;

public interface ProductManagementDAO {
	public List<ProductBean> getProductList();
	public void editProduct(String product_id);
	public void addProduct();
	public void removeProduct(String product_id);
}
