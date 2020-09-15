/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import entities.Customers;
import entities.ProductComments;
import entities.Products;
import java.util.Date;

/**
 *
 * @author Acer Nitro 5
 * Cladd comment để xử lý cho comment cho khách hàng
 */
public class CommentProduct {

    //hiển thị số sao
    private String rateString;

    //Id Comment product
    private Integer productCommentId;

    //sao bình chọn
    private int productCommentRate;

    //nội dung comment
    private String productCommentContent;

    //Thười gian comment
    private Date productCommentTime;

    private int productCommentStatus;

    private Customers customerId;

    private Products productId;

    public CommentProduct() {
    }

    public CommentProduct(ProductComments cmt) {
        this.productCommentId = cmt.getProductCommentId();
        this.productCommentRate = cmt.getProductCommentRate();
        this.productCommentContent = cmt.getProductCommentContent();
        this.productCommentTime = cmt.getProductCommentTime();
        this.productCommentStatus = cmt.getProductCommentStatus();
        this.customerId = cmt.getCustomerId();
        this.productId = cmt.getProductId();
        generateRateString();
    }

    public String getRateString() {
        return rateString;
    }

    public void setRateString(String rateString) {
        this.rateString = rateString;
    }

    public Integer getProductCommentId() {
        return productCommentId;
    }

    public void setProductCommentId(Integer productCommentId) {
        this.productCommentId = productCommentId;
    }

    public int getProductCommentRate() {
        return productCommentRate;
    }

    public void setProductCommentRate(int productCommentRate) {
        this.productCommentRate = productCommentRate;
    }

    public String getProductCommentContent() {
        return productCommentContent;
    }

    public void setProductCommentContent(String productCommentContent) {
        this.productCommentContent = productCommentContent;
    }

    public Date getProductCommentTime() {
        return productCommentTime;
    }

    public void setProductCommentTime(Date productCommentTime) {
        this.productCommentTime = productCommentTime;
    }

    public int getProductCommentStatus() {
        return productCommentStatus;
    }

    public void setProductCommentStatus(int productCommentStatus) {
        this.productCommentStatus = productCommentStatus;
    }

    public Customers getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customers customerId) {
        this.customerId = customerId;
    }

    public Products getProductId() {
        return productId;
    }

    public void setProductId(Products productId) {
        this.productId = productId;
    }

    private void generateRateString() {
        switch (this.productCommentRate) {
            case 0:
                this.rateString = "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>";
                break;
            case 1:
                this.rateString = "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>";
                break;
            case 2:
                this.rateString = "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>";
                break;
            case 3:
                this.rateString = "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star-o'></i>\n"
                        + "<i class='fa fa-star-o'></i>";
                break;
            case 4:
                this.rateString = "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star-o'></i>";
                break;
            default:
                this.rateString = "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>\n"
                        + "<i class='fa fa-star'></i>";
                break;
        }
    }
}
