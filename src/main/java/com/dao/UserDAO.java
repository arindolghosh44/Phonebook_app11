package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.entity.User;

public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean userRegister(User u) {
		boolean f=false;
		
		try {
			String query="insert into user(name,email,password) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,u.getName());
			ps.setString(2,u.getEmail());
			ps.setString(3,u.getPassword());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return f;
		
	}
	
	public User loginUser(String e1,String p)
	{
	User f=null;
		try {
			String query="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, e1);
			ps.setString(2, p);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) 
			{
				f=new User();
				f.setId(rs.getInt("id"));
				f.setName(rs.getString("name"));
				f.setEmail(rs.getString("email"));
				f.setPassword("password");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
