package Action;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;


import java.util.ArrayList;

import javax.mail.Session;

import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class Activity extends ActionSupport {
	private int activityID;
	private String name;
	private String date;
	private String location;
	private double money;
	private String model;
	
	private int num;
	private int unLockNum;
	private double unLockWeight;
	private int[] ID = new int[4];
	private double[] weight = new double[4];
	private int[] lock = new int[4];
	private double[] payed = new double[4];
	private double[] moneyout = new double[4];
	
	
	static Connection conn;  
	  
    static Statement st; 
    
    
    
	
	public int getActivityID() {
		return activityID;
	}
	public void setActivityID(int activityID) {
		this.activityID = activityID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getUnLockNum() {
		return unLockNum;
	}
	public void setUnLockNum(int unLockNum) {
		this.unLockNum = unLockNum;
	}
	public double getUnLockWeight() {
		return unLockWeight;
	}
	public void setUnLockWeight(double unLockWeight) {
		this.unLockWeight = unLockWeight;
	}
	public int[] getID() {
		return ID;
	}
	public void setID(int[] iD) {
		ID = iD;
	}
	public double[] getWeight() {
		return weight;
	}
	public void setWeight(double[] weight) {
		this.weight = weight;
	}
	public int[] getLock() {
		return lock;
	}
	public void setLock(int[] lock) {
		this.lock = lock;
	}
	public double[] getPayed() {
		return payed;
	}
	public void setPayed(double[] payed) {
		this.payed = payed;
	}
	public double[] getMoneyout() {
		return moneyout;
	}
	public void setMoneyout(double[] moneyout) {
		this.moneyout = moneyout;
	}
	
	public String Insert(){
		DBconnection connection = new DBconnection();
		conn = connection.getConnection(); 
		
		try{
			String sql = "insert into activity values(" + "\"" + name + "\",\"" + date + "\",\"" + location + "\"," + money + "," + num + ")";// 更新数据的sql语句  
	        st = (Statement) conn.createStatement();    //创建用于执行静态sql语句的Statement对象，st属局部变量    
	        int count = st.executeUpdate(sql);// 执行更新操作的sql语句，返回更新数据的个
	        System.out.println("staff表中更新 " + count + " 条数据");      //输出更新操作的处理结果    
	        conn.close();   //关闭数据库连接 
		}catch(SQLException e){
			System.out.println("数据库连接失败" + e.getMessage());
		}
		return SUCCESS;
	}
	
	public String InsertPerson(){
		DBconnection connection = new DBconnection();
		conn = connection.getConnection();
		
		try{
			System.out.println(num);
			for (int i = 0; i < num; i++) {
				   moneyout[i] = weight[i] * money;
			 }
			System.out.println("insert into person values(" + "ID" + ",\"" + name + "\"," + "weight" + ")");
			for(int i = 0; i < num; i++){
				String sql = "insert into person values(" + ID[i] + ",\"" + name + "\"," + weight[i] + ")";// 更新数据的sql语句  
		        st = (Statement) conn.createStatement();    //创建用于执行静态sql语句的Statement对象，st属局部变量    
		        int count = st.executeUpdate(sql);// 执行更新操作的sql语句，返回更新数据的个
		        System.out.println("staff表中更新 " + count + " 条数据");      //输出更新操作的处理结果    
			}
			conn.close();   //关闭数据库连接
		}catch(SQLException e){
			System.out.println("数据库加载失败" + e.getMessage());
		}
		return SUCCESS;
	}
	
	/*public static void main (String arg[]){
		Activity ac = new Activity();
		ac.InsertPerson();
	}*/
}
