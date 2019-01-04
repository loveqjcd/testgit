package main.java.web.web.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCBase {
	private static String url = null;
	private static String userName = null;
	private static String userPwd = null;
	private static String driverClassName = null;
	private static Connection con;
	static {
		Properties pro = new Properties();
		try {
			pro.load(JDBCBase.class.getClassLoader().getResourceAsStream("box.jdbc.properties"));
			driverClassName = pro.getProperty("jdbc.driverClassName").trim();
			url = pro.getProperty("jdbc.url").trim();
			userName = pro.getProperty("jdbc.username").trim();
			userPwd = pro.getProperty("jdbc.password").trim();

		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		try {
			Class.forName(driverClassName);
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		try {
			con = DriverManager.getConnection(url, userName, userPwd);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			con = null;
		}
		return con;
	}
	
	public static void main(String[] args) {
		
	}
	
}
