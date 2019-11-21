package com.capg.Dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.capg.Model.User;

public class RegisterDao {
	static int status=0;
	public static int register(User u)
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sandhya","sandhya07");
			PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?)");  
			ps.setString(1,u.getUname());  
			ps.setString(2,u.getUemail());  
			ps.setString(3,u.getUpass());  
			              
			 status=ps.executeUpdate();  
//			if(status>0)
//				System.out.println(" successfully registered");
//			else
//				System.out.println("not registered");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
		
		
		public static User login(User u)
		{
			
		
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sandhya","sandhya07");
				PreparedStatement ps=con.prepareStatement("select * from users");  
				
				
				ResultSet rs = ps.executeQuery();
			    while(rs.next()) {
			    	u.setUname(rs.getString(1)); 
			    	u.setUpass(rs.getString(2));
			    	u.setUemail(rs.getString(3));
			    	
			    }
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		return u;
	}
}
