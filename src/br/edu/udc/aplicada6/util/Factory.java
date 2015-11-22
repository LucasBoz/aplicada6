package br.edu.udc.aplicada6.util;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Vector;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.Transient;

public class Factory {

	public static Object[] createByResultSet(ResultSet rst, Object obj) throws Exception {
		Class <?> entityClass = obj.getClass();
		Field fieldList[] = Reflection.getFields(entityClass, false);
		Collection <Object> objectList = new Vector <Object> ();		
		while (rst.next()) {
			Object objLoading = entityClass.newInstance();
			for (int i = 0; i < fieldList.length; i++) {
				Field field = fieldList[i];
				Column column = field.getAnnotation(Column.class);
				switch (column.type()) {
					case Column.CHAR:
						Reflection.setFieldValue(field, objLoading, rst.getString(column.name()));
						break;
					case Column.STRING:
						Reflection.setFieldValue(field, objLoading, rst.getString(column.name()));
						break;
					case Column.DATE:
						Reflection.setFieldValue(field, objLoading, rst.getDate(column.name()));
						break;
					case Column.TIME:
						Reflection.setFieldValue(field, objLoading, rst.getTime(column.name()));
						break;
					case Column.DATETIME:
						Reflection.setFieldValue(field, objLoading, rst.getDate(column.name()));
						break;
					case Column.BOOLEAN:
						Reflection.setFieldValue(field, objLoading, rst.getBoolean(column.name())); 
						break;
					case Column.INTEGER: 
						Reflection.setFieldValue(field, objLoading, rst.getInt(column.name()));
						break;
					case Column.LONG:
						Reflection.setFieldValue(field, objLoading, rst.getLong(column.name()));
						break;
					case Column.FLOAT:
						Reflection.setFieldValue(field, objLoading, rst.getFloat(column.name()));
						break;
					case Column.OBJECT: 
						Object objFK = field.getType().newInstance();
						Reflection.setIdFieldValue(objFK, rst.getInt(column.name()));
						Reflection.setFieldValue(field, objLoading, objFK);
						break;
					default:
						break;
				}
			}
			objectList.add(objLoading);
		}		
		return objectList.toArray(new Object[objectList.size()]);
	}

	private static Object getFormatedValue(Field field, String rawValue) {
		Column column = field.getAnnotation(Column.class);
		int type;
		if (column != null) {
			type = column.type();
		} else {
			Transient transientColumn = field.getAnnotation(Transient.class);
			type = transientColumn.type();
		}
		if (rawValue != null) {
			switch (type) {
				case Column.CHAR:
					if (rawValue.length() > 0) {
						return rawValue.charAt(0);
					}
					break;
				case Column.STRING:
					return rawValue;
				case Column.DATE:
					try {
						SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
						return sdf.parse(rawValue);
					} catch (Exception e) {
						return null;
					}
				case Column.TIME:
					try {
						SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
						return sdf.parse(rawValue);
					} catch (Exception e) {
						return null;
					}
				case Column.DATETIME:
					try {
						SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
						return sdf.parse(rawValue);
					} catch (Exception e) {
						return null;
					}
				case Column.BOOLEAN:
					return (!rawValue.equals("0")) && (!rawValue.equals("false")); 
				case Column.INTEGER:
					try {
						return Integer.parseInt(rawValue);
					} catch (Exception e) {
						return null;
					}
				case Column.LONG:
					try {
						return Long.parseLong(rawValue);
					} catch (Exception e) {
						return null;
					}
				case Column.FLOAT:
					try {
						return Float.parseFloat(rawValue);
					} catch (Exception e) {
						return null;
					}
				case Column.OBJECT:
					try {
						Integer id = Integer.parseInt(rawValue);
						Object objFK = field.getType().newInstance();
						Reflection.setIdFieldValue(objFK, id);
						return objFK;				
					} catch (Exception e) {
						return null;
					}
				default:
					break;
			}
		}
		return null;
	}
		
	public static Object createByPost(HashMap<String, String> postData, Class<?> entityClass) throws Exception {
		Object obj = entityClass.newInstance();
		Field fields[] = Reflection.getFields(entityClass,true);
	
		Iterator <String> iterator = postData.keySet().iterator();
		while (iterator.hasNext()) {
			String postFieldName = iterator.next();
			for (int i = 0; i < fields.length; i++) {
				if (postFieldName.equalsIgnoreCase(fields[i].getName())) {
					Reflection.setFieldValue(fields[i], obj, getFormatedValue(fields[i], postData.get(postFieldName)));
					break;
				}
			}
		}
		return obj;
	}

	public static Object createById(Integer id, Class<?> entityClass) throws Exception {
		Object obj = entityClass.newInstance();
		Reflection.setIdFieldValue(obj, id);
		return obj;
	}
	
}