package Action;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement; 

public class DBconnection {
	public Connection getConnection() {  
        Connection con = null;  //���������������ݿ��Connection����  
        try {  
            Class.forName("com.mysql.jdbc.Driver");// ����Mysql��������  
              
            con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/aa", "root", "123456");// ������������  
              
        } catch (Exception e) {  
            System.out.println("���ݿ�����ʧ��" + e.getMessage() + "llllllllllllllllllllllllllllllll");  
        }  
        return con; //���������������ݿ�����  
    }  
}
