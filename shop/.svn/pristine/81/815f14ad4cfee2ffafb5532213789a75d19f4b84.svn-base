package cn.it.shop.service.impl;


import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import cn.it.shop.model.Category;
import cn.it.shop.service.CategoryService;

/**
 * 
 * @author LSX
 * 这个类写模块自身的业务逻辑（因为公共的已经抽取出来）
 */

@Service("categoryService")
@SuppressWarnings("unchecked")
public class CategoryServiceImpl extends BaseServiceImpl<Category> implements CategoryService {
	//查询热点类别
	public CategoryServiceImpl() {
		super();
	}
	//实现分页
	//查询类别信息，级联管理员    page第几页size每页显示多少行
	@Override
	public List<Category> queryJoinAccount(String type, int page, int size) {
		String hql = "From Category c left join fetch c.account where c.type like :type";
		Query query = getSession().createQuery(hql);
		query.setString("type", "%" + type + "%");
		query.setFirstResult((page-1) * size);
		query.setMaxResults(size);
		return query.list();
		
	}
	//根据关键字查询总记录数
	@Override
	public Long getCount(String type) {
		String hql = "select count(c) from Category c where c.type like :type";
		Query query = getSession().createQuery(hql);
		query.setString("type", "%" + type + "%");
		return (Long) query.uniqueResult();
	}
	//根据Id删除多条记录
	@Override
	public void deleteByIds(String ids) {
		//注意后面的写法。不能    in (:ids)。这样后面就不用写setString了
		String hql = "delete from Category where id in (" + ids + ")";
		Query query = getSession().createQuery(hql);
		query.executeUpdate();
		
	}
	//根据boolean值查询热点或非热点类别
	@Override
	public List<Category> queryByHot(boolean hot) {
		String hql = "From Category c where c.hot =:hot";
		Query query = getSession().createQuery(hql);
		query.setBoolean("hot", hot);
		return query.list();
	}
}
