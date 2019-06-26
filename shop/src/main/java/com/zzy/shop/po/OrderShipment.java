package com.zzy.shop.po;

public class OrderShipment {
    private Integer oshid;

    private String uname;

    private String phone;

    private String address;

    private Integer oid;

    public Integer getOsid() {
        return oshid;
    }

    public void setOshid(Integer osid) {
        this.oshid = oshid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }
}