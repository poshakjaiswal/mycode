package com.ef.golf.action;

import com.alibaba.fastjson.JSON;
import com.ef.golf.common.Constant;
import com.ef.golf.common.mob.MobPushUtil;
import com.ef.golf.core.service.AbstractService;
import com.ef.golf.exception.SystemException;
import com.ef.golf.mapper.EfActivityMapper;
import com.ef.golf.mapper.UserTicketMapper;
import com.ef.golf.pojo.CourseSign;
import com.ef.golf.pojo.Course_order;
import com.ef.golf.pojo.IfunResult;
import com.ef.golf.pojo.UserTicket;
import com.ef.golf.service.*;
import com.ef.golf.util.AmountUtils;
import com.ef.golf.util.GoEasyUtil;
import com.ef.golf.util.RedisBaseDao;
import com.ef.golf.util.SmsUtil;
import com.ef.golf.vo.ActivityMessageVo;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * for efgolf
 * Created by Bart on 2017/5/31.
 * Date: 2017/5/31 10:14
 */

@Service
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class TestAction extends AbstractService {

    @Resource
   private UserTicketMapper userTicketMapper;
    @Resource
    private EfActivityMapper efActivityMapper;

    @Override
    public Object doService() throws Exception {

        List<ActivityMessageVo>list = efActivityMapper.getActivityMessage("0");
            //当天0点0分0秒
            Calendar beginTime = Calendar.getInstance();
            beginTime.setTime(new Date());
            beginTime.set(Calendar.HOUR_OF_DAY, 0);
            beginTime.set(Calendar.MINUTE, 0);
            beginTime.set(Calendar.SECOND, 0);
            //三个月后的
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(beginTime.getTime());
            calendar.add(Calendar.MONTH,3);

            List<UserTicket>ticketsList = new ArrayList<>();

            for (ActivityMessageVo amv: list) {//注册送劵活动

                int couponNum = Integer.valueOf(amv.getCouponNum());//这里是各模板送劵数量

                for (int i = 0;i<couponNum;i++){//循环数量发劵

                    UserTicket userticket = new UserTicket();
                    Date date = new Date();
                    userticket.setUserId(Long.valueOf(47));
                    userticket.setCreateTime(date);
                    userticket.setModifyTime(date);
                    userticket.setCreateUser("0");
                    userticket.setModifyUser("0");
                    userticket.setState(3);
                    userticket.setEffectiveTime(beginTime.getTime());
                    userticket.setExpiryTime(calendar.getTime());
                    userticket.setTicketId(Integer.valueOf(amv.getTemplateId()));
                    userticket.setLocation(1);
                    ticketsList.add(userticket);
                }
            }
            int i = userTicketMapper.insertUserTickets(ticketsList);


        return 0;

    }

}
