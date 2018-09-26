package com.ef.golf.service;

import com.ef.golf.pojo.Recharge;

public interface RechargeService {

    int insertSelective(Recharge recharge,Integer userId);
    Double getTodayRechargeMoney(Integer userId);
}
