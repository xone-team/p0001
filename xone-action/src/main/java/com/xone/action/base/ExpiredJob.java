package com.xone.action.base;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class ExpiredJob extends QuartzJobBean {
    @Autowired
    ExpiredTask expiredTask;

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        expiredTask.updateFlagDeletedWhenExpired();
    }

    public ExpiredTask getExpiredTask() {
        return expiredTask;
    }

    public void setExpiredTask(ExpiredTask expiredTask) {
        this.expiredTask = expiredTask;
    }
    
}
