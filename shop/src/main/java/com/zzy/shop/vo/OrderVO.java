package com.zzy.shop.vo;

import com.zzy.shop.po.OrderProduct;
import com.zzy.shop.po.OrderShipment;
import com.zzy.shop.po.OrderState;

import java.math.BigDecimal;
import java.util.Date;
import java.util.ArrayList;

public class OrderVO {

        private Integer oid;

        private Long onumber;

        private Integer uid;

        private Integer ostate;

        private Date odate;

        private Date oupdate;

        private BigDecimal oprice;

        private Integer itemamount;

        private OrderShipment orderShipment;

        private ArrayList<OrderState> orderStates;

        private ArrayList<OrderProduct> orderProducts;


        public Integer getOid() {
            return oid;
        }

        public void setOid(Integer oid) {
            this.oid = oid;
        }

        public Long getOnumber() {
            return onumber;
        }

        public void setOnumber(Long onumber) {
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

        public ArrayList<OrderProduct> getOrderProducts(){
            return orderProducts;
        }

        public void setOrderProducts(ArrayList<OrderProduct> orderProducts){
            this.orderProducts = orderProducts;
        }

        public ArrayList<OrderState> getOrderStates(){
            return orderStates;
        }

        public void setOrderStates(ArrayList<OrderState> orderStates){
            this.orderStates = orderStates;
        }

        public OrderShipment getOrderShipment(){
            return orderShipment;
        }

        public void setOrderShipment(OrderShipment orderShipment){
            this.orderShipment = orderShipment;
    }

}
