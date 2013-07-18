package com.fzy.core.entity;
import java.util.ArrayList;
import java.util.List;

/**
 * Object to represent a SQL parameter definition.
 *
 * <p>Parameters may be anonymous, in which case "name" is <code>null</code>.
 * However, all parameters must define a SQL type according to {@link java.sql.Types}.
 *
 * @author Rod Johnson
 * @author Thomas Risberg
 * @see java.sql.Types
 */
public class SqlParameter {

	private final String name;

	/** SQL type constant from <code>java.sql.Types</code> */
	private final int sqlType;

	/** Used for types that are user-named like: STRUCT, DISTINCT, JAVA_OBJECT, named array types */
	private final String typeName;


	/**
	 * Create a new anonymous SqlParameter, supplying SQL type.
	 * @param sqlType SQL type of the parameter according to java.sql.Types
	 */
	public SqlParameter(int sqlType) {
		this(null, sqlType, null);
	}

	/**
	 * Create a new anonymous SqlParameter, supplying SQL type.
	 * @param sqlType SQL type of the parameter according to <code>java.sql.Types</code>
	 * @param typeName the type name of the parameter (optional)
	 */
	public SqlParameter(int sqlType, String typeName) {
		this(null, sqlType, typeName);
	}

	/**
	 * Create a new SqlParameter, supplying name and SQL type.
	 * @param name name of the parameter, as used in input and output maps
	 * @param sqlType SQL type of the parameter according to <code>java.sql.Types</code>
	 */
	public SqlParameter(String name, int sqlType) {
		this(name, sqlType, (String) null);
	}
	
	/**
	 * Create a new SqlParameter, supplying name and SQL type.
	 * @param name name of the parameter, as used in input and output maps
	 * @param sqlType SQL type of the parameter according to <code>java.sql.Types</code>
	 * @param typeName the type name of the parameter (optional)
	 */
	public SqlParameter(String name, int sqlType, String typeName) {
		this.name = name;
		this.sqlType = sqlType;
		this.typeName = typeName;
	}


	/**
	 * Return the name of the parameter.
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * Return the SQL type of the parameter.
	 */
	public int getSqlType() {
		return this.sqlType;
	}

	/**
	 * Return the type name of the parameter, if any.
	 */
	public String getTypeName() {
		return this.typeName;
	}


	/**
	 * Convert a list of JDBC types, as defined in <code>java.sql.Types</code>,
	 * to a List of SqlParameter objects as used in this package.
	 */
	public static List sqlTypesToAnonymousParameterList(int[] types) {
		List result = new ArrayList();
		if (types != null) {
			for (int i = 0; i < types.length; i++) {
				result.add(new SqlParameter(types[i]));
			}
		}
		return result;
	}

}
