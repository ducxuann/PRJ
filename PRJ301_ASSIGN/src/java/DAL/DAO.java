/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import Models.Cart;
import Models.CartItems;
import Models.Category;
import Models.CategoryAdmin;
import Models.Order;
import Models.OrderLine;
import Models.Product;
import Models.ProductAdmin;
import Models.ProductSize;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author win
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));

            }
        } catch (Exception e) {

        }

        return list;
    }

    public List<Product> getLast() {
        List<Product> list = new ArrayList<>();
        String query = "select top 4* from product\n" + "order by id desc";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" + "where cateID = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
//
//    public List<Product> getProductCIDSell(String cid, int id) {
//        List<Product> list = new ArrayList<>();
//        String query = "select * from product_he161328\n" + "where cateID = ? and [sell_ID] = ?";
//        try {
//            conn = new DBContext().getConnection(); //ket noi sql server
//            ps = conn.prepareStatement(query);
//            ps.setString(1, cid);
//            ps.setInt(2, id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
//
//    public List<Product> getProductBySellID(int id) {
//        List<Product> list = new ArrayList<>();
//        String query = "select * from product_he161328\n" + "where sell_ID = ?";
//        try {
//            conn = new DBContext().getConnection(); //ket noi sql server
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
//
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" + "where [name] like ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    //Moi sua String thanh int id.
    public Product getProductByID(int id) {

        String query = "select * from product\n" + "where id = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7));

            }
        } catch (Exception e) {
        }
        return null;
    }
//   end

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));

            }
        } catch (Exception e) {

        }

        return list;
    }

    public Account login(String user, String pass) {
        String query = "select * from account\n" + "where [user] = ?\n" + "and [pass] = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String query = "select * from account\n" + "where [user] = ?\n";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void signUp(String userName, String password, int isAdmin, String firstName, String lastName, String security, String email, int setActive) {
        String query = "insert into account\n" + "values(?,?,?,?,?,?,?,null,null,null,?)";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setInt(3, isAdmin);
            ps.setString(4, firstName);
            ps.setString(5, lastName);
            ps.setString(6, security);
            ps.setString(7, email);
            ps.setInt(8, setActive);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void forgetPass(String pass, String username) {
        String query = "update account\n"
                + "set [pass] = ?\n"
                + "where [user] = ?;";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    ;
   
   public void deleteProduct(String pid) {
        String query = "delete from product\n" + "where id=?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void deleteUsers(String uid) {
        String query = "delete from account\n" + "where [uID]=?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, uid);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void insertProduct(String productName, String image, int price, String description, int category, int sizeS, int sizeM, int sizeL, int sizeXL) {
        String query = "BEGIN TRANSACTION;\n"
                + "\n"
                + "DECLARE @productId INT;\n"
                + "\n"
                + "INSERT INTO product (name, image, price, description, cateID, count)\n"
                + "VALUES (?, ?, ?, ?, ?, ?);\n"
                + "\n"
                + "SET @productId = SCOPE_IDENTITY();\n"
                + "\n"
                + "INSERT INTO ProductSize (pid, size, quantity)\n"
                + "VALUES\n"
                + "    (@productId, 'S', ?),\n"
                + "    (@productId, 'M', ?),\n"
                + "    (@productId, 'L', ?),\n"
                + "    (@productId, 'XL', ?);\n"
                + "\n"
                + "COMMIT;";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, productName);
            ps.setString(2, image);
            ps.setInt(3, price);
            ps.setString(4, description);
            ps.setInt(5, category);
            ps.setInt(6, sizeS + sizeM + sizeL + sizeXL);
            ps.setInt(7, sizeS);
            ps.setInt(8, sizeM);
            ps.setInt(9, sizeL);
            ps.setInt(10, sizeXL);
            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    ;

   public void editProduct(String name, String image, String price, String description, String count, String category, String pid) {
        String query = "update product\n"
                + "set [name] = ?,\n"
                + "[image] = ?,\n"
                + "[price] = ?,\n"
                + "[title] = ?,\n"
                + "[description] = ?,\n"
                + "[cateID] = ?,\n"
                + "[count] = ?\n"
                + "where id = ?;";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, description);
            ps.setString(5, category);
            ps.setString(6, count);
            ps.setString(7, pid);
            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    public int getTotalProduct() {
        String query = "select count(*) from product";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int getTotalProductSearch(String txtSearch) {
        String query = "select count(*) from product \n"
                + "where [name] like ?;";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

//    public int getTotalManagerProduct(int id) {
//        String query = "select count(*) from product\n"
//                + "where sell_ID = ?";
//        try {
//            conn = new DBContext().getConnection(); //ket noi sql server
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                return rs.getInt(1);
//            }
//        } catch (Exception e) {
//
//        }
//        return 0;
//    }
    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "order by id\n"
                + "offset ? rows fetch next 12 rows only";

        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));

            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<Product> pagingManagerProduct(int id, int index) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where sell_ID = ?\n"
                + "order by id\n"
                + "offset ? rows fetch next 12 rows only";

        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, (index - 1) * 12);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public void addOrder(Account c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String query = "insert into [order]\n" + "values(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, date);
            ps.setInt(2, c.getId());
            ps.setInt(3, cart.getTotalMoney());
            ps.setString(4, c.getFirstname() + c.getLastname());
            ps.setString(5, c.getAddress());
            ps.setString(6, c.getPhone());
            ps.executeUpdate();
            //lay id cua order vua add
            String sql1 = "select top 1 id from [order] order by id desc";
            ps = conn.prepareStatement(sql1);
            rs = ps.executeQuery();
            //add bang orderdetails
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (CartItems i : cart.getItems()) {
                    addOrderDetails(i, oid);

                }
            }

            //cap nhap so luong sp
            String sql3 = "update product set count=count-? where id=?\n"
                    + "update ProductSize_HE161328 set quantity=quantity-? where pid = ? and size = ?";
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(sql3);
            for (CartItems i : cart.getItems()) {
                ps.setInt(1, i.getQuanity());
                ps.setInt(2, i.getProduct().getId());
                ps.setInt(3, i.getQuanity());
                ps.setInt(4, i.getProduct().getId());
                ps.setString(5, i.getSize());
                ps.executeUpdate();
            }

        } catch (Exception e) {

        }
    }

    public void addOrderDetails(CartItems i, int oid) {
        String sql = "insert into [orderdetails] values(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.setInt(2, i.getProduct().getId());
            ps.setString(3, i.getSize());
            ps.setInt(4, i.getQuanity());
            ps.setInt(5, i.getPrice());
            ps.setString(6, i.getProduct().getName());
            ps.executeQuery();
        } catch (Exception e) {
        }

    }

    public int getCountOrder() {
        String query = "select count(*) from [order]";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int getCountUsers() {
        String query = "select count(*) from [account]";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int getTotalMoneyOrder() {
        String query = "SELECT SUM(totalmoney)\n"
                + "FROM [order]";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public List<Account> getListUsers() {
        List<Account> listUsers = new ArrayList<>();
        String query = "select * from account";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listUsers.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12)));
            }
        } catch (Exception e) {
        }

        return listUsers;

    }

    public List<Account> pagingListUsers(int index) {
        List<Account> listUsers = new ArrayList<>();
        String query = "select * from account\n"
                + "order by [uID]\n"
                + "offset ? rows fetch next 12 rows only";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                listUsers.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12)));
            }
        } catch (Exception e) {
        }

        return listUsers;

    }

    public int getTotalUserAdmin() {
        String query = "select count(*) from account";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public Account getInfoUsers(String uid) {
        String query = "select * from account\n"
                + "where [uID]= ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12)));
            }
        } catch (Exception e) {
        }

        return null;

    }

    public void updateInfo(String user, String password, String email, String phone, String firstname, String lastname, String isAdmin, int isActive, String uID) {
        String query = "update account\n"
                + "set [isAdmin] = ?,\n"
                + "[user] = ?,\n"
                + "[pass] = ?,\n"
                + "[email] = ?,\n"
                + "[phone] = ?,\n"
                + "[firstname] = ?,\n"
                + "[lastname] = ?,\n"
                + "[setactive] = ?\n"
                + "where [uID] = ?;";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, isAdmin);
            ps.setString(2, user);
            ps.setString(3, password);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, firstname);
            ps.setString(7, lastname);
            ps.setInt(8, isActive);
            ps.setString(9, uID);
            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    public List<Order> getListOrder() {
        List<Order> listOrder = new ArrayList<>();
        String query = "select * from [order]";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(rs.getInt(1), rs.getDate(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }

        return listOrder;

    }

    public List<Order> pagingListOrder(int index) {
        List<Order> listProduct = new ArrayList<>();
        String query = "select * from [order]\n"
                + "order by id\n"
                + "offset ? rows fetch next 12 rows only";

        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();

            while (rs.next()) {
                listProduct.add(new Order(rs.getInt(1), rs.getDate(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));

            }
        } catch (Exception e) {
        }

        return listProduct;

    }

     public int getTotalOrder() {
        String query = "select count(*) from [order]";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }
    
    public List<ProductAdmin> pagingProductAdmin(int index) {
        List<ProductAdmin> listProduct = new ArrayList<>();
        String query = "select id, [name], [image], price, [description], cateID, [count], cname\n"
                + "from product\n"
                + "left outer join category on category.cid = product.cateID\n"
                + "order by id\n"
                + "offset ? rows fetch next 12 rows only";

        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();

            while (rs.next()) {
                listProduct.add(new ProductAdmin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));

            }
        } catch (Exception e) {
        }

        return listProduct;

    }

    public int getTotalProductAdmin() {
        String query = "select count(*)\n"
                + "from product\n"
                + "left outer join category on category.cid = product.cateID";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public void deleteProductAdmin(int id) {
        String query = "delete from ProductSize\n"
                + "where  pid= ?\n"
                + "delete from product\n"
                + "where id= ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public ProductAdmin getListProductAdmin(int id) {

        String query = "select id, [name], [image], price, [description], cateID, [count], cname\n"
                + "from product\n"
                + "join category on category.cid = product.cateID\n"
                + "where product.id = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new ProductAdmin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editProductAdmin(int id, String name, String image, int price, String description, int cateID, int sizeS, int sizeM, int sizeL, int sizeXL) {
        String query = "BEGIN TRANSACTION;\n"
                + "\n"
                + "UPDATE product\n"
                + "SET name = ?, image = ?, price = ?, description = ?, cateID = ?\n"
                + "WHERE id = ?;\n"
                + "\n"
                + "UPDATE ProductSize8\n"
                + "SET quantity = ? WHERE pid = ? AND size = 'S';\n"
                + "\n"
                + "UPDATE ProductSize\n"
                + "SET quantity = ? WHERE pid = ? AND size = 'M';\n"
                + "\n"
                + "UPDATE ProductSize\n"
                + "SET quantity = ? WHERE pid = ? AND size = 'L';\n"
                + "\n"
                + "UPDATE ProductSize\n"
                + "SET quantity = ? WHERE pid = ? AND size = 'XL';\n"
                + "\n"
                + "UPDATE product\n"
                + "SET count = ?\n"
                + "WHERE id = ?;"
                + "COMMIT;";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setInt(3, price);
            ps.setString(4, description);
            ps.setInt(5, cateID);
            ps.setInt(6, id);
            ps.setInt(7, sizeS);
            ps.setInt(8, id);
            ps.setInt(9, sizeM);
            ps.setInt(10, id);
            ps.setInt(11, sizeL);
            ps.setInt(12, id);
            ps.setInt(13, sizeXL);
            ps.setInt(14, id);
            ps.setInt(15, sizeS + sizeM + sizeL + sizeXL);
            ps.setInt(16, id);
            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    public List<OrderLine> getOrderLine(int id) {
        List<OrderLine> orderline = new ArrayList<>();
        String query = "SELECT o.[oid], o.[pid], o.[quanity], o.price, o.[name], p.[image], o.size\n"
                + "FROM OrderDetails_HE161328 as o\n"
                + "INNER JOIN product as p ON o.pid = p.id\n"
                + "where o.oid = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderline.add(new OrderLine(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return orderline;
    }

    public void deleteOrder(String id) {
        String query = "delete from [OrderDetails_HE161328] where [oid] = ?\n"
                + "delete from [order] where [id] = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void addCategory(String cid, String cname) {
        String query = "insert into category\n" + "values(?)";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, cname);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void deleteCategory(String cid) {
        String query = "UPDATE product\n"
                + "SET cateID = null\n"
                + "WHERE cateID = ?;\n"
                + "DELETE FROM Category_HE161328 WHERE cid = ?;";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            ps.setString(2, cid);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public Category getCategoryAdmin(int id) {

        String query = "select * from [category]\n"
                + "where [cid] = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editerCategory(String cname, int cid) {
        String query = "update [category]\n"
                + "set [cname] = ?\n"
                + "where [cid] = ?;";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, cname);
            ps.setInt(2, cid);
            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    public void editProfile(String firstname, String lastname, String gender, String email, String phone, String address, String uid) {
        String query = "update account\n"
                + "set [firstname] = ?,\n"
                + "[lastname] = ?,\n"
                + "[gender] = ?,\n"
                + "[email] = ?,\n"
                + "[phone] = ?,\n"
                + "[address] = ?\n"
                + "where [uid] = ?;";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, gender);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, address);
            ps.setString(7, uid);
            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    public Account getListAccount(String user) {

        String query = "select * from [account]" + "where [user] = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account getOTP(String user) {
        String query = "select * from account\n"
                + "where [user] = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12));
            }
        } catch (Exception e) {
        }

        return null;

    }

    public void addUserAdmin(String userName, String password, String isAdmin, String firstname, String lastname, String security, String email, int setActive) {
        String query = "insert into account\n" + "values(?,?,?,?,?,?,?,null,null,null,?)";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, isAdmin);
            ps.setString(4, firstname);
            ps.setString(5, lastname);
            ps.setString(6, security);
            ps.setString(7, email);
            ps.setInt(8, setActive);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public Category getNameCategory(int id) {
        String query = "select * from category\n" + "where [cid] = ?\n";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Product> get4NewProduct() {
        List<Product> list = new ArrayList<>();

        String query = "select top 4 * from product\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<ProductSize> getSizePid(int pid) {
        List<ProductSize> list = new ArrayList<>();

        String query = "select * from ProductSize\n"
                + "where pid = ?";
        try {
            conn = new DBContext().getConnection(); //ket noi sql server
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductSize(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public static void main(String[] args) {

        DAO dao = new DAO();

        System.out.println(dao.getTotalUserAdmin());

    }
}
