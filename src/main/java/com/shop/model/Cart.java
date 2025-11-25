package com.shop.model;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Collection;

public class Cart {
    private final Map<Long, CartItem> items = new LinkedHashMap<>();

    public void add(Product product, int qty) {
        if (product == null) return;
        int q = Math.max(1, qty);
        CartItem existing = items.get(product.getId());
        if (existing == null) {
            items.put(product.getId(), new CartItem(product, q));
        } else {
            existing.setQuantity(existing.getQuantity() + q);
        }
    }

    public void update(long productId, int qty) {
        CartItem item = items.get(productId);
        if (item == null) return;
        if (qty <= 0) {
            items.remove(productId);
        } else {
            item.setQuantity(qty);
        }
    }

    public void remove(long productId) {
        items.remove(productId);
    }

    public Collection<CartItem> getItems() {
        return items.values();
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    public BigDecimal getTotal() {
        return items.values().stream()
                .map(CartItem::getLineTotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public void clear() {
        items.clear();
    }
}
