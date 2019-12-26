package com.invoicing.manage.entity;

public class SaleRecordMonMoneyEntity {

    /*
    员工id
     */
    private Long moncid ;
    /*
   员工姓名
    */
    private String monname;
    /*
   员工手机号
    */
    private Long monphone;
    /*
   员工上月绩效
    */
    private Long monmoney;

    /**
     * 扩展字段1
     */
    private String remark1;
    /**
     * 扩展字段2
     */
    private String remark2;
    /**
     * 扩展字段3
     */
    private Long remark3;
    /**
     * 扩展字段4
     */
    private Long remark4;

    public Long getMoncid() {
        return moncid;
    }

    public void setMoncid(Long moncid) {
        this.moncid = moncid;
    }

    public String getMonname() {
        return monname;
    }

    public void setMonname(String monname) {
        this.monname = monname;
    }

    public Long getMonphone() {
        return monphone;
    }

    public void setMonphone(Long monphone) {
        this.monphone = monphone;
    }

    public Long getMonmoney() {
        return monmoney;
    }

    public void setMonmoney(Long monmoney) {
        this.monmoney = monmoney;
    }

    public String getRemark1() {
        return remark1;
    }

    public void setRemark1(String remark1) {
        this.remark1 = remark1;
    }

    public String getRemark2() {
        return remark2;
    }

    public void setRemark2(String remark2) {
        this.remark2 = remark2;
    }

    public Long getRemark3() {
        return remark3;
    }

    public void setRemark3(Long remark3) {
        this.remark3 = remark3;
    }

    public Long getRemark4() {
        return remark4;
    }

    public void setRemark4(Long remark4) {
        this.remark4 = remark4;
    }
}
