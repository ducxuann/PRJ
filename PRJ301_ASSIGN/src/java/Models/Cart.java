/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author win
 */
public final class Cart {

    private List<CartItems> items;

    public Cart() {
        items = new ArrayList<>();

    }

    public List<CartItems> getItems() {
        return items;
    }

    public int getCount(int id) {

        return getItemById(id).getQuanity();
    }

    private CartItems getItemById(int id) {
        for (CartItems i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public CartItems getItemByIdAndSize(int id, String size) {
        for (CartItems item : items) {
            if (item.getProduct().getId() == id && item.getSize().equals(size)) {
                return item;
            }
        }
        return null; // Trả về null nếu không tìm thấy sản phẩm với cùng ID và kích thước
    }

//    public void addItem(CartItems t) {
//        if (getItemById(t.getProduct().getId()) != null) {
//            CartItems m = getItemById(t.getProduct().getId());
//            m.setQuanity(m.getQuanity() + t.getQuanity());
//            m.setSize(m.getSize() + t.getSize());
//        } else {
//            items.add(t);
//        }
//
//    }
//    public void addItem(CartItems t) {
//            boolean updated = false;
//
//        CartItems m = getItemById(t.getProduct().getId());
//        if (m != null) {
//            m.setQuanity(m.getQuanity() + t.getQuanity());
//            m.setSize(m.getSize() + t.getSize());
//        } else {
//            items.add(t);
//        }
//    }
//AddItemChuan    
    public void addItem(CartItems t) {
        boolean updated = false;
        for (CartItems item : items) {
            if (item.getProduct().getId() == t.getProduct().getId() && item.getSize().equals(t.getSize())) {
                item.setQuanity(item.getQuanity() + t.getQuanity());
                updated = true;
                break;
            }
        }

        if (!updated) {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));

        }
    }

    public int getTotalMoney() {
        int t = 0;

        for (CartItems i : items) {

            t += (i.getQuanity() * i.getPrice());
        }
        return t;

    }

    private Product getProductById(int id, List<Product> list) {
        for (Product i : list) {
            if (i.getId() == id) {
                return i;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("\\+");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int count = Integer.parseInt(n[1]);
                    String size = n[2];
                    Product p = getProductById(id, list);

                    // Kiểm tra xem sản phẩm với cùng ID và kích thước đã tồn tại trong giỏ hàng chưa
                    CartItems existingItem = getItemByIdAndSize(id, size);
                    if (existingItem != null) {
                        // Nếu đã tồn tại, chỉ cập nhật số lượng
                        existingItem.setQuanity(existingItem.getQuanity() + count);
                    } else {
                        CartItems t = new CartItems(p, p.getPrice(), count, size);

                        items.add(t);
                    }

//                    addItem(t);
//                    items.add(t);
                }
            }
        } catch (NumberFormatException e) {

        }
    }

    public Cart(List<CartItems> items) {
        this.items = items;
    }

}
