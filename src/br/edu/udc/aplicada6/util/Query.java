package br.edu.udc.aplicada6.util;

import java.lang.reflect.Field;

import br.edu.udc.aplicada6.annotation.Column;
import br.edu.udc.aplicada6.annotation.GeneratedValue;
import br.edu.udc.aplicada6.annotation.Id;

public class Query {
	
	private static String getIdFieldName(Object obj) throws Exception {
		Field idField = Reflection.getIdField(obj.getClass());
		Column column = idField.getAnnotation(Column.class);
		return column.name();
	}
	
	private static String getFieldFormattedValue(Field field, Object obj) throws Exception {
		Column column = field.getAnnotation(Column.class);
		Object value = Reflection.getFieldValue(field, obj);
		if (value != null) {
			if ((column.type() == Column.BOOLEAN) ||
				(column.type() == Column.INTEGER) ||
				(column.type() == Column.LONG) ||
				(column.type() == Column.FLOAT)) {
				return String.valueOf(value);
			} else if (column.type() == Column.OBJECT) {
				Object idFK = Reflection.getIdFieldValue(value);
				if (idFK == null) {
					return "null";
				} else {
					return String.valueOf(idFK);
				}				
			} else {
				return "'" + value + "'";
			}
		} else {
			return "null";
		}
	}
	
	private static String getFieldNames(Object obj, Boolean bId) throws Exception {
		Field fieldList[] = Reflection.getFields(obj.getClass(), false);
		String result = "";
		Boolean bFirst = true;
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			if ((bId) ||
				((!field.isAnnotationPresent(Id.class)) &&
				 (!field.isAnnotationPresent(GeneratedValue.class)))) {
				Column column = field.getAnnotation(Column.class);
				if (bFirst) {
					result = column.name();
					bFirst = false;
				} else {
					result += "," + column.name();
				}
			}
		}
		return result;
	}

	private static String getFieldValues(Object obj, Boolean bId) throws Exception {
		Field fieldList[] = Reflection.getFields(obj.getClass(), false);
		String result = "";
		Boolean bFirst = true;
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			if ((bId) ||
				((!field.isAnnotationPresent(Id.class)) &&
				 (!field.isAnnotationPresent(GeneratedValue.class)))) {
				String formattedValue = Query.getFieldFormattedValue(field,obj);
				if (bFirst) {
					result = formattedValue;
					bFirst = false;
				} else {
					result += "," + formattedValue;
				}
			}
		}
		return result;
	}
	
	private static String getFieldNamesValues(Object obj) throws Exception {
		Field fieldList[] = Reflection.getFields(obj.getClass(), false);
		String result = "";
		Boolean bFirst = true;
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			if ((!field.isAnnotationPresent(Id.class)) &&
				(!field.isAnnotationPresent(GeneratedValue.class))) {
				Column column = field.getAnnotation(Column.class);
				String pattern = column.name() + " = " + Query.getFieldFormattedValue(field,obj);
				if (bFirst) {
					result = pattern;
					bFirst = false;
				} else {
					result += "," + pattern;
				}
			}
		}
		return result;
	}
	
	private static String getSQLWhere(Object obj) throws Exception {
		Field fieldList[] = Reflection.getFields(obj.getClass(), false);
		String result = "";
		Boolean bFirst = true;
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			Object value = Reflection.getFieldValue(field, obj);
			if ((value != null) &&
				(!value.toString().trim().equals("")) &&
				(!value.toString().trim().equals("null"))) {
				Column column = field.getAnnotation(Column.class);
				String pattern = "";
				
				if ((column.type() == Column.BOOLEAN) ||
					(column.type() == Column.INTEGER) ||
					(column.type() == Column.LONG) ||
					(column.type() == Column.FLOAT)) {
					pattern = column.name() + " = " + String.valueOf(value);
				} else if (column.type() == Column.OBJECT) {
					Object idFK = Reflection.getIdFieldValue(value);
					if (idFK != null) {
						pattern = column.name() + " = " + String.valueOf(idFK);
					}	
				} else if (column.type() == Column.STRING) {
					pattern = column.name() + " like '%" + String.valueOf(value).replace(" ", "%") + "%'";
				} else {
					pattern = column.name() + " = '" + String.valueOf(value) + "'";
				}				
				if (bFirst) {
					result = " where " + pattern;
					bFirst = false;
				} else {
					result += " and " + pattern;
				}
			}
		}
		return result;
	}
	
	public static String getSQLInsert(Object obj) throws Exception {
		return "insert into " + Reflection.getTableName(obj.getClass()) +
			   " (" + Query.getFieldNames(obj,false) + ")" +
			   " values(" + Query.getFieldValues(obj,false) + ")";
	}
	
	public static String getSQLUpdate(Object obj) throws Exception {
		return "update " + Reflection.getTableName(obj.getClass()) +
			   " set " + Query.getFieldNamesValues(obj) + 
			   " where " + Query.getIdFieldName(obj) + " = " + Reflection.getIdFieldValue(obj);
	}
	
	public static String getSQLDelete(Object obj) throws Exception {
		return "delete from " + Reflection.getTableName(obj.getClass()) + 
			   " where " + Query.getIdFieldName(obj) + " = " + Reflection.getIdFieldValue(obj);
	}
	
	public static String getSQLSelect(Object obj) throws Exception {
		return "select " + Query.getFieldNames(obj,true) + 
			   " from " + Reflection.getTableName(obj.getClass()) +
			   Query.getSQLWhere(obj);
	}
}
