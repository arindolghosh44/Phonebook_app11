package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entity.Contact;
import com.entity.User;

public class ContactDAO {

	private Connection conn;

	public ContactDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean saveContact(Contact u) {
		boolean f=false;
		
		try {
			String query="insert into contact(name,email,phno,about,userid) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,u.getName());
			ps.setString(2,u.getEmail());
			ps.setString(3,u.getPhno());
			ps.setString(4,u.getAbout());
			ps.setInt(5, u.getUserId());
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
	public List<Contact> getData(int id) {
		List<Contact> list = new ArrayList<Contact>();
		Contact po = null;
		try {
			String qu = "select * from contact where userid=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				po=new Contact();
				po.setId(rs.getInt(1));
				po.setName(rs.getString(2));
				po.setEmail(rs.getString(3));
				po.setPhno(rs.getString(4));
				po.setAbout(rs.getString(5));
				list.add(po);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public Contact getDataById(int cid)
	{
		Contact p=null;
		try {
			String qu="select * from contact where id=?";
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setInt(1, cid);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				p=new Contact();
				p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setEmail(rs.getString(3));
			p.setPhno(rs.getString(4));
			p.setAbout(rs.getString(5));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return p;
	}
	
	public boolean updateContact(Contact u) {
		boolean f=false;
		
		try {
			String query="update contact  set name=?,email=?,phno=?,about=? where id=? ";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,u.getName());
			ps.setString(2,u.getEmail());
			ps.setString(3,u.getPhno());
			ps.setString(4,u.getAbout());
			ps.setInt(5, u.getId());
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

	public boolean DeleteNotes( int cid) {
		boolean f = false;
		try {
			String qu = "delete from contact where id=?";
			PreparedStatement ps = conn.prepareStatement(qu);
			
			ps.setInt(1, cid);

		int i=ps.executeUpdate();
		if(i==1)
		{
			f=true;
		}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
}
