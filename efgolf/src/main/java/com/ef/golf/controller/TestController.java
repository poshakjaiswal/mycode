package com.ef.golf.controller;

import com.ef.golf.common.pxx.util.PingUtil;
import com.ef.golf.pojo.IfunResult;
import com.ef.golf.util.HttpGetIpUtil;
import com.ef.golf.util.OrderNoUtil;
import com.ef.golf.util.SmsUtil;
import com.pingplusplus.model.Recharge;
import com.pingplusplus.model.Transfer;
import com.pingplusplus.model.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/**
 * for efgolf
 * Created by Bart on 2017/1/6.
 * Date: 2017/1/6 09:16
 */
@Controller
@RequestMapping(value = "/push")
public class TestController {

    @Resource
    private PingUtil pingUtil;
    @Resource
    private OrderNoUtil orderNoUtil;

   /* @Value("${cancelTitle}")
    private String title;*/

    @Value("${coachCloseMoney}")
   private String coachCloseMoney;

    @ResponseBody
    @RequestMapping(value = "/ssss",method = RequestMethod.POST)
    public Object Testtest(){
        SmsUtil.sendSMS("15620606384",coachCloseMoney,new String[]{"600000000000000000"});
        return null;
    }

    @ResponseBody
    @RequestMapping(value = "/rechage",method = RequestMethod.POST)
    public Object TestJms(HttpServletRequest request,String userId,int amount,String channel){
       String orderNo = orderNoUtil.orderNoGenerate("r","1111111111");
       String clientIp= HttpGetIpUtil.getIpAddress(request);
       Recharge recharge = pingUtil.recharge(userId,"系统账户充值",amount,"custom",orderNo,clientIp,"啦啦","充值");
        return  IfunResult.ok(recharge);
    }
    @ResponseBody
    @RequestMapping(value = "/userBalance",method = RequestMethod.POST)
    public Object fingUserBalance(HttpServletRequest request){
        User user = pingUtil.userBalacnce("0");
        return  user.getAvailableBalance();
    }
    @ResponseBody
    @RequestMapping(value = "/transfer",method = RequestMethod.POST)
    public Object transfer(HttpServletRequest request) {
        String orderNo = orderNoUtil.serialNoGenerate("06", "15620532538");
        Transfer transfer = pingUtil.transferAccounts(500000, "balance", orderNo, "47", "给徐强发钱");
        /*BalanceTransfer balanceTransfer = pingUtil.balanceTransfer(500000,"balance","0","47",orderNo);*/
        return transfer;
    }
}
