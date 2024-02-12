package javawebapplication.utitlity;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;
import com.mchange.v2.c3p0.ComboPooledDataSource;


public class JDBCDataSource {
	
    private static JDBCDataSource datasource;
    private JDBCDataSource() {
    }
    private ComboPooledDataSource cpds = null;


    public static JDBCDataSource getInstance() {
        if (datasource == null) {
            ResourceBundle rb = ResourceBundle.getBundle("javawebapplication.System");
            datasource = new JDBCDataSource();
            datasource.cpds = new ComboPooledDataSource();
            try {
                datasource.cpds.setDriverClass(rb.getString("driver"));
            } catch (Exception e) {
                e.printStackTrace();
            }
            datasource.cpds.setJdbcUrl(rb.getString("url"));
            datasource.cpds.setUser(rb.getString("username"));
            datasource.cpds.setPassword(rb.getString("password"));
            datasource.cpds.setInitialPoolSize(Integer.parseInt(rb.getString("initialPoolSize")));
            datasource.cpds.setAcquireIncrement(Integer.parseInt(rb.getString("acquireIncrement")));
            datasource.cpds.setMaxPoolSize(Integer.parseInt(rb.getString("maxPoolSize")));
            datasource.cpds.setMaxIdleTime(DataUtility.getInt(rb.getString("timeout")));
            datasource.cpds.setMinPoolSize(Integer.parseInt(rb.getString("minPoolSize")));
        }
        return datasource;
    }

    public static Connection getConnection() throws SQLException {
        try {
            return getInstance().cpds.getConnection();
        } catch (SQLException e) {
            throw e;
        } catch (Exception e) {
            throw new SQLException("Exception in getting connection");
        }
    }

    public static void closeConnection(Connection connection, Statement statement) {
        try {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            // Log or handle the exception as needed
        }
    }
    
    
    public static void main(String[] args) {
    	JDBCDataSource jbdc = new JDBCDataSource();
    	try {
			Connection con = JDBCDataSource.getConnection();
			System.out.print(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
}

/*
JDBC DataSource Connection pool is a group predefine ready to use connection objects.
If we required to communicate with the database multiple time then it is not recommended to create a separate connection object every time. 
Because creating and destroying connection object every time will affect the performance of the application. 
To overcome this performance problem we use the DataSource Connection pooling.

If we want to create a Database connection then we request to Connection pool to provide a connection, 
By using this Connection we can communicate with the database. After completing the work we can return the connection to the pool instead of destroying it.

Advantage of the JDBC DataSource connection is we can use the same connection multiple times
that definitely going to improve the performance of the application.
*/



// DriverManager


/* import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

 try {

ResourceBundle rb = ResourceBundle.getBundle("javawebapplication.System");
String url = rb.getString("url");
System.out.println("Database URL is: " + url);

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javawebproject", "root", "SASDsfdsf232413L");
System.out.println(con);
Statement stmt =con.createStatement();
stmt.executeUpdate("insert into user_table(name, password) values('newname', 'Apassword123')");


} catch (ClassNotFoundException e) {
System.err.println("Error loading JDBC driver: " + e.getMessage());
} catch (SQLException e) {
System.err.println("Error establishing database connection: " + e.getMessage());
} catch (Exception e) {
System.err.println("Unexpected error: " + e.getMessage());

}*/