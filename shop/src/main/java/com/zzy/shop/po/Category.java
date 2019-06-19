package com.zzy.shop.po;

public class Category {
    private Integer cid;

    private Integer parentid;

    private String cname;

    private Integer ctype;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getCtype() {
        return ctype;
    }

    public void setCtype(Integer ctype) {
        this.ctype = ctype;
    }
}