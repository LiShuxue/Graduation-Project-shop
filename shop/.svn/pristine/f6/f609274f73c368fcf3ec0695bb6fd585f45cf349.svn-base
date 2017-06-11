package cn.it.shop.service.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import cn.it.shop.model.Product;
import cn.it.shop.service.ProductService;
@SuppressWarnings("unchecked")
@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<Product> implements ProductService {
	
	//查询分页
	@Override
	public List<Product> queryJoinCategory(String name, int page, int size) {
		String hql = "From Product p left join fetch p.category where p.name like :name";
		Query query = getSession().createQuery(hql);
		query.setString("name", "%" + name + "%");
		query.setFirstResult((page-1) * size);
		query.setMaxResults(size);
		return query.list();
	}
	
	//根据关键字查询总记录数
	@Override
	public Long getCount(String name) {
		String hql = "select count(p) from Product p where p.name like :name";
		Query query = getSession().createQuery(hql);
		query.setString("name", "%" + name + "%");
		return (Long) query.uniqueResult();
	}
	//根据Id删除多条记录
	@Override
	public void deleteByIds(String ids) {
		//注意后面的写法。不能    in (:ids)。这样后面就不用写setString了
		String hql = "delete from Product where id in (" + ids + ")";
		Query query = getSession().createQuery(hql);
		query.executeUpdate();
		
	}

	//根据热点类别,查询当前类别推荐商品 （仅仅查询前4个）
	@Override
	public List<Product> queryByCid(int cid) {
		String hql = "From Product p join fetch p.category where p.commend=true and p.open=true and p.category.id=:cid order by p.date desc";
		Query query = getSession().createQuery(hql);
		query.setInteger("cid", cid);
		query.setFirstResult(0);
		query.setMaxResults(4);
		return query.list();
	}

}
