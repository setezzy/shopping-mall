package com.zzy.shop.dao;

import java.util.List;

import com.zzy.shop.po.Category;
import com.zzy.shop.vo.CategoryVO;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    // 查找目录和目录下的商品
    List<CategoryVO> selectIndexCategory();

    // 根据商品id查找一级目录
    Category selectParentCategoryByProductId(Integer pid);

    // 查找子目录
    List<Category> listChildCategories(Integer cid);

    //查找上级目录
    List<Category> listParentCategories(Integer cid);
}