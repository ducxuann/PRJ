package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://DUCXUAN:1433;databaseName=Y23S1B1;encrypt=true;trustServerCertificate=true";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception ex) {

        }

    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        DBContext a = new DBContext();
        System.out.println(a.connection);

    }

}
