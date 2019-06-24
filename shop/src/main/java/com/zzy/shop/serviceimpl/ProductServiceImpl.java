package com.zzy.shop.serviceimpl;

import java.util.*;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.zzy.shop.po.Product;
import com.zzy.shop.po.Category;
import com.zzy.shop.dao.CategoryMapper;
import com.zzy.shop.dao.ProductMapper;
import com.zzy.shop.dao.ProductCategoryMapper;
import com.zzy.shop.service.CategoryService;
import com.zzy.shop.serviceimpl.CategoryServiceImpl;
import com.zzy.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductCategoryMapper productCategoryMapper;
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private CategoryServiceImpl categoryServiceImpl;

    private Page<Product> l ;

    public Page<Product> getL() {
        return l;
    }

    public void setL(Page<Product> l) {
        this.l = l;
    }

    /**
     * 查询商品详情
     */
    @Override
    public Product getProductDetail(Integer pid){
        Product product = productMapper.selectByPrimaryKey(pid);
        return product;
    }

    @Override
    public List<Product> pageProductInfo(Integer cid, Integer sort, Integer page, Integer limit){
        if(cid==1){
            PageHelper.startPage(page, 8);
            List<Product> plist = productMapper.selectAll();
            this. l = (Page<Product>)plist;
            return plist;
        }
        // 根据类目ID查找子类目
        List<Category> childCategories = categoryServiceImpl.listChildCategories(cid);
        List<String> cids = new ArrayList<String>();
        //如果有子目录
        if(childCategories != null || childCategories.size() != 0) {
            for(Category category : childCategories) {
                cids.add(String.valueOf(category.getCid()));
            }
        }
        if(childCategories.size() == 0){
            //没有子目录
            cids.add(String.valueOf(cid));
        }
        PageHelper.startPage(page, limit);
        List<Product> plist = productMapper.listByPage(cids);
        this. l = (Page<Product>)plist;
        return plist;
    }

}
