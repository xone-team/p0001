package com.xone.service.app;

import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IndexServiceImpl implements IndexService {
    private static final Log log = LogFactory.getLog(IndexServiceImpl.class);

    @Autowired
    protected SqlMapClient sqlMapClient;

    @Override
    public Integer getTodoProductCount() {
        Integer result = null;
        try {
            result = (Integer) sqlMapClient.queryForObject("back.todoProductCount");
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
        }
        return result;
    }

    @Override
    public Integer getTodoPurchaseCount() {
        Integer result = null;
        try {
            result = (Integer) sqlMapClient.queryForObject("back.todoPurchaseCount");
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
        }
        return result;
    }

    @Override
    public Integer getTodoDeliveryCount() {
        Integer result = null;
        try {
            result = (Integer) sqlMapClient.queryForObject("back.todoDeliveryCount");
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
        }
        return result;
    }

    public SqlMapClient getSqlMapClient() {
        return sqlMapClient;
    }

    public void setSqlMapClient(SqlMapClient sqlMapClient) {
        this.sqlMapClient = sqlMapClient;
    }

}
