package com.fzy.webtools;

import java.io.Serializable;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.springframework.jdbc.core.SqlTypeValue;

import com.fzy.core.entity.MyColumnMapRowMapper;
import com.fzy.core.entity.Page;
import com.fzy.core.entity.RowMapper;
import com.fzy.core.entity.StatementCallback;
import com.fzy.core.entity.ViewList;

public class D {
    private static Log log = LogFactory.getLog(D.class);
    private static boolean charSequenceAvailable;
    public static final int DEFAULT_SEQUENCE_LENGTH = 10;

    static {
        try {
            Class.forName("java.lang.CharSequence");
            charSequenceAvailable = true;
        } catch (ClassNotFoundException ex) {
            charSequenceAvailable = false;
        }
    }

    public static List query(String sql, Object[] params, RowMapper rowMapper) {
        final List result = new ArrayList();
        execute(sql, params, rowMapper, new StatementCallback() {

            public Object doInStatement(ResultSet rs, PreparedStatement ps,
                    RowMapper rowMapper) throws Exception {
                rs = ps.executeQuery();

                int count = 0;
                while (rs.next()) {
                    result.add(rowMapper.mapRow(rs, count));
                    count++;
                }

                return null;
            }
        });

        return result;
    }

    public static ViewList queryViewList(String sql, Object[] params,
            RowMapper rowMapper, ViewList viewList) {
        if (viewList == null)
            viewList = new ViewList();
        final ViewList viewListInCallback = viewList;
        final List results = new ArrayList();

        execute(sql, params, rowMapper, new StatementCallback() {

            public Object doInStatement(ResultSet rs, PreparedStatement ps,
                    RowMapper rowMapper) throws Exception {
                rs = ps.executeQuery();

                // init page
                Page page = viewListInCallback.getPage();
                if (page == null) {
                    page = new Page();
                    viewListInCallback.setPage(page);
                }
                rs.last();
                page.setTotalCount(rs.getRow());
                if (page.getPageSize() < 1) {
                    page.setPageSize(Page.DEFAULT_PAGE_SIZE);
                }
                long pageSize = page.getPageSize();
                pageNoAdjusted(page, page.getTotalCount(), pageSize);
                long pageNo = page.getPageNo();

                int beforeCurrentPageFirst = (int) (((pageNo - 1) * pageSize));
                rs.beforeFirst();

                int count = 0;
                while (rs.next() && count < beforeCurrentPageFirst + pageSize) {
                    if (count >= beforeCurrentPageFirst) {
                        results.add(rowMapper.mapRow(rs, beforeCurrentPageFirst
                                + count));
                    }
                    count++;
                }

                return null;
            }
        });

        viewListInCallback.setResult(results);
        return viewListInCallback;
    }

    public static List query(String sql, RowMapper rowMapper) {
        return query(sql, new Object[] {}, rowMapper);
    }

    public static List query(String sql, Object[] params) {
        return query(sql, params, new MyColumnMapRowMapper());
    }

    public static List query(String sql) {
        return query(sql, new Object[] {}, new MyColumnMapRowMapper());
    }

    public static ViewList queryViewList(String sql, RowMapper rowMapper,
            ViewList viewList) {
        return queryViewList(sql, new Object[] {}, rowMapper, viewList);
    }

    public static ViewList queryViewList(String sql, Object[] params,
            ViewList viewList) {
        return queryViewList(sql, params, new MyColumnMapRowMapper(), viewList);
    }

    public static ViewList queryViewList(String sql, ViewList viewList) {
        return queryViewList(sql, new Object[] {}, new MyColumnMapRowMapper(),
                viewList);
    }

    public static ViewList queryViewList(String sql) {
        return queryViewList(sql, new Object[] {}, new MyColumnMapRowMapper(),
                new ViewList());
    }

    public static Map queryForMap(String sql, Object[] params) {
        Map result = null;
        List list = query(sql, params, new MyColumnMapRowMapper());
        if (list != null && list.size() > 0)
            result = (Map) list.get(0);
        return result;
    }

    public static Object queryForFirst(String sql, Object[] params,
            RowMapper mapper) {
        Object result = null;
        List list = query(sql, params, new MyColumnMapRowMapper());
        if (list != null && list.size() > 0)
            result = list.get(0);
        return result;
    }

    public static Object queryForObject(String sql, Object[] params) {
        Object result = null;
        List list = query(sql, params, new RowMapper() {

            public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
                ResultSetMetaData rsmd = rs.getMetaData();
                int nrOfColumns = rsmd.getColumnCount();
                if (nrOfColumns != 1) {
                    throw new SQLException("Expected single column but found "
                            + nrOfColumns, null, 0);
                }

                // Extract column value from JDBC ResultSet
                Object result = JdbcUtils.getResultSetValue(rs, 0);
                return result;
            }
        });
        if (list != null && list.size() > 0)
            result = list.get(0);
        return result;
    }

    public static Long queryForLong(String sql, Object[] params) {
        Long result = null;
        Object o = queryForObject(sql, params);
        try {
            result = (Long) convertValueToRequiredType(o, Long.class);
        } catch (Exception e) {
            logSqlError(e, sql, params);
        }
        return result;
    }

    public static int updateSql(String sql, Object[] params) {
        logSqlInfo(sql, params);
        Integer n = (Integer) execute(sql, params, null,
                new StatementCallback() {

                    public Object doInStatement(ResultSet rs,
                            PreparedStatement ps, RowMapper rowMapper)
                            throws Exception {

                        int num = ps.executeUpdate();

                        return new Integer(num);
                    }
                });

        return n.intValue();
    }

    public static long getSequence(String sequenceName) throws Exception {
        String sql = "select " + SqlUtils.nextval(sequenceName) + " from dual";
        logSqlDebug(sql, null);
        long number = -1;
        Long n = queryForLong(sql, null);
        if (n != null)
            number = n.longValue();
        return number;
    }

    public static List queryHibernateForList(Class clazz, Criterion[] criterias) {
        List result = null;
        Session s = A.getSesson();
        Criteria c = s.createCriteria(clazz);
        for (int i = 0; i < criterias.length; i++) {
            c.add(criterias[i]);
        }
        result = c.list();
        s.flush();
        s.close();
        return result;
    }

    public static Serializable save(Object o) {
        Serializable result = null;
        Session s = A.getSesson();
        result = s.save(o);
        s.flush();
        s.close();
        return result;
    }

    public static void update(Object o) {
        Session s = A.getSesson();
        s.update(o);
        s.flush();
        s.close();
    }

    public static Object get(Class clazz, Serializable id) {
        Object result = null;
        Session s = A.getSesson();
        result = s.get(clazz, id);
        s.flush();
        s.close();
        return result;
    }

    public static void deleteEntity(Object entity) {
        if (entity == null)
            return;
        Session s = A.getSesson();
        BeanUtils.invokeMethodOne(entity, "setFlagDeleted", String.class, "1");
        saveEntity(entity);
        s.flush();
        s.close();
    }

    public static void delete(Object o) {
        Session s = A.getSesson();
        s.delete(o);
        s.flush();
        s.close();
    }

    public static Serializable saveEntity(Object entity) {
        Object id = BeanUtils.invokeMethodGet(entity, "getId");
        // is creating entity
        boolean isCreated = id == null;
        return saveEntity(entity, isCreated);
    }

    public static Serializable saveEntity(Object entity, boolean isCreated) {
        Long user = U.getUser();
        Date d = new Date();
        BeanUtils.invokeMethodOne(entity, "setUserUpdated", Long.class, user);
        BeanUtils.invokeMethodOne(entity, "setLastUpdated", Date.class, d);

        if (isCreated) {
            BeanUtils.invokeMethodOne(entity, "setFlagDeleted", String.class,
                    "0");
            BeanUtils.invokeMethodOne(entity, "setUserCreated", Long.class,
                    user);
            BeanUtils.invokeMethodOne(entity, "setDateCreated", Date.class, d);
        }
        if (isCreated)
            return save(entity);
        else {
            update(entity);
            return null;
        }
    }

    public static List queryForList(String sql) {
        return queryForList(sql, null);
    }

    public static Map queryForMap(String sql) {
        return queryForMap(sql, null);
    }

    public static List queryForList(String sql, Object[] params) {
        logSqlDebug(sql, params);
        try {
            return queryForListWithLowercaseKey(sql, params);
        } catch (Exception e) {
            logSqlError(e, sql, params);
        }
        return new ArrayList();
    }

    public static int updateSql(String sql) {
        return updateSql(sql, new Object[] {});
    }

    public static int updateSql(String sql, List params) {
        return updateSql(sql, params == null ? null : params.toArray());
    }

    protected static List queryForListWithLowercaseKey(String sql,
            Object[] params) {
        return query(sql, params, new MyColumnMapRowMapper());
    }

    protected static String getSqlAndSetParams(List params, String sql,
            Object param) {
        String result = "";
        if (param != null && !"".equals(param.toString().trim())) {
            result += sql;
            if (param instanceof String) {
                param = ((String) param).trim();
            }
            params.add(param);
        }
        return result;
    }

    protected static String getOrderSql(String fieldName, String columnName,
            Page page) {
        String result = "";
        // if (!StringUtils.isBlank(page.getOrderBy())) {
        // if (fieldName.equalsIgnoreCase(page.getOrderBy())) {
        // if (Page.DESC.equalsIgnoreCase(page.getOrder())) {
        // result += " order by " + columnName + " desc";
        // }
        // if (Page.ASC.equalsIgnoreCase(page.getOrder())) {
        // result += " order by " + columnName + " asc";
        // }
        // }
        // }
        return result;
    }

    protected static String getConditionSqlDateBeginEnd(String beginDateString,
            String endDateString, String columnName, List params) {
        Date beginDate = DateUtils.parseDateSafely(beginDateString,
                DateUtils.PATTERN_SHOW);
        Date endDate = DateUtils.parseConditionEndDate(endDateString);
        return getConditionSqlDateBeginEnd(beginDate, endDate, columnName,
                params);
    }

    protected static String getConditionSqlDateBeginEnd(Date beginDate,
            Date endDate, String columnName, List params) {
        String result = "";
        if (StringUtils.isBlank(columnName))
            return result;
        if (beginDate != null) {
            result += " and " + columnName + " >= ?";
            params.add(DateUtils.format(beginDate, DateUtils.PATTERN_LONG));
        }
        if (endDate != null) {
            result += " and " + columnName + " <= ?";
            params.add(DateUtils.format(endDate, DateUtils.PATTERN_LONG));
        }
        return result;
    }

    protected static String getConditionSql(Object value, String condition,
            List params) {
        return getConditionSql(value, condition, params, false);
    }

    /**
     * ANT方式查询，如"*xx"生成"like '%xx'"
     * 
     * @param value
     * @param condition
     * @param params
     * @return
     */
    protected static String getConditionAntLike(String value, String condition,
            List params) {
        String result = "";
        if (StringUtils.isBlank(value)) {
            return result;
        }
        value = value.trim();
        boolean isLeftLike = false;
        boolean isRightLike = false;
        boolean hasUnderline = false;
        while (value.startsWith("*")) {
            value = StringUtils.removeStart(value, "*");
            isLeftLike = true;
        }
        if (StringUtils.isBlank(value)) {
            return result;
        }
        while (value.endsWith("*")) {
            value = StringUtils.removeEnd(value, "*");
            isRightLike = true;
        }
        if (StringUtils.isBlank(value)) {
            return result;
        }
        if (isLeftLike)
            value = likeLeftParam(value);
        if (isRightLike)
            value = likeRightParam(value);

        if (isLeftLike || isRightLike) {
            result = " and " + condition + " like ?";
            if (value.indexOf('_') > -1) {
                hasUnderline = true;
                value = StringUtils.replace(value, "_", "__");
            }
            if (hasUnderline) {
                result += " escape '_'";
            }
        } else {
            result = " and " + condition + " = ?";
        }
        params.add(value);
        return result;
    }

    protected static String getConditionSql(Object value, String condition,
            List params, boolean isLikeCondition) {
        String result = "";
        boolean valid = false;
        if (value != null) {
            if (value instanceof String) {
                if (!StringUtils.isBlank((String) value)) {
                    valid = true;
                }
            } else {
                valid = true;
            }
        }
        if (valid) {
            result = " and " + condition + " ?";
            if (isLikeCondition) {
                params.add(likeParam((String) value));
            } else {
                params.add(value);
            }
        }
        return result;
    }

    protected static String likeParam(String param) {
        return "%" + StringUtils.trim(param) + "%";
    }

    protected static String likeRightParam(String param) {
        return StringUtils.trim(param) + "%";
    }

    protected static String likeLeftParam(String param) {
        return "%" + StringUtils.trim(param);
    }

    private static void logSqlInfo(String sql, Object[] params) {
        if (!log.isInfoEnabled())
            return;
        log.info("SQL:" + sql + "\nPARAMETERS:");
        if (params != null)
            for (int i = 0; i < params.length; i++) {
                log.info("[" + String.valueOf(params[i]) + "]");
            }
    }

    private static void logSqlDebug(String sql, Object[] params) {
        if (!log.isDebugEnabled())
            return;
        log.debug("SQL:" + sql + "\nPARAMETERS:");
        if (params != null)
            for (int i = 0; i < params.length; i++) {
                log.debug("[" + String.valueOf(params[i]) + "]");
            }
    }

    private static void logSqlError(Exception e, String sql, Object[] params) {
        log.error("ERROR SQL:" + sql + "\nERROR PARAMETERS:");
        if (params != null)
            for (int i = 0; i < params.length; i++) {
                log.error("[" + String.valueOf(params[i]) + "]");
            }
        log.error("", e);
    }

    private static Object execute(String sql, Object[] params,
            RowMapper rowMapper, StatementCallback sc) {
        logSqlInfo(sql, params);
        Object result = null;
        DataSource ds = A.getDataSource();
        if (ds == null) {
            return null;
        }
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = ds.getConnection();
            if (c == null) {
                return null;
            }
            ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    StatementCreatorUtils.setParameterValue(ps, i + 1,
                            SqlTypeValue.TYPE_UNKNOWN, null, params[i]);
                }
            }

            result = sc.doInStatement(rs, ps, rowMapper);

        } catch (Exception e) {
            logSqlError(e, sql, params);
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (ps != null)
                    ps.close();
                if (c != null)
                    c.close();
            } catch (SQLException e) {
                logSqlError(e, sql, params);
                e.printStackTrace();
            }
        }

        return result;
    }

    private static void pageNoAdjusted(Page page, long totalCount, long pageSize) {
        long pageNo = page.getPageNo();
        if (pageNo < 0)
            pageNo = Page.DEFAULT_PAGE_NO;
        if (((pageNo - 1) * pageSize) + 1 > totalCount) {
            pageNo = (long) (totalCount / pageSize);
            if (((pageNo - 1) * pageSize) + 1 + pageSize <= totalCount)
                pageNo += 1;
            if (pageNo < 1)
                pageNo = 1;
        }
        page.setPageNo(pageNo);
    }

    /**
     * Set the value for a parameter. The method used is based on the SQL type
     * of the parameter and we can handle complex types like arrays and LOBs.
     * 
     * @param ps
     *            the prepared statement or callable statement
     * @param paramIndex
     *            index of the parameter we are setting
     * @param sqlType
     *            the SQL type of the parameter
     * @param typeName
     *            the type name of the parameter (optional, only used for SQL
     *            NULL and SqlTypeValue)
     * @param inValue
     *            the value to set (plain value or a SqlTypeValue)
     * @throws SQLException
     *             if thrown by PreparedStatement methods
     * @see SqlTypeValue
     */
    public static void setParameterValue(PreparedStatement ps, int paramIndex,
            int sqlType, String typeName, Object inValue) throws SQLException {

        if (log.isDebugEnabled()) {
            log.debug("Setting SQL statement parameter value: column index "
                    + paramIndex
                    + ", parameter value ["
                    + inValue
                    + "], value class ["
                    + (inValue != null ? inValue.getClass().getName() : "null")
                    + "], SQL type "
                    + (sqlType == SqlTypeValue.TYPE_UNKNOWN ? "unknown"
                            : Integer.toString(sqlType)));
        }

        if (inValue == null) {
            if (sqlType == SqlTypeValue.TYPE_UNKNOWN) {
                boolean useSetObject = false;
                try {
                    useSetObject = (ps.getConnection().getMetaData()
                            .getDatabaseProductName().indexOf("Informix") != -1);
                } catch (Throwable ex) {
                    log.debug("Could not check database product name", ex);
                }
                if (useSetObject) {
                    ps.setObject(paramIndex, null);
                } else {
                    ps.setNull(paramIndex, Types.NULL);
                }
            } else if (typeName != null) {
                ps.setNull(paramIndex, sqlType, typeName);
            } else {
                ps.setNull(paramIndex, sqlType);
            }
        }

        else { // inValue != null
            if (inValue instanceof SqlTypeValue) {
                ((SqlTypeValue) inValue).setTypeValue(ps, paramIndex, sqlType,
                        typeName);
            } else if (sqlType == Types.VARCHAR) {
                ps.setString(paramIndex, inValue.toString());
            } else if (sqlType == Types.DECIMAL || sqlType == Types.NUMERIC) {
                if (inValue instanceof BigDecimal) {
                    ps.setBigDecimal(paramIndex, (BigDecimal) inValue);
                } else {
                    ps.setObject(paramIndex, inValue, sqlType);
                }
            } else if (sqlType == Types.DATE) {
                if (inValue instanceof java.util.Date) {
                    if (inValue instanceof java.sql.Date) {
                        ps.setDate(paramIndex, (java.sql.Date) inValue);
                    } else {
                        ps.setDate(paramIndex, new java.sql.Date(
                                ((java.util.Date) inValue).getTime()));
                    }
                } else if (inValue instanceof Calendar) {
                    Calendar cal = (Calendar) inValue;
                    ps.setDate(paramIndex, new java.sql.Date(cal.getTime()
                            .getTime()), cal);
                } else {
                    ps.setObject(paramIndex, inValue, Types.DATE);
                }
            } else if (sqlType == Types.TIME) {
                if (inValue instanceof java.util.Date) {
                    if (inValue instanceof java.sql.Time) {
                        ps.setTime(paramIndex, (java.sql.Time) inValue);
                    } else {
                        ps.setTime(paramIndex, new java.sql.Time(
                                ((java.util.Date) inValue).getTime()));
                    }
                } else if (inValue instanceof Calendar) {
                    Calendar cal = (Calendar) inValue;
                    ps.setTime(paramIndex, new java.sql.Time(cal.getTime()
                            .getTime()), cal);
                } else {
                    ps.setObject(paramIndex, inValue, Types.TIME);
                }
            } else if (sqlType == Types.TIMESTAMP) {
                if (inValue instanceof java.util.Date) {
                    if (inValue instanceof java.sql.Timestamp) {
                        ps.setTimestamp(paramIndex,
                                (java.sql.Timestamp) inValue);
                    } else {
                        ps.setTimestamp(paramIndex, new java.sql.Timestamp(
                                ((java.util.Date) inValue).getTime()));
                    }
                } else if (inValue instanceof Calendar) {
                    Calendar cal = (Calendar) inValue;
                    ps.setTimestamp(paramIndex, new java.sql.Timestamp(cal
                            .getTime().getTime()), cal);
                } else {
                    ps.setObject(paramIndex, inValue, Types.TIMESTAMP);
                }
            } else if (sqlType == SqlTypeValue.TYPE_UNKNOWN) {
                if (isStringValue(inValue)) {
                    ps.setString(paramIndex, inValue.toString());
                } else if (isDateValue(inValue)) {
                    ps.setTimestamp(paramIndex, new java.sql.Timestamp(
                            ((java.util.Date) inValue).getTime()));
                } else if (inValue instanceof Calendar) {
                    Calendar cal = (Calendar) inValue;
                    ps.setTimestamp(paramIndex, new java.sql.Timestamp(cal
                            .getTime().getTime()));
                } else {
                    // Fall back to generic setObject call without SQL type
                    // specified.
                    ps.setObject(paramIndex, inValue);
                }
            } else {
                // Fall back to generic setObject call with SQL type specified.
                ps.setObject(paramIndex, inValue, sqlType);
            }
        }
    }

    /**
     * Check whether the given value can be treated as a String value.
     */
    private static boolean isStringValue(Object inValue) {
        if (charSequenceAvailable) {
            // Consider any CharSequence (including JDK 1.5's StringBuilder) as
            // String.
            return (inValue instanceof CharSequence || inValue instanceof StringWriter);
        } else {
            // Explicit enumeration of well-known types for JDK 1.3.
            return (inValue instanceof String
                    || inValue instanceof StringBuffer || inValue instanceof StringWriter);
        }
    }

    /**
     * Check whether the given value is a <code>java.util.Date</code> (but not
     * one of the JDBC-specific subclasses).
     */
    private static boolean isDateValue(Object inValue) {
        return (inValue instanceof java.util.Date && !(inValue instanceof java.sql.Date
                || inValue instanceof java.sql.Time || inValue instanceof java.sql.Timestamp));
    }

    /**
     * Convert the given column value to the specified required type. Only
     * called if the extracted column value does not match already.
     * <p>
     * If the required type is String, the value will simply get stringified via
     * <code>toString()</code>. In case of a Number, the value will be converted
     * into a Number, either through number conversion or through String parsing
     * (depending on the value type).
     * 
     * @param value
     *            the column value as extracted from
     *            <code>getColumnValue()</code> (never <code>null</code>)
     * @param requiredType
     *            the type that each result object is expected to match (never
     *            <code>null</code>)
     * @return the converted value
     * @see #getColumnValue(java.sql.ResultSet, int, Class)
     */
    private static Object convertValueToRequiredType(Object value,
            Class requiredType) {
        if (String.class.equals(requiredType)) {
            return value.toString();
        } else if (Number.class.isAssignableFrom(requiredType)) {
            if (value instanceof Number) {
                // Convert original Number to target Number class.
                return NumberUtils.convertNumberToTargetClass(((Number) value),
                        requiredType);
            } else {
                // Convert stringified value to target Number class.
                return NumberUtils.parseNumber(value.toString(), requiredType);
            }
        } else {
            throw new IllegalArgumentException("Value [" + value
                    + "] is of type [" + value.getClass().getName()
                    + "] and cannot be converted to required type ["
                    + requiredType.getName() + "]");
        }
    }

}
