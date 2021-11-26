package dao.admin;

import java.util.List;

import bean.ProductBean;

public interface ProductManagementDAO {
	public List<ProductBean> getProductList();
	public void editProduct(ProductBean p);
	public void addProduct(ProductBean p);
	public void removeProduct(String product_id);
}
