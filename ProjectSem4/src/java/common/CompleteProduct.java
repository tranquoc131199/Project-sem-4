/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import entities.Customers;
import entities.Products;
import entities.Wishlists;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author Acer Nitro 5
 */
public class CompleteProduct {

    private Products product;
    private double productPriceSale;
    private double newPrice;
    private boolean isWishlist;
    private List<Wishlists> wishlists;
    private String productStatusString;
    private String priceString;
    private boolean isNewProduct;
    private String productStarString;

    public CompleteProduct() {
    }

    public CompleteProduct(Products product, Customers customer, List<Wishlists> wishlists) {
        this.product = product;

        if (product.getProductSale() > 0) {
            this.productPriceSale = product.getProductPrice() * product.getProductSale() / 100;
        } else {
            this.productPriceSale = 0;
        }

        this.newPrice = product.getProductPrice() - this.productPriceSale;
        this.wishlists = wishlists;

        if (customer != null) {
            for (Wishlists wishlist : this.wishlists) {
                if (Objects.equals(wishlist.getProductId().getProductId(), product.getProductId())) {
                    this.isWishlist = true;
                }
            }
        }

        generateString();
    }

    private void generateString() {
        if (product.getProductStarAvg() == 5) {
            this.productStarString = "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>";
        } else if (product.getProductStarAvg() < 5 && product.getProductStarAvg() > 4) {
            this.productStarString = "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star-half-o'></i>";
        } else if (product.getProductStarAvg() == 4) {
            this.productStarString = "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star-o'></i>";
        } else if (product.getProductStarAvg() < 4 && product.getProductStarAvg() > 3) {
            this.productStarString = "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star-half-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>";
        } else if (product.getProductStarAvg() == 3) {
            this.productStarString = "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>";
        } else if (product.getProductStarAvg() < 3 && product.getProductStarAvg() > 2) {
            this.productStarString = "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star-half-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>";
        } else if (product.getProductStarAvg() == 2) {
            this.productStarString = "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>";
        } else if (product.getProductStarAvg() < 2 && product.getProductStarAvg() > 1) {
            this.productStarString = "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star-half-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>";
        } else if (product.getProductStarAvg() == 1) {
            this.productStarString = "<i class='fa fa-star'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>";
        } else if (product.getProductStarAvg() < 1 && product.getProductStarAvg() > 0) {
            this.productStarString = "<i class='fa fa-star-half-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>";
        } else if (product.getProductStarAvg() == 0) {
            this.productStarString = "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>\n"
                    + "<i class='fa fa-star-o'></i>";
        }

        switch (product.getProductStatus()) {
            case 1:
                this.productStatusString = "Còn hàng";
                break;
            case 2:
                this.productStatusString = "Hết hàng";
                break;
            default:
                this.productStatusString = "Ngừng kinh doanh";
                break;
        }

        if (productPriceSale > 0) {
            this.priceString = String.format("%,.0f", this.newPrice);
            this.priceString += "<del class='product-old-price'>" + String.format("%,.0f", this.product.getProductPrice()) + "</del>";
        } else {
            this.priceString = String.format("%,.0f", this.product.getProductPrice());
        }
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public double getProductPriceSale() {
        return productPriceSale;
    }

    public void setProductPriceSale(double productPriceSale) {
        this.productPriceSale = productPriceSale;
    }

    public double getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(double newPrice) {
        this.newPrice = newPrice;
    }

    public boolean isIsWishlist() {
        return isWishlist;
    }

    public void setIsWishlist(boolean isWishlist) {
        this.isWishlist = isWishlist;
    }

    public List<Wishlists> getWishlists() {
        return wishlists;
    }

    public void setWishlists(List<Wishlists> wishlists) {
        this.wishlists = wishlists;
    }

    public String getProductStatusString() {
        return productStatusString;
    }

    public void setProductStatusString(String productStatusString) {
        this.productStatusString = productStatusString;
    }

    public String getPriceString() {
        return priceString;
    }

    public void setPriceString(String priceString) {
        this.priceString = priceString;
    }

    public boolean isIsNewProduct() {
        return isNewProduct;
    }

    public void setIsNewProduct(boolean isNewProduct) {
        this.isNewProduct = isNewProduct;
    }

    public String getProductStarString() {
        return productStarString;
    }

    public void setProductStarString(String productStarString) {
        this.productStarString = productStarString;
    }

}
