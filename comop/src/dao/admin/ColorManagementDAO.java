package dao.admin;

import java.util.List;

public interface ColorManagementDAO{
	public void addColor(String color_name);
	public void removeColor(String color_id);
	public List getColorList();

}
