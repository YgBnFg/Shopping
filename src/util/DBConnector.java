package util;

import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnector {
	public static Connection getConnection(){
		try {  
			Class.forName("com.mysql.jdbc.Driver");     //¼ÓÔØMYSQL JDBCÇý¶¯³ÌÐò     
			Connection connect = DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/test","root","sg0910");
			//System.out.println("11111");
			return connect;
		} catch (Exception e) {  
			System.out.print("get data error!");  
			e.printStackTrace();  
			return null;
		}  
	}
}