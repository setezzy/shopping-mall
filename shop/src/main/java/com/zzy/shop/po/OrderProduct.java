package com.zzy.shop.po;

import java.math.BigDecimal;

public class OrderProduct {
    private Integer opid;

    private Integer oid;

    private String pname;

    private String image;

    private BigDecimal price;

    private Integer pnumber;

    public Integer getOpid() {
        return opid;
    }

    public void setOpid(Integer opid) {
        this.opid = opid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getPnumber() {
        return pnumber;
    }

    public void setPnumber(Integer pnumber) {
        this.pnumber = pnumber;
    }
}