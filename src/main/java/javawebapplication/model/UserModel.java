package javawebapplication.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javawebapplication.bean.UserBean;
import javawebapplication.utitlity.JDBCDataSource;

public class UserModel {

	/*UserModel will used to contains all the method related database transactions for users. 
	 * Like Insert, Delete, Update. 
	 * In this code, we add only a method to register users and going to make update the same class for upcoming tutorials related to user activity.
	
	DONT TO FORGET TO UPDATE THE DESCRIPTION
	
	*/
	  public static long nextPk() {
		    long pk = 0;
		    Connection conn;
		    try {
		      conn = JDBCDataSource.getConnection();
		      PreparedStatement stmt = conn.prepareStatement("select Max(id)from user");
		      ResultSet rs = stmt.executeQuery();
		      while(rs.next()){
		        pk = rs.getLong(1);
		      }
		    } catch (Exception e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    }
		    return pk+1;
		    
		  }
		  
	  public static long addUser(UserBean user) {
		    int i = 0;
		    try {
		      Connection conn = JDBCDataSource.getConnection();
		      PreparedStatement stmt = conn.prepareStatement("insert into user values(?,?,?,?,?,?,?,?)");
		      stmt.setLong(1, nextPk());
		      stmt.setString(2 , user.getFirstName() );
		      stmt.setString(3 , user.getLastName() );
		      stmt.setString(4 , user.getName() );
		      stmt.setString(5 , user.getPassword() );
		      stmt.setDate(6 , new java.sql.Date(user.getDob().getTime()) );
		      stmt.setString(7 , user.getMobileNo());
		      stmt.setBoolean(8, user.isRoot()); // Set the isRoot field
		        i =     stmt.executeUpdate();
		      
		    } catch (Exception e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    }
		    
		    
		    return i;
		  }
		
// this method checks and connects to the database for login purposes
public static UserBean UserLogin(String name,String password) {
    Connection con;
    UserBean user = null;
    try {
      con = JDBCDataSource.getConnection();
      PreparedStatement stmt = con.prepareStatement("Select * from user where name=? and password = ?");
      stmt.setString(1,name);
      stmt.setString(2,password);
      ResultSet rs = stmt.executeQuery();
      if(rs.next()) {
        user = new UserBean();
        System.out.println("ID: "+rs.getLong("id"));
        user.setId(rs.getLong("id"));
        user.setFirstName(rs.getString("firstName"));
        user.setLastName(rs.getString("lastName"));
        user.setName(rs.getString("name"));
        user.setPassword(rs.getString("password"));
        user.setDob(rs.getDate("dob"));
        user.setMobileNo(rs.getString("mobileNo"));
        user.setRoot(rs.getBoolean("isRoot")); // Get the isRoot field
      }
      
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return user;
  }



public static List list() {
	  ArrayList list=new ArrayList();
	  Connection conn=null;
	  try {
	     conn=JDBCDataSource.getConnection();
	    PreparedStatement pstmt=conn.prepareStatement("Select * from user");
	    ResultSet rs= pstmt.executeQuery();
	    while (rs.next()) {
	    UserBean user=new UserBean();
	    user.setId(rs.getLong("id"));
	    user.setFirstName(rs.getString("firstName"));
	    user.setLastName(rs.getString("lastName"));
	    user.setName(rs.getString("name"));
	    user.setPassword(rs.getString("password"));
	    user.setDob(rs.getDate("dob"));
	    user.setMobileNo(rs.getString("mobileNo"));
	    list.add(user);
	    }
	  } catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	  }finally {
	    JDBCDataSource.closeConnection(conn, null);
	  }
	  return list;
	}


public static UserBean FindByPk(long id) {
    Connection con;
    UserBean user = null;
    try {
      con = JDBCDataSource.getConnection();
      PreparedStatement stmt = con.prepareStatement("Select * from user where id=?");
      stmt.setLong(1, id);// this for above line where the id=?
      ResultSet rs = stmt.executeQuery();
      if (rs.next()) {
        user = new UserBean();
        System.out.println("ID: " + rs.getLong("id"));
        user.setId(rs.getLong("id"));
        user.setFirstName(rs.getString("firstName"));
        user.setLastName(rs.getString("lastName"));
        user.setName(rs.getString("name"));
        user.setPassword(rs.getString("password"));
        user.setDob(rs.getDate("dob"));
        user.setMobileNo(rs.getString("mobileNo"));
      }
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return user;
  }

public static long UpdateUser(UserBean user) {
    int i = 0;
    try {
      Connection conn = JDBCDataSource.getConnection();
      PreparedStatement stmt = conn.prepareStatement("update user set firstname=?, lastname=?, name=?,password=?,dob=?,mobileno=? where id=?");
      
      stmt.setString(1 , user.getFirstName() );
      stmt.setString(2 , user.getLastName() );
      stmt.setString(3 , user.getName() );
      stmt.setString(4 , user.getPassword() );
      stmt.setDate(5 , new java.sql.Date(user.getDob().getTime()) );
      stmt.setString(6 , user.getMobileNo() );
      stmt.setLong(7, user.getId());
        i =   stmt.executeUpdate();
      
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return i;
  }

public static long delete(long id) {
int i = 0;
try {
  Connection conn = JDBCDataSource.getConnection();
  PreparedStatement stmt = conn.prepareStatement("DELETE from user where id=?");
  stmt.setLong(1, id);
  i = stmt.executeUpdate();
} catch (Exception e) {
  // TODO Auto-generated catch block
  e.printStackTrace();
}
return i;
}

}
