package Action;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement; 

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class Person extends ActionSupport{
	private String name="Xiaoming";
	private int ID=1;
	private String sex="male";
	private int age=20;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	//*************************************************************************************************************
	public String UpdatePerson() {
		Statement st;
		DBconnection connect = new DBconnection();
		Connection con = connect.getConnection();
		try{
			String sql = "delete userlist where id = '1'";
			st = (Statement) con.createStatement();
			int count = st.executeUpdate(sql);
			String sql1 = "insert into aa(id,username,sex,age) values('" + ID + "','" + name + "','" + sex + "','" + age + "')" ;
			st = (Statement) con.createStatement(); 
			count = st.executeUpdate(sql1);
			con.close();
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
		return SUCCESS;
	}
}
