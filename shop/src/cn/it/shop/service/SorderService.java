package cn.it.shop.service;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;

public interface SorderService extends BaseService<Sorder> {
	 // 计算购物总价格
	 public Forder addSorder(Forder forder,Product product);
	 // 把Porudct数据转化Sorder
	 public Sorder productToSorder(Product product);
}
