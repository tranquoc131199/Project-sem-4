/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import entities.PaymentMethods;
import entities.Products;
import entities.Transports;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author Acer Nitro 5
 */
public class ShoppingCart implements Serializable {

    public List<CartSingle> carts;

    public Double totalAmount = 0d;

    public Double lastAmount = 0d;

    public Transports transport = new Transports(1);

    public PaymentMethods payment = new PaymentMethods(1);

    public ShoppingCart() {
    }

    public ShoppingCart(List<CartSingle> carts, Double totalAmount, Double lastAmount, Transports transport, PaymentMethods payment) {
        this.carts = carts;
        this.totalAmount = totalAmount;
        this.lastAmount = lastAmount;
        this.transport = transport;
        this.payment = payment;
    }

    public List<CartSingle> getCarts() {
        return carts;
    }

    public void setCarts(List<CartSingle> carts) {
        this.carts = carts;
        updateTotalAmount();
        updateLastAmount();
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public Transports getTransport() {
        return transport;
    }

    public void setTransport(Transports transport) {
        this.transport = transport;
        updateTotalAmount();
        updateLastAmount();
    }

    public PaymentMethods getPayment() {
        return payment;
    }

    public void setPayment(PaymentMethods payment) {
        this.payment = payment;
        updateTotalAmount();
        updateLastAmount();
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
        updateTotalAmount();
        updateLastAmount();
    }

    public Double getLastAmount() {
        return lastAmount;
    }

    public void setLastAmount(Double lastAmount) {
        this.lastAmount = lastAmount;
        updateTotalAmount();
        updateLastAmount();
    }

    public boolean insertCart(Products product, Integer quantity) {
        boolean result = false;

        if (carts == null || carts.isEmpty()) {
            if (quantity <= 0) {
                result = false;
            } else {
                carts = new ArrayList<>();
                CartSingle cartSingle = new CartSingle(product, quantity);
                carts.add(cartSingle);
                result = true;
            }

        } else {
            boolean isExists = false;

            for (CartSingle cart : carts) {
                if (Objects.equals(cart.product.getProductId(), product.getProductId())) {
                    cart.productQuantity += quantity;
                    result = true;
                    isExists = false;
                    break;
                } else {
                    isExists = true;
                }
            }

            if (isExists && quantity > 0) {
                CartSingle cartSingle = new CartSingle(product, quantity);
                carts.add(cartSingle);
                result = true;
            } else {
                result = false;
            }
        }

        updateTotalAmount();
        updateLastAmount();

        return result;
    }

    public boolean updateCart(Products product, Integer quantity) {
        boolean result = false;

        for (CartSingle cart : carts) {
            if (Objects.equals(cart.product.getProductId(), product.getProductId())) {
                cart.productQuantity += quantity;
                result = true;
                break;
            }
        }

        updateTotalAmount();
        updateLastAmount();

        return result;
    }

    public boolean deleteOneOfCard(Products product) {
        if (carts.size() > 0) {
            for (CartSingle cart : carts) {
                if (Objects.equals(cart.product.getProductId(), product.getProductId())) {
                    boolean check = carts.remove(cart);
                    updateTotalAmount();
                    updateLastAmount();

                    if (carts.isEmpty()) {
                        carts = null;
                    }

                    return check;
                }
            }
        }

        updateTotalAmount();
        updateLastAmount();

        return false;
    }

    public boolean deleteAllCart() {
        boolean result;
        totalAmount = 0d;
        result = carts.removeAll(carts);

        return result;
    }

    private void updateTotalAmount() {
        this.totalAmount = 0d;

        if (carts.size() > 0) {
            carts.forEach((c) -> {
                if (c.product.getProductSale() > 0) {
                    this.totalAmount += c.product.getProductPrice() * (100 - c.product.getProductSale()) / 100 * c.productQuantity;
                } else {
                    this.totalAmount += c.product.getProductPrice() * c.productQuantity;
                }
            });
        }
    }

    private void updateLastAmount() {
        double transportPrice = 0d;

        if (this.transport != null) {
            if (this.transport.getTransportPrice() > 0) {
                transportPrice += this.transport.getTransportPrice();
            }
        }

        this.lastAmount = this.totalAmount + transportPrice;
    }
}
