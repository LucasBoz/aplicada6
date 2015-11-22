package br.edu.udc.aplicada6.session;

import br.edu.udc.aplicada6.dao.Dao;

public abstract class Session {

	protected Dao dao;
	
	public Session(Dao dao) {
		this.dao = dao;
	}
	
	public void save(Object obj) throws Exception {
		this.save(obj,true);
	}
	
	public void save(Object obj, Boolean bCommit) throws Exception {
		this.dao.save(obj);
		if (bCommit) {
			this.dao.commit();
		}
	}
	
	public void remove(Object obj) throws Exception {
		this.remove(obj,true);
	}
	
	public void remove(Object obj, Boolean bCommit) throws Exception {
		this.dao.remove(obj);
		if (bCommit) {
			this.dao.commit();
		}
	}
	
	public Object detail(Object obj) throws Exception {
		return this.findByPrimaryKey(obj);
	}
	
	public Object findByPrimaryKey(Object obj) throws Exception {
		return this.dao.findByPrimaryKey(obj);
	}
	
	public Object[] find(Object obj) throws Exception {
		return this.dao.find(obj);
	}	
}