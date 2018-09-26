package com.ef.golf.action;

import com.alibaba.fastjson.JSONObject;
import com.ef.golf.callable.RedPackageAllocationTask;
import com.ef.golf.common.Constant;
import com.ef.golf.core.service.AbstractService;
import com.ef.golf.exception.SystemException;
import com.ef.golf.pojo.Hope;
import com.ef.golf.pojo.RedPackage;
import com.ef.golf.pojo.SmallRedPackage;
import com.ef.golf.service.HopeService;
import com.ef.golf.service.RedPackageService;
import com.ef.golf.service.UserService;
import com.ef.golf.util.PageBean;
import com.ef.golf.util.RedPacketUtil;
import com.ef.golf.util.RedisBaseDao;
import com.ef.golf.util.RedisLoginVerifyUtil;
import com.ef.golf.vo.UserVo;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import javax.validation.constraints.NotNull;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Future;

/**
 * 红包分配
 * 预先进行红包分配  产生未分配的列表 放到redis中
 */
@Service
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class RedPackageAllocationAction extends AbstractService {

    @NotNull
    private String uid;
    @NotNull
    private String sid;
    @Resource
    RedisBaseDao redisBaseDao;
    @Resource
    private ThreadPoolTaskExecutor executor;
    @Resource
    private RedPackageAllocationTask redPackageAllocationTask;
    //红包金额 单位是分
    private Integer moneyAmount;
    //红包个数
    private Integer count;
    //群号
    private String qunId;
    //祝福语
    private String content;

    @Override
    public Object doService() throws Exception {
        //将任务交给Spring的线程任务执行器处理
        redPackageAllocationTask.setContent(content);
        redPackageAllocationTask.setCount(count);
        redPackageAllocationTask.setMoneyAmount(moneyAmount);
        redPackageAllocationTask.setQunId(qunId);
        redPackageAllocationTask.setSid(sid);
        redPackageAllocationTask.setUid(uid);
        Future<Map<String, Object>> future = executor.submit(redPackageAllocationTask);
        try {

            return future.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public void setMoneyAmount(Integer moneyAmount) {
        this.moneyAmount = moneyAmount;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public void setQunId(String qunId) {
        this.qunId = qunId;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
