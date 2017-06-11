package cn.it.shop.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.aspectj.util.FileUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Product;

@Controller
@Scope("prototype")
public class ProductAction extends BaseAction<Product> {

	public String queryJoinCategory() {
		//用来存储分页的数据
		pageMap = new HashMap<String, Object>();
		//根据根据关键字和分页参数查询相应数据
		List<Product> productList = productService.queryJoinCategory(model.getName(), page, rows);
		//根据关键字查询总记录数
		Long total = productService.getCount(model.getName());
		pageMap.put("rows", productList);
		pageMap.put("total", total);
		//返回json数据，适合返回复杂的对象
		return "jsonMap";
	}
	
	public String deleteByIds() {
		productService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());
		//返回流，适合返回简单的数据
		return "stream";
	}
	
	public void save() {
		String pic = fileUpload.uploadFile(fileImage);
		model.setPic(pic);
		productService.save(model);
	}
	
	public String get(){
		request.put("product", productService.get(model.getId()));
		return "detail";
		
	}
}
