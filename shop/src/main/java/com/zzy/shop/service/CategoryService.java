package com.zzy.shop.service;

import java.util.List;

import com.zzy.shop.po.Category;
import com.zzy.shop.vo.CategoryVO;

public interface CategoryService {

    List<CategoryVO> getIndexCategory();

    Category getByCategoryId(Integer cid);

    List<Category> listChildCategories(Integer cid);

    List<Category> listParentCategories(Integer cid);
}
