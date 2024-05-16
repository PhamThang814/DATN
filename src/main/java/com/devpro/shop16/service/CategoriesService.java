package com.devpro.shop16.service;

import com.devpro.shop16.entities.Categories;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@Service
public class CategoriesService extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz() {
		// TODO Auto-generated method stub
		return Categories.class;
	}

	public List<Categories> findAllActive() {
		String sql="SELECT * FROM tbl_category c WHERE c.status = 1";
		return super.executeNativeSql(sql);
	}

	@Transactional
	public void inactive(Categories category) {
		super.saveOrUpdate(category);
	}

}
