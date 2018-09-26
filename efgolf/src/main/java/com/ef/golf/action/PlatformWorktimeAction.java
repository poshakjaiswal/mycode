package com.ef.golf.action;


import com.ef.golf.common.Constant;
import com.ef.golf.core.service.AbstractService;
import com.ef.golf.exception.SystemException;
import com.ef.golf.pojo.Area_dic;
import com.ef.golf.pojo.PlatformWorktime;
import com.ef.golf.service.AreaDicService;
import com.ef.golf.service.PlatformWorktimeService;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class PlatformWorktimeAction extends AbstractService {

    @Resource
    private PlatformWorktimeService platformWorktimeService;

    @Override
    public Object doService() throws Exception {
        Map<String, Object> platformWorktimeMap = new HashMap<>();
        PlatformWorktime platformWorktime = platformWorktimeService.getPlatformWorktime();
        platformWorktimeMap.put("platformWorktime", platformWorktime);
        return platformWorktimeMap;
    }
}
