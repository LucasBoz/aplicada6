package br.edu.udc.aplicada6.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import br.edu.udc.aplicada6.util.DatabasePool;
import br.edu.udc.aplicada6.util.Factory;
import br.edu.udc.aplicada6.util.Query;
import br.edu.udc.aplicada6.util.Reflection;

public abstract class Dao {

	protected Connection connection;
	
	public Dao() throws Exception {
		this.connection = DatabasePool.getInstance().getConnection();
	}
	
	public Dao(Connection connection) throws Exception {
		this.connection = connection;
	}
	
	public Connection getConnection() {
		return this.connection;
	}
	
	public void setConnection(Connection connection) {
		this.connection = connection;
	}
	
	public void commit() throws Exception {
		this.connection.commit();
	}
	
	public void rollback() throws Exception {
		this.connection.rollback();
	}
	
	public void save(Object obj) throws Exception {
		if (obj != null) {
			Statement stmt = null;
			ResultSet rst = null;
			try {
				stmt = this.connection.createStatement();
				if (Reflection.getIdFieldValue(obj) == null) {
					String sql = Query.getSQLInsert(obj);
					System.out.println(sql);
					stmt.execute(sql,Statement.RETURN_GENERATED_KEYS);
					rst = stmt.getGeneratedKeys();
					if (rst.next()) {
						Reflection.setIdFieldValue(obj,rst.getInt(1));
					}								
				} else {
					String sql = Query.getSQLUpdate(obj);
					System.out.println(sql);
					stmt.execute(sql);
				}
			} catch (Exception e) {
				try {
					if (this.connection != null) {
						this.rollback();
					}
				} catch (Exception e2) {}
				throw e; 
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (Exception e2) {}
				}
				if (rst != null) {
					try {
						rst.close();
					} catch (Exception e2) {}
				}
			}
		}
	}
	
	public void remove(Object obj) throws Exception {
		if (obj != null) {
			Statement stmt = null;
			ResultSet rst = null;
			try {
				if (Reflection.getIdFieldValue(obj) != null) {
					stmt = this.connection.createStatement();
					String sql = Query.getSQLDelete(obj);
					System.out.println(sql);
					stmt.execute(sql);
				} 
			} catch (Exception e) {
				try {
					if (this.connection != null) {
						this.rollback();
					}
				} catch (Exception e2) {}
				throw e; 
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (Exception e2) {}
				}
				if (rst != null) {
					try {
						rst.close();
					} catch (Exception e2) {}
				}
			}
		}
	}
	
	public Object findByPrimaryKey(Object obj) throws Exception {
		Object idValue = Reflection.getIdFieldValue(obj);
		if (idValue != null) {
			Object objPK = obj.getClass().newInstance();
			Reflection.setIdFieldValue(objPK,idValue);
			Object listPK[] = this.find(objPK);
			if (listPK.length > 0) {
				return listPK[0];
			}
		}
		return null;
	}
	
	public Object[] find(Object obj) throws Exception {
		if (obj != null) {
			Statement stmt = null;
			ResultSet rst = null;
			try {
				stmt = this.connection.createStatement();
				String sql = Query.getSQLSelect(obj);
				System.out.println(sql);
				rst = stmt.executeQuery(sql);
				return Factory.createByResultSet(rst, obj);
			} catch (Exception e) {
				try {
					if (this.connection != null) {
						this.rollback();
					}
				} catch (Exception e2) {}
				throw e; 
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (Exception e2) {}
				}
				if (rst != null) {
					try {
						rst.close();
					} catch (Exception e2) {}
				}
			}
		}
		return new Object[0];
	}
}