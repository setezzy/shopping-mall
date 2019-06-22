package com.zzy.shop.serviceimpl;

import com.zzy.shop.po.Category;
import com.zzy.shop.service.CategoryService;
import com.zzy.shop.dao.CategoryMapper;
import com.zzy.shop.vo.CategoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper CategoryMapper;

    //导航栏商品列表
    @Override
    public List<CategoryVO> getIndexCategory(){
        List<CategoryVO> categories = CategoryMapper.selectIndexCategory();
        return categories;
    }

    @Override
    public Category getByCategoryId(Integer cid){
        Category category = CategoryMapper.selectByPrimaryKey(cid);
        return category;
    }

    @Override
    public List<Category> listChildCategories(Integer cid){
        List<Category> calist = CategoryMapper.listChildCategories(cid);
        return calist;
    }

    @Override
    public List<Category> listParentCategories(Integer cid){
        List<Category> calist = CategoryMapper.listParentCategories(cid);
        return calist;
    }
}
