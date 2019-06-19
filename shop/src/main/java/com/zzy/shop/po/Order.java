package com.zzy.shop.po;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
    private Integer oid;

    private Integer onumber;

    private Integer uid;

    private Integer ostate;

    private Date odate;

    private Date oupdate;

    private BigDecimal oprice;

    private Integer itemamount;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getOnumber() {
        return onumber;
    }

    public void setOnumber(Integer onumber) {
        this.onumber = onumber;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getOstate() {
        return ostate;
    }

    public void setOstate(Integer ostate) {
        this.ostate = ostate;
    }

    public Date getOdate() {
        return odate;
    }

    public void setOdate(Date odate) {
        this.odate = odate;
    }

    public Date getOupdate() {
        return oupdate;
    }

    public void setOupdate(Date oupdate) {
        this.oupdate = oupdate;
    }

    public BigDecimal getOprice() {
        return oprice;
    }

    public void setOprice(BigDecimal oprice) {
        this.oprice = oprice;
    }

    public Integer getItemamount() {
        return itemamount;
    }

    public void setItemamount(Integer itemamount) {
        this.itemamount = itemamount;
    }
}