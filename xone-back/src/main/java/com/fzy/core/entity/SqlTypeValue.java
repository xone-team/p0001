package com.fzy.core.entity;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Interface to be implemented for setting values for more complex database specific
 * types not supported by the standard setObject method.
 *
 * <p>Implementations perform the actual work of setting the actual values. They must
 * implement the callback method <code>setTypeValue</code> which can throw SQLExceptions
 * that will be caught and translated by the calling code. This callback method has
 * access to the underlying Connection via the given PreparedStatement object, if that
 * should be needed to create any database-specific objects.
 *
 * @author Thomas Risberg
 * @author Juergen Hoeller
 * @since 1.1
 * @see java.sql.Types
 * @see java.sql.PreparedStatement#setObject
 * @see JdbcTemplate#update(String, Object[], int[])
 * @see org.springframework.jdbc.object.SqlUpdate#update(Object[])
 * @see org.springframework.jdbc.object.StoredProcedure#execute(java.util.Map)
 */
public interface SqlTypeValue {

	/**
	 * Constant that indicates an unknown (or unspecified) SQL type.
	 * Passed into setTypeValue if the original operation method does
	 * not specify a SQL type.
	 * @see java.sql.Types
	 * @see JdbcOperations#update(String, Object[])
	 */
	int TYPE_UNKNOWN = Integer.MIN_VALUE;

	/**
	 * Set the type value on the given PreparedStatement.
	 * @param ps the PreparedStatement to work on
	 * @param paramIndex the index of the parameter for which we need to set the value
	 * @param sqlType SQL type of the parameter we are setting
	 * @param typeName the type name of the parameter (optional)
	 * @throws SQLException if a SQLException is encountered setting parameter values
	 * (that is, there's no need to catch SQLException)
	 * @see java.sql.Types
	 * @see java.sql.PreparedStatement#setObject
	 */
	void setTypeValue(PreparedStatement ps, int paramIndex, int sqlType, String typeName) throws SQLException;

}

