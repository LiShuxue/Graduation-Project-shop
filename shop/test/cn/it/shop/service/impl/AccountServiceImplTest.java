package cn.it.shop.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Account;
import cn.it.shop.model.Category;
import cn.it.shop.service.AccountService;
import cn.it.shop.service.CategoryService;

/**
 * 
 * @author LSX
 * 测试AccountServiceImpl的测试用例
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class AccountServiceImplTest {
	
	@Resource
	private AccountService accountService;

	@Test  //没必要全测了，只要有一个成功，剩下的就都
	public void testSave() {
		accountService.save(new Account("admin", "张三", "000"));
	}

}
