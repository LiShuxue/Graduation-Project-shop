package cn.it.shop.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Category;
import cn.it.shop.service.CategoryService;

/**
 * 
 * @author LSX
 * 测试CategoryServiceImpl的测试用例
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class CategoryServiceImplTest {
	
	@Resource
	private CategoryService categoryService;

	@Test
	public void testSave() {
		categoryService.save(new Category("测试一下", true));
	}

	@Test
	public void testUpdate() {
		categoryService.update(new Category(5, "测试男士休闲", true));
	}

	@Test
	public void testGet() {
		System.out.println(categoryService.get(4));
	}
	
	@Test
	public void testQuery() {
		for (Category temp : categoryService.query()) {
			System.out.println(temp);
		}
	}
	
	@Test
	public void testDelete() {
		categoryService.delete(4);
	}
	
	@Test
	public void testQueryJoinAccount() {
		for(Category temp : categoryService.queryJoinAccount("", 1, 2)) {
			System.out.println(temp + "," + temp.getAccount());
		}
	}
	
	@Test
	public void testGetCount() {
		System.out.println(categoryService.getCount(""));
	}
	
	@Test
	public void testDeleteByIds() {
		categoryService.deleteByIds("6,7,8");
	}

}
