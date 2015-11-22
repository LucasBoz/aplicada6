package br.edu.udc.aplicada6.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;


public class DatabasePool {
	private static DatabasePool databasePool = null;
	
	private Connection connectionList[];
	private String driverClassName;
	private String userName;
	private String password;
	private String host;
	private String port;
	private String databaseName;
	private String url;
	private Integer maxConnections;
	private Boolean testOnBorrow;
	private String sqlTest;
	private Integer currentConnectionId;
	
	private DatabasePool() throws Exception {
		InputStream input = null;
		Properties prop = new Properties();
		try {
			System.out.println(this.getClass().getResource("/").getFile() + "../config.properties");
			input = new FileInputStream(this.getClass().getResource("/").getFile() + "../config.properties");
			prop.load(input);
			
			this.userName = prop.getProperty("userName");
			this.password = prop.getProperty("password");
			this.databaseName = prop.getProperty("databaseName");
			this.driverClassName = prop.getProperty("driverClassName");
			this.host = prop.getProperty("host");
			this.port = prop.getProperty("port");
			this.url = prop.getProperty("url") + "://" + this.host + ":" + this.port	+ "/" + this.databaseName;
			
			this.maxConnections = Integer.parseInt(prop.getProperty("maxConnections"));
			this.testOnBorrow = prop.getProperty("testOnBorrow").equals("true");
			this.sqlTest = prop.getProperty("sqlTest");
			this.currentConnectionId = 0;
			
			this.initialize();	
		} catch (Exception e) {
			throw e;
		} finally {
			if (input != null) {
				input.close();
			}
		}	
	}
	
	private void initialize() throws Exception {
		Class.forName(this.driverClassName);
		this.connectionList = new Connection[this.maxConnections];
		for (int i = 0; i < connectionList.length; i++) {
			this.connect(i);
		}
	}
	
	private void connect(Integer connectionId) throws Exception {
		this.connectionList[connectionId] = DriverManager.getConnection(this.url, this.userName, this.password);
		this.connectionList[connectionId].setAutoCommit(false);
	}
	

	
	private void disconnect(Integer connectionId) throws Exception {
		this.connectionList[connectionId].close();
	}
	
	private void testConnection(Integer connectionId) throws Exception {
		Statement stmt = null;
		ResultSet rst = null;
		try {
			stmt = this.connectionList[connectionId].createStatement();
			rst = stmt.executeQuery(this.sqlTest);
			rst.next();
		} catch (Exception e) {
			this.connect(connectionId);
		} finally {
			if (rst != null) {
				rst.close();
			}			
			if (stmt != null) {
				stmt.close();
			}
		}
	}
	
	public Connection getConnection() throws Exception {
		Connection currentConnetion = this.connectionList[this.currentConnectionId];
		if (this.testOnBorrow) {
			this.testConnection(this.currentConnectionId);
		}
		this.currentConnectionId++;
		if (this.currentConnectionId >= this.maxConnections) {
			this.currentConnectionId = 0;
		}
		return currentConnetion;
	}
	
	public static DatabasePool getInstance() throws Exception {
		if (databasePool == null) {
			databasePool = new DatabasePool();
		}
		return databasePool;
	}
}