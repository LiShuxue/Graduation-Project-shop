package cn.it.shop.action;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Category;

/**
 * 
 * @author LSX
 * 
 */

@Controller
@Scope("prototype")
public class CategoryAction extends BaseAction<Category> {
	
	public String queryJoinAccount() {
		//用来存储分页的数据
		pageMap = new HashMap<String, Object>();
		//根据根据关键字和分页参数查询相应数据
		List<Category> categoyList = categoryService.queryJoinAccount(model.getType(), page, rows);
		//根据关键字查询总记录数
		Long total = categoryService.getCount(model.getType());
		pageMap.put("rows", categoyList);
		pageMap.put("total", total);
		//返回json数据，适合返回复杂的对象
		return "jsonMap";
	}
	
	public String deleteByIds() {
		categoryService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());
		//返回流，适合返回简单的数据
		return "stream";
	}
	
	public void save() {
		categoryService.save(model);
	}
	
	public void update() {
		categoryService.update(model);
	}
	
	public String query() {
		jsonList = categoryService.query();
		return "jsonList";
	}
}
