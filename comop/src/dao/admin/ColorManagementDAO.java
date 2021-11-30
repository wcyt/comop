package dao.admin;

import java.util.List;

import bean.ColorBean;

public interface ColorManagementDAO{
	public void addColor(String color_name);
	public void removeColor(String color_id);
	public List<ColorBean> getColorList();
}
