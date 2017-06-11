package cn.it.shop.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Account;
import cn.it.shop.model.Category;
import cn.it.shop.model.Product;
import cn.it.shop.service.AccountService;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ProductService;

/**
 * 
 * @author LSX
 * 测试ProductServiceImpl的测试用例
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class ProductServiceImplTest {
	
	@Resource
	private ProductService productService;

	@Test  
	public void queryByCid() {
		for(Product p : productService.queryByCid(1)) {
			System.out.println(p);
		}
	}

}
