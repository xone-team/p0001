package com.xone.action.base.query;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.xone.action.base.ActionQuery;
import com.xone.action.utils.A;
import com.xone.action.utils.ReflectUtils;

public class ConditionUtils {
    private static Log log = LogFactory.getLog( ConditionUtils.class );
    
    public static final String DEFAULT_PREFIX = "_s";

    public static final String EQUALS = "e";
    public static final String GREAT_THAN = "g";
    public static final String LESS_THAN = "l";
    public static final String GREAT_THAN_OR_EQUAL_TO = "ge";
    public static final String LESS_THAN_OR_EQUAL_TO = "le";
    public static final String NULL = "nl";
    public static final String NOT_EQUAL = "ne";
    public static final String NOT_NULL = "nnl";
    // string only
    public static final String LIKE = "lk";
    public static final String START_WITH = "sw";
    public static final String END_WITH = "ew";
    public static final String BLANK = "bk";
    public static final String NOT_START_WITH = "nsw";
    public static final String NOT_END_WITH = "new";
    public static final String NOT_LIKE = "nlk";
    public static final String NOT_BLANK = "nbk";
    // logic
    public static final String OR = "o";
    public static final String AND = "a";
    public static final String LEFT_PARENTHESIS = "lp";
    public static final String RIGHT_PARENTHESIS = "rp";

    // order by
    public static final String ASC = "ac";
    public static final String DESC = "dc";
    public static final String DESC_NULL_FIRST = "dcf";
    public static final String ASC_NULL_LAST = "acl";

    public static final String DEFAULT_OPERATOR = EQUALS;
    public static final String DEFAULT_LOGIC = AND;
    public static final String STRING_BLANK = " ";
    public static final String STRING_QUESTION = "?";
    public static final String OPERATOR_SUFFIX = "_";
    public static final String LEFT_PARENTHESIS_SQL = "(";
    public static final String RIGHT_PARENTHESIS_SQL = ")";
    public static final String DEFAULT_LOGIC_SQL = "and";
    
    public static final String CONDITION_CONFIG_ROOT = "conditions";
    public static final String CONDITION_CONFIG_FIELD = "field";
    public static final String CONDITION_CONFIG_TYPE = "type";
    public static final String CONDITION_CONFIG_OPERATOR = "operator";
    public static final String CONDITION_CONFIG_COLUMN = "column";
    
    public static final String TYPE_STRING = "string";
    public static final String TYPE_DATE = "date";
    
//    public static List getConditionListFromRequest(HttpServletRequest request) {
//        String queryLogic = request.getParameter("_FZY_exp");
//
//        List result = null;
//        try {
//            if (queryLogic != null) {
//                result = new SearchLogic(queryLogic).exe();
//            }
//        } catch (ParseException e) {
//            log.error(e);
//        }
//        return null;
//    }

    public static void fillConditions(List queryConditions,
            List queryParamValueList, JSONObject conditionConfig,
            ActionQuery query) {
        try {
            JSONArray conditions = conditionConfig.getJSONArray(CONDITION_CONFIG_ROOT);
            for (int i = 0; i < conditions.length(); i++) {
                JSONObject c = conditions.getJSONObject(i);
                String fieldName = c.getString(CONDITION_CONFIG_FIELD);
                String fieldValue = ( String ) ReflectUtils.getFieldValue(query, fieldName);
                if(StringUtils.isBlank(fieldValue)){
                    continue;
                }
                
                // type and operator is not required
                String column = (String) A.getJsonValueSafely(c, CONDITION_CONFIG_COLUMN, fieldValue);
                String type = (String) A.getJsonValueSafely(c, CONDITION_CONFIG_TYPE, TYPE_STRING);
                String operator = (String) A.getJsonValueSafely(c, CONDITION_CONFIG_TYPE, LIKE);
                
                
                // TODO
                if(TYPE_STRING.equals(type)){
                    
                }
                if(TYPE_DATE.equals(type)){
                    
                }
                
                ConditionItem conditionItem = new ConditionItem();
                conditionItem.setField(fieldName);
                conditionItem.setOperator(operator);
                conditionItem.setColumn(column);
                
                queryConditions.add(conditionItem);
                if(TYPE_STRING.equals(type)){
                    if(LIKE.equals(operator)){
                        fieldValue = "%" + fieldValue + "%";
                    }
                }
                queryParamValueList.add(fieldValue);
            }
        } catch (JSONException e) {
            log.error(e.getMessage(), e);
        }
    }
    
    public static void setConditionOperator(List queryConditions, String paramName, String operator){
        for (Iterator iterator = queryConditions.iterator(); iterator
                .hasNext();) {
            ConditionItem ci = (ConditionItem) iterator.next();
            if(paramName.equals(ci.getField())){
                ci.setOperator(operator);
                break;
            }
        }
    }

    public static String getConditionSql(List conditionItems,
            JSONObject conditionConfig) {
        String queryConditionsSql = "";
        if (conditionItems != null) {
            for (Iterator iterator = conditionItems.iterator(); iterator
                    .hasNext();) {
                ConditionItem i = (ConditionItem) iterator.next();
                queryConditionsSql += item2sql(i, conditionConfig,
                        true);
            }
        }
        return queryConditionsSql;
    }

    public static String[] getConditionParamsFromRequest(
            HttpServletRequest request) {
        return request.getParameterValues("_FZY_val");
    }

    public static String item2sql(ConditionItem conditionItem,
            JSONObject conditionConfig, boolean startWithLogic) {
        String result = "";

        String paramName = conditionItem.getField();
        String paramNameInSql = null;
        try {
            JSONArray conditions = conditionConfig.getJSONArray(CONDITION_CONFIG_ROOT);
            for (int i = 0; i < conditions.length(); i++) {
                JSONObject c = conditions.getJSONObject(i);
                String conditionField = c.getString(CONDITION_CONFIG_FIELD);
                if (conditionField.equals(paramName)) {
                    paramNameInSql = (String) A.getJsonValueSafely(c, CONDITION_CONFIG_COLUMN, conditionField);
                    break;
                }
            }
        } catch (JSONException e) {
            log.error(e.getMessage(), e);
        }

        if (paramNameInSql != null) {
            String logic = conditionItem.getLogic();
            if (StringUtils.isBlank(logic)) {
                logic = DEFAULT_LOGIC;
            } else {
                logic = StringUtils.remove(logic, OPERATOR_SUFFIX);
            }
            String logicInSql = logic2sql(logic);

            String operator = conditionItem.getOperator();
            if (StringUtils.isBlank(operator)) {
                operator = DEFAULT_OPERATOR;
            } else {
                operator = StringUtils.remove(operator, OPERATOR_SUFFIX);
            }
            String operatorInSql = operator2sql(operator);

            String placeholderInSql = operator2placeholder(operator);

            if (startWithLogic) {
                result += STRING_BLANK + logicInSql;
            }
            result += STRING_BLANK + paramNameInSql;
            result += STRING_BLANK + operatorInSql;
            result += STRING_BLANK + placeholderInSql;
        }

        List items = conditionItem.getItems();
        if (items != null && items.size() > 0) {
            int itemsSize = items.size();
            result += STRING_BLANK + DEFAULT_LOGIC_SQL + STRING_BLANK
                    + LEFT_PARENTHESIS_SQL;
            for (int i = 0; i < itemsSize; i++) {
                ConditionItem ci = (ConditionItem) items.get(i);
                result += item2sql(ci, conditionConfig, i != 0);
            }
            result += STRING_BLANK + RIGHT_PARENTHESIS_SQL;
        }

        return result;
    }

    protected static String operator2placeholder(String operator) {
        String result = STRING_QUESTION;
        if (StringUtils.isBlank(operator)) {
            return result;
        } else {
            operator = operator.trim().toLowerCase();
        }
//        if (LIKE.equals(operator) || NOT_LIKE.equals(operator)) {
//             result = "%" + STRING_QUESTION + "%";
////            result = "CONCAT('%', " + STRING_QUESTION + ", '%')";
//        }
//        if (START_WITH.equals(operator) || NOT_START_WITH.equals(operator)) {
//            result = "'%" + STRING_QUESTION + "%'";
////            result = "CONCAT(" + STRING_QUESTION + ", '%')";
//        }
//        if (END_WITH.equals(operator) || NOT_END_WITH.equals(operator)) {
////            result = "CONCAT('%', " + STRING_QUESTION + ")";
//        }
        return result;
    }

    private static String logic2sql(String logic) {
        String result = "";
        if (StringUtils.isBlank(logic)) {
            return result;
        } else {
            logic = logic.trim().toLowerCase();
        }

        if (OR.equals(logic)) {
            result = "or";
        }
        if (AND.equals(logic)) {
            result = "and";
        }

        return result;
    }

    private static String operator2sql(String operator) {
        String result = "";
        if (StringUtils.isBlank(operator)) {
            return result;
        } else {
            operator = operator.trim().toLowerCase();
        }
        if (EQUALS.equals(operator)) {
            result = "=";
        }
        if (GREAT_THAN.equals(operator)) {
            result = ">";
        }
        if (GREAT_THAN_OR_EQUAL_TO.equals(operator)) {
            result = ">=";
        }
        if (LESS_THAN.equals(operator)) {
            result = "<";
        }
        if (LESS_THAN_OR_EQUAL_TO.equals(operator)) {
            result = "<=";
        }
        if (NULL.equals(operator)) {
            result = "is null";
        }
        if (NOT_EQUAL.equals(operator)) {
            result = "<>";
        }
        if (NOT_NULL.equals(operator)) {
            result = "is not null";
        }
        if (LIKE.equals(operator)) {
            result = "like";
        }
        if (START_WITH.equals(operator)) {
            result = "like";
        }
        if (END_WITH.equals(operator)) {
            result = "like";
        }
        if (NOT_LIKE.equals(operator)) {
            result = "not like";
        }
        if (NOT_START_WITH.equals(operator)) {
            result = "not like";
        }
        if (NOT_END_WITH.equals(operator)) {
            result = "not like";
        }
        // //TODO
        // if(BLANK.equals(operator)){
        // result = "";
        // }
        // if(ASC.equals(operator)){
        // result = "asc";
        // }
        // if(DESC.equals(operator)){
        // result = "desc";
        // }
        // if(DESC_NULL_FIRST.equals(operator)){
        // result = "desc null first";
        // }
        // if(ASC_NULL_LAST.equals(operator)){
        // result = "asc null last";
        // }
        //
        // if(LEFT_PARENTHESIS.equals(operator)){
        // result = "(";
        // }
        // if(RIGHT_PARENTHESIS.equals(operator)){
        // result = ")";
        // }
        return result;
    }
}
