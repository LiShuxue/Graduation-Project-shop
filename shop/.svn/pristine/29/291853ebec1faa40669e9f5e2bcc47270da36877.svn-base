package cn.it.shop.action;

import java.io.InputStream;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.FileImage;
import cn.it.shop.service.AccountService;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ForderService;
import cn.it.shop.service.ProductService;
import cn.it.shop.service.SorderService;
import cn.it.shop.service.UserService;
import cn.it.shop.util.FileUpload;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author LSX
 * Struts流程：先创建Action，再调用拦截器，拦截器访问成功再调用Action的方法
 * 
 * 在项目启动的时候Struts的过滤器，已经把相应的内置对象，和内置对象对应的Map存储到了ActionContext和值栈中
 * 如果实现了相应的Aware接口，就会从ActionContext中获取相应的Map传入。实现的拦截器为：servletConfig
 * 
 * ModelDriven接口，此接口必须要实现getModel()方法，此方法会把返回的方法，压到栈顶。
 * 
 */
@SuppressWarnings("unchecked")
@Controller
@Scope("prototype")
public class BaseAction<T> extends ActionSupport implements RequestAware, SessionAware, ApplicationAware, ModelDriven<T> {
	//第一部分，传入的分页的相关参数，第几页和显示多少行。EasyUI分页必须有的东西.pageMap存储传回去的数据
	protected Integer page;
	protected Integer rows;
	protected Map<String, Object> pageMap = null;
	
	//获取要删除的id
	protected String ids;
	//返回的流
	protected InputStream inputStream;
	
	protected List<T> jsonList = null;
	
	protected FileImage fileImage;
	
	//第二部分，ModelDriven
	protected T model;
	
	//第三部分，注入所有的service接口
	@Resource
	protected CategoryService categoryService;
	@Resource
	protected AccountService accountService;
	@Resource
	protected ProductService productService;
	@Resource
	protected ForderService forderService;
	@Resource
	protected UserService userService;
	@Resource
	protected SorderService sorderService;
	@Resource
	protected FileUpload fileUpload;
	
	//第四部分，相应的Map
	protected Map<String, Object> request;
	protected Map<String, Object> session;
	protected Map<String, Object> application;
	
	@Override
	public T getModel() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		Class clazz = (Class)type.getActualTypeArguments()[0];
		try {
			model = (T) clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return model;
	}
	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Map<String, Object> getPageMap() {
		return pageMap;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getIds() {
		return ids;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public List<T> getJsonList() {
		return jsonList;
	}
	public void setFileImage(FileImage fileImage) {
		this.fileImage = fileImage;
	}
	public FileImage getFileImage() {
		return fileImage;
	}
	
}
