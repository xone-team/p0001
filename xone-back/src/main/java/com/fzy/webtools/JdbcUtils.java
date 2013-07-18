package com.fzy.webtools;

import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Generic utility methods for working with JDBC. Mainly for internal use
 * within the framework, but also useful for custom JDBC access code.
 *
 * @author Thomas Risberg
 * @author Juergen Hoeller
 */
public abstract class JdbcUtils {

	private static final Log log = LogFactory.getLog(JdbcUtils.class);


	/**
	 * Close the given JDBC Connection and ignore any thrown exception.
	 * This is useful for typical finally blocks in manual JDBC code.
	 * @param con the JDBC Connection to close (may be <code>null</code>)
	 */
	public static void closeConnection(Connection con) {
		if (con != null) {
			try {
				con.close();
			}
			catch (SQLException ex) {
				log.debug("Could not close JDBC Connection", ex);
			}
			catch (Throwable ex) {
				// We don't trust the JDBC driver: It might throw RuntimeException or Error.
				log.debug("Unexpected exception on closing JDBC Connection", ex);
			}
		}
	}

	/**
	 * Close the given JDBC Statement and ignore any thrown exception.
	 * This is useful for typical finally blocks in manual JDBC code.
	 * @param stmt the JDBC Statement to close (may be <code>null</code>)
	 */
	public static void closeStatement(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			}
			catch (SQLException ex) {
				log.debug("Could not close JDBC Statement", ex);
			}
			catch (Throwable ex) {
				// We don't trust the JDBC driver: It might throw RuntimeException or Error.
				log.debug("Unexpected exception on closing JDBC Statement", ex);
			}
		}
	}

	/**
	 * Close the given JDBC ResultSet and ignore any thrown exception.
	 * This is useful for typical finally blocks in manual JDBC code.
	 * @param rs the JDBC ResultSet to close (may be <code>null</code>)
	 */
	public static void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			}
			catch (SQLException ex) {
				log.debug("Could not close JDBC ResultSet", ex);
			}
			catch (Throwable ex) {
				// We don't trust the JDBC driver: It might throw RuntimeException or Error.
				log.debug("Unexpected exception on closing JDBC ResultSet", ex);
			}
		}
	}

	/**
	 * Retrieve a JDBC column value from a ResultSet, using the most appropriate
	 * value type. The returned value should be a detached value object, not having
	 * any ties to the active ResultSet: in particular, it should not be a Blob or
	 * Clob object but rather a byte array respectively String representation.
	 * <p>Uses the <code>getObject(index)</code> method, but includes additional "hacks"
	 * to get around Oracle 10g returning a non-standard object for its TIMESTAMP
	 * datatype and a <code>java.sql.Date</code> for DATE columns leaving out the
	 * time portion: These columns will explicitly be extracted as standard
	 * <code>java.sql.Timestamp</code> object.
	 * @param rs is the ResultSet holding the data
	 * @param index is the column index
	 * @return the value object
	 * @throws SQLException if thrown by the JDBC API
	 * @see java.sql.Blob
	 * @see java.sql.Clob
	 * @see java.sql.Timestamp
	 */
	public static Object getResultSetValue(ResultSet rs, int index) throws SQLException {
		Object obj = rs.getObject(index);
		if (obj instanceof Blob) {
			obj = rs.getBytes(index);
		}
		else if (obj instanceof Clob) {
			obj = rs.getString(index);
		}
		else if (obj != null && obj.getClass().getName().startsWith("oracle.sql.TIMESTAMP")) {
			obj = rs.getTimestamp(index);
		}
		else if (obj != null && obj.getClass().getName().startsWith("oracle.sql.DATE")) {
			String metaDataClassName = rs.getMetaData().getColumnClassName(index);
			if ("java.sql.Timestamp".equals(metaDataClassName) ||
					"oracle.sql.TIMESTAMP".equals(metaDataClassName)) {
				obj = rs.getTimestamp(index);
			}
			else {
				obj = rs.getDate(index);
			}
		}
		else if (obj != null && obj instanceof java.sql.Date) {
			if ("java.sql.Timestamp".equals(rs.getMetaData().getColumnClassName(index))) {
				obj = rs.getTimestamp(index);
			}
		}
		return obj;
	}

	/**
	 * Count the occurrences of the character <code>placeholder</code> in an SQL string
	 * <code>str</code>. The character <code>placeholder</code> is not counted if it
	 * appears within a literal as determined by the <code>delim</code> that is passed in.
	 * Delegates to the overloaded method that takes a String with multiple delimiters.
	 * @param str string to search in. Returns 0 if this is null.
	 * @param placeholder the character to search for and count
	 * @param delim the delimiter for character literals
	 */
	public static int countParameterPlaceholders(String str, char placeholder, char delim) {
		return countParameterPlaceholders(str, placeholder, "" + delim);
	}

	/**
	 * Count the occurrences of the character <code>placeholder</code> in an SQL string
	 * <code>str</code>. The character <code>placeholder</code> is not counted if it
	 * appears within a literal as determined by the <code>delimiters</code> that are passed in.
	 * <p>Examples: If one of the delimiters is the single quote, and the character to count the
	 * occurrences of is the question mark, then:
	 * <p><code>The big ? 'bad wolf?'</code> gives a count of one.<br>
	 * <code>The big ?? bad wolf</code> gives a count of two.<br>
	 * <code>The big  'ba''ad?' ? wolf</code> gives a count of one.
	 * <p>The grammar of the string passed in should obey the rules of the JDBC spec
	 * which is close to no rules at all: one placeholder per parameter, and it should
	 * be valid SQL for the target database.
	 * @param str string to search in. Returns 0 if this is null
	 * @param placeholder the character to search for and count.
	 * @param delimiters the delimiters for character literals.
	 */
	public static int countParameterPlaceholders(String str, char placeholder, String delimiters) {
		int count = 0;
		boolean insideLiteral = false;
		int activeLiteral = -1;
		for (int i = 0; str != null && i < str.length(); i++) {
			if (str.charAt(i) == placeholder) {
				if (!insideLiteral)
					count++;
			}
 			else {
				if (delimiters.indexOf(str.charAt(i)) > -1) {
					if (!insideLiteral) {
						insideLiteral = true;
						activeLiteral = delimiters.indexOf(str.charAt(i));
					}
					else {
						if (activeLiteral == delimiters.indexOf(str.charAt(i))) {
							insideLiteral = false;
							activeLiteral = -1;
						}
					}
				}
			}
		}
		return count;
	}

	/**
	 * Check whether the given SQL type is numeric.
	 * @param sqlType the SQL type to be checked
	 * @return whether the type is numeric
	 */
	public static boolean isNumeric(int sqlType) {
		return Types.BIT == sqlType || Types.BIGINT == sqlType || Types.DECIMAL == sqlType ||
				Types.DOUBLE == sqlType || Types.FLOAT == sqlType || Types.INTEGER == sqlType ||
				Types.NUMERIC == sqlType || Types.REAL == sqlType || Types.SMALLINT == sqlType ||
				Types.TINYINT == sqlType;
	}



}
