package com.zzy.shop.serviceimpl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzy.shop.dao.CategoryMapper;
import com.zzy.shop.dao.ProductCategoryMapper;
import com.zzy.shop.dao.ProductMapper;
import com.zzy.shop.po.Category;
import com.zzy.shop.po.Product;
import com.zzy.shop.po.ProductCategory;
import com.zzy.shop.service.AdminProductService;
import com.zzy.shop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class AdminProductServiceImpl implements AdminProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductCategoryMapper productCategoryMapper;
    @Autowired
    private CategoryServiceImpl categoryServiceImpl;
    @Autowired
    private CategoryMapper categoryMapper;

    private Page<Product> l ;

    public Page<Product> getL() {
        return l;
    }

    public void setL(Page<Product> l) {
        this.l = l;
    }

    @Override
    public int deleteProduct(Integer pid){
        int count1 = productMapper.deleteByPrimaryKey(pid);
        int count2 = productCategoryMapper.deleteByProductId(pid);
        return count1&count2;
    }

    @Override
    public int updateProduct(Product product){
        int count = productMapper.updateByPrimaryKeySelective(product);
        return count;
    }

    @Override
    public int insertProduct(Product product){
        productMapper.insertSelective(product);
        Product product2 = productMapper.selectByProductName(product.getPname());
        return product2.getPid();
    }

    @Override
    public int insertCategory(ProductCategory productCategory){
        int count = productCategoryMapper.insertSelective(productCategory);
        return count;
    }

    @Override
    public int selectMaxNumber(Integer pid){
        int pnumber = productMapper.selectMaxByProductId(pid);
        return pnumber;
    }

    public int selectIdByName(String cname){
        int cid = categoryMapper.selectIdByName(cname);
        return cid;
    }


    /**
     * 查询商品详情
     */
    @Override
    public Product getProductDetail(Integer pnumber){
        Product product = productMapper.selectByProductNumber(pnumber);
        return product;
    }

    /**
     * 分页查询商品信息
     */
    @Override
    public List<Product> pageProductInfo(Integer cid, Integer page, Integer limit){
        if(cid==1){
            PageHelper.startPage(page, 11);
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
