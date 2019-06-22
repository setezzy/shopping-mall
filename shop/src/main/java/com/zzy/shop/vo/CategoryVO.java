package com.zzy.shop.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.zzy.shop.po.Product;

public class CategoryVO implements Serializable{

    private Integer cid;    // catagory id

    private String cname;

    List<Product> products;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public List<Product> getProducts(){
        return products;
    }

    public void setProducts(List<Product> products){
        this.products = products;
    }

}
