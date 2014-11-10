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
	
	public static void insert(){
		DBconnection connection = new DBconnection();
		conn = connection.getConnection();
		
		try{
			 String sql = "update staff set wage='2200' where name = 'lucy'";// 更新数据的sql语句  
	         st = (Statement) conn.createStatement();    //创建用于执行静态sql语句的Statement对象，st属局部变量    
	         int count = st.executeUpdate(sql);// 执行更新操作的sql语句，返回更新数据的个
	         System.out.println("staff表中更新 " + count + " 条数据");      //输出更新操作的处理结果    
	         conn.close();   //关闭数据库连接 
		}catch(SQLException e){
			
		}
	}
	
	public String execute() {
		   
   		/*unLockNum=num;
		unLockWeight=1.00;
		for(int ii=0;ii<num;ii++){
			if(lock[ii] == 1){
				unLockNum=unLockNum-1;
				unLockWeight=unLockWeight-weight[ii];
			}
		}
		for(int iii=0;iii<num;iii++){
			if(lock[iii] == 0){
				weight[iii]=unLockWeight/unLockNum;
			}
		}*/
		for (int i = 0; i < 4; i++) {
			   moneyout[i] = weight[i] * money;
		   }
		return SUCCESS;
	}
}
