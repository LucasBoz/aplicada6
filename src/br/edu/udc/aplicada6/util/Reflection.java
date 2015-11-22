package br.edu.udc.aplicada6.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Vector;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Entity;
import br.edu.udc.aplicada6.annotation.Id;
import br.edu.udc.aplicada6.annotation.Table;
import br.edu.udc.aplicada6.annotation.Transient;


public class Reflection {

	private static void validate(Class <?> c) throws Exception {
		if (!c.isAnnotationPresent(Entity.class)) {
			throw new Exception("Missing @Entity");
		}
		if (!c.isAnnotationPresent(Table.class)) {
			throw new Exception("Missing @Table");
		}
	}
	
	public static String getTableName(Class <?> c) throws Exception {
		Reflection.validate(c);
		Table table = c.getAnnotation(Table.class);
		return table.tableName();
	}
	
	public static Field getIdField(Class <?> c) throws Exception {
		Reflection.validate(c);
		Field fieldList[] = c.getDeclaredFields();
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			if ((field.isAnnotationPresent(Id.class)) &&
				(field.isAnnotationPresent(Column.class))) {
				return field;
			}
		}
		throw new Exception("Missing @Id");
	}
	
	public static Object getIdFieldValue(Object obj) throws Exception {
		return Reflection.getFieldValue(Reflection.getIdField(obj.getClass()),obj);
	}
	
	public static void setIdFieldValue(Object obj, Object value) throws Exception {
		Reflection.setFieldValue(Reflection.getIdField(obj.getClass()),obj,value);
	}
	
	public static Object getFieldValue(Field field, Object obj) throws Exception {
		Class <?> c = obj.getClass();
		Method methodList[] = c.getDeclaredMethods();
		for (int i = 0; i < methodList.length; i++) {
			Method method = methodList[i];
			if (method.getName().equalsIgnoreCase("get" + field.getName())) {
				return method.invoke(obj, new Object[0]);
			}				
		}
		throw new Exception("Method '" + "get" + field.getName() + "' not found");
	}
	
	public static void setFieldValue(Field field, Object obj, Object value) throws Exception {
		Class <?> c = obj.getClass();
		Method methodList[] = c.getDeclaredMethods();
		Boolean bMethod = false;
		for (int i = 0; i < methodList.length; i++) {
			Method method = methodList[i];
			if (method.getName().equalsIgnoreCase("set" + field.getName())) {
				method.invoke(obj, value);
				bMethod = true;
				break;
			}				
		}
		
		if (!bMethod) {
			throw new Exception("Method '" + "set" + field.getName() + "' not found");
		}
	}
	
	public static Field[] getFields(Class <?> c, Boolean bTransient) throws Exception {
		Reflection.validate(c);
		Field fieldList[] = c.getDeclaredFields();
		Collection<Field> result = new Vector<Field>();
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			if ((field.isAnnotationPresent(Column.class)) &&
				((bTransient) || (!field.isAnnotationPresent(Transient.class)))) {
				result.add(field);
			}
		}
		return result.toArray(new Field[result.size()]);
	}
}