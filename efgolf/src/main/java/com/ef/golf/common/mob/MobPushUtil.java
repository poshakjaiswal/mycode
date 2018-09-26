package com.ef.golf.common.mob;


import com.ef.golf.common.Consts;
import mob.push.api.MobPushConfig;
import mob.push.api.model.PushWork;
import mob.push.api.push.PushClient;
import org.springframework.stereotype.Repository;

/**
 * create by wxc
 * 2018年6月14日
 * mob推送工具类
 */
public class MobPushUtil {

    static {
        MobPushConfig.appkey = Consts.mobAppkey;
        MobPushConfig.appSecret=Consts.mobAppSecret;
    }

    public static String MobPush(Integer target,String content,String[]alias,String type,String extras){
        String batchId="";
        Integer [] plats = {1,2};
        PushClient pushClient = new PushClient();
        PushWork pushWork = new PushWork();
        pushWork.setAppkey(Consts.mobAppkey);
        pushWork.setPlats(plats);//可使用平台，1、android ； 2、ios ；如包含ios和android则为[1,2]
        pushWork.setIosProduction(0);//plat = 2下，0测试环境，1生产环境，默认1
        pushWork.setAlias(alias);//设置推送别名集合[“alias1″,”alias2”]，target=2则必选
        pushWork.setTarget(target);//2//推送范围:1广播；2别名；3标签；4regid；5地理位置;6用户分群
        pushWork.setContent(content);//推送内容
        pushWork.setType(1);//推送类型：1通知；2自定义
        pushWork.setExtras(extras);

        try{
            batchId = pushClient.sendPush(pushWork);
        }catch (Exception e){
            e.printStackTrace();
        }
        return batchId;
    }
}
