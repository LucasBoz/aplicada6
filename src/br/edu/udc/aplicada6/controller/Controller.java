package br.edu.udc.aplicada6.controller;

import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import br.edu.udc.aplicada6.session.Session;
import br.edu.udc.aplicada6.util.Factory;

public abstract class Controller {

	protected String entityName;
	protected String action;
	protected Class<?> entityClass;
	protected Class<?> sessionClass;
	protected HttpServletRequest request;
	protected Object obj;
	protected Boolean saveFilter;

	Controller(String entityName) throws Exception {
		this.entityName = entityName;
		this.entityClass = Class.forName("br.edu.udc.aplicada6.entity." + entityName);
		this.sessionClass = Class.forName("br.edu.udc.aplicada6.session.Session" + entityName);
	}

	/**
	 * M�todo respons�vel por extrair os dados do objeto que est�o no request.
	 * e retornar um HashMap com esses dados
	 * @return
	 */
	private HashMap<String, String> getPostData() {
		Enumeration<String> parameters = this.request.getParameterNames();
		HashMap<String, String> postData = new HashMap<String, String>();
		while (parameters.hasMoreElements()) {
			String paramName = (String) parameters.nextElement();
			if ((!paramName.equals("newAction")) &&
				(!paramName.equals("entityName")) &&
				(!paramName.equals("id"))) {
				postData.put(paramName, this.request.getParameter(paramName));
			}
		}
		return postData;
	}

	private Object getIdObject() throws Exception {
		Integer id = null;
		try {
			id = new Integer(Integer.parseInt(request.getParameter("id")));
		} catch (Exception e) {
			return null;
		}
		return Factory.createById(id, this.entityClass);
	}

	private Object getFilterObject() {
		if (this.action.equals("find")) {
			this.request.getSession().setAttribute("filter" + this.entityName, this.obj);
		} else if ((this.action.equals("goNew")) || (this.action.equals("clean"))) {
			this.request.getSession().removeAttribute("filter" + this.entityName);
		} else if ((this.action.equals("goFind")) || (this.action.equals("remove"))) {
			return (Object) this.request.getSession().getAttribute("filter" + this.entityName);
		}
		return null;
	}

	public void execute(HttpServletRequest request, String action) throws Exception {
		this.request = request;
		this.action = action;
		
		//Guardo no request a a��o que est� sendo executada
		this.request.setAttribute("action", this.action);
		
		this.obj = Factory.createByPost(this.getPostData(), this.entityClass);
		
		Object objFilter = this.getFilterObject();
		Object objId = this.getIdObject();

		Session session = (Session) this.sessionClass.newInstance();
		Object objReturn = null;
		try {
			Method sessionMethod = this.sessionClass.getMethod(this.action, Object.class);
			if (objId != null) {
				objReturn = sessionMethod.invoke(session, objId);
			} else {
				objReturn = sessionMethod.invoke(session, this.obj);
			}

			if (objFilter != null) {
				this.action = "find";
				sessionMethod = sessionClass.getMethod(this.action, Object.class);
				objReturn = sessionMethod.invoke(session, objFilter);
			}

			Method controllerMethod = this.getClass().getMethod(this.action, Object.class);
			controllerMethod.invoke(this, objReturn);

		} catch (NoSuchMethodException e) {
			if (objFilter != null) {
				this.action = "find";
				Method sessionMethod = sessionClass.getMethod(this.action, Object.class);
				objReturn = sessionMethod.invoke(session, objFilter);

				Method controllerMethod = this.getClass().getMethod(this.action, Object.class);
				controllerMethod.invoke(this, objReturn);
			} else {
				Method controllerMethod = this.getClass().getMethod(this.action);
				controllerMethod.invoke(this);
			}
		}
	}

	public void lastFind(Object obj) throws Exception  {
		this.find(obj);
	}

	public void clean() throws Exception {
		this.goFind();
	}

	public abstract void goNew() throws Exception;

	public abstract void goFind() throws Exception;

	public abstract void save(Object obj) throws Exception;

	public abstract void remove(Object obj) throws Exception;

	public abstract void detail(Object obj) throws Exception;
	
	public abstract void find(Object obj) throws Exception;
}