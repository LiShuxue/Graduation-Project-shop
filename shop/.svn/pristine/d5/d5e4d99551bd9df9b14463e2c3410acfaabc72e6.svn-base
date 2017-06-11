package cn.it.shop.listener;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.it.shop.util.ProductTimerTask;

/**
 * 
 * @author LSX
 * 用于项目启动的时候数据的初始化
 */
public class InitDataListener implements ServletContextListener {
	protected ApplicationContext context = null;
	protected ProductTimerTask productTimerTask = null;
	
	

	@Override
	public void contextDestroyed(ServletContextEvent event) {

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		context = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		productTimerTask = (ProductTimerTask) context.getBean("productTimerTask");
		//把内置对象交给productTimerTask
		productTimerTask.setApplication(event.getServletContext());
		//通过设置定时器，让首页的数据每隔一小时显示一次（要配置为守护线程）
		new Timer(true).schedule(productTimerTask, 0, 1000*60*60);
	}

}
