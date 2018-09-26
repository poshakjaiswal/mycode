package com.ef.golf.test;

import com.alibaba.fastjson.JSONObject;
import com.ef.golf.pojo.User;
import com.ef.golf.util.*;
import org.springframework.stereotype.Component;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
@Component
public class Test {


    /*static {
        MobPushConfig.appkey = Consts.mobAppkey;
        MobPushConfig.appSecret=Consts.mobAppSecret;
    }*/
    private static String resthost = Constants.RESTHost;

    public static void  main(String[] args) throws Exception {


        Calendar beginTime = Calendar.getInstance();

        beginTime.setTime(new Date());
        beginTime.set(Calendar.HOUR_OF_DAY,24);
        beginTime.set(Calendar.MINUTE, 0);
        beginTime.set(Calendar.SECOND, 0);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(simpleDateFormat.format(beginTime.getTime()));
        //获取当前时间三个月后的时间
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(beginTime.getTime());
        calendar.add(Calendar.MONTH,3);

        System.out.println(simpleDateFormat.format(calendar.getTime()));


        //Singleton singleton = Singleton.getInstance();

        //DecimalFormat df = new DecimalFormat("0%");
        //System.out.println(df.format((double)100/10000.0));

           /* Long i = (long)47;
        String s = AcountUtil.createPingUser(i,"");
        System.out.println(s);*/


        /*JSONObject jsonObject = new JSONObject();
        jsonObject.put("userId","47");
        Map<String,Object>map = SystemSendTicketUtils.getMapJson("http://localhost:8080/golf/ticket",jsonObject);
        System.out.println(map);*/
        /*System.out.println(AmountUtils.changeF2Y((long)3100));*/

       /* SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time1 = "2018-09-31 11:03:26";
        Date time = simpleDateFormat.parse(time1);
            Calendar calendar = Calendar.getInstance();


        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        System.out.println("当前时间：" + sdf.format(now));

        Date afterDate = new Date(now .getTime() + 300000);
        System.out.println("unix="+afterDate);
        System.out.println(sdf.format(afterDate ));

        Calendar nowTime = Calendar.getInstance();
        nowTime.add(Calendar.MINUTE, 5);
        System.out.println(sdf.format(nowTime.getTime()));


        //System.out.println(EncryptUtil.str2Md5Str("15822059651"+"111111"));
        /*System.out.println(11500*(10/100.0));
        System.out.println(AmountUtils.changeF2Y("1000000"));*/
       /* DecimalFormat df = new DecimalFormat("0%");*/
        /*DecimalFormat df = new DecimalFormat("#.00");*/
        /*System.out.println(df.format((double) 15/10000*100));
        System.out.println(15/10000);*/
       /* System.out.println(Consts.mobAppkey);
        PushClient pushClient = new PushClient();
        PushWork pushWork = new PushWork();
        pushWork.setAppkey(Consts.mobAppkey);
        pushWork.setPlats(new Integer[]{1,2});
        pushWork.setTarget(1);
        pushWork.setContent("1111111");
        pushWork.setType(1);

        try{
           String s =  pushClient.sendPush(pushWork);
           PushWork pushWork1 = pushClient.getPushByBatchId(s);
            System.out.println(pushWork1.toString());
        }catch (Exception e){
            e.printStackTrace();
        }*/

        /*List<RedPackage>bigRedPackageList = new RedisBaseDao().getList("r201806131026570744");
        System.out.println(bigRedPackageList.toArray());*/
    /* Date d1 = new Date();
     SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     String riqi = simpleDateFormat.format(d1);
        System.out.println(d1.getTime()+"date"+riqi+"==="+d1);
        System.out.println( System.currentTimeMillis()+"sys");
        System.out.println("纳秒"+System.nanoTime()+"毫秒"+System.currentTimeMillis());*/
    /*Set<Long>set = new HashSet<>();
    for (int i = 0;i<=50;i++){
        Long sss = System.nanoTime();
        set.add(sss);
        System.out.println(sss.toString().substring(2,4)+sss.toString().substring(sss.toString().length()-4,sss.toString().length()));
        if(!set.contains(sss)){
            System.out.println("有重复");
        }
    }*/

     /*long l1 = d1.getTime();
        System.out.println("l1===="+l1);
     Date d2 = new Date();
     long l2 =  d2.getTime();
        System.out.println("l2===="+l2);
        System.out.println(l1==l2);*/
        /*SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date nowDate = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(nowDate);
        //往前推48小时
        calendar.add(Calendar.HOUR_OF_DAY, -48);
        Date updateDate5 = calendar.getTime();
        System.out.println("往前推48小时的时间="+sdf.format(updateDate5));*/

       /* Page<User> userPage=new Page<>();
        List<User> userList= new ArrayList<>();
        userList.add(new User());
        userList.add(new User());
        userList.add(new User());
        userList.add(new User());
        userList.add(new User());
        userList.add(new User());
        userList.add(new User());
        userList.add(new User());
        userList.add(new User());
        userPage.setResultList(userList);
        Map<String,User> userMap=new HashMap<>();
        userMap.put("user1",new User());
        userMap.put("user2",new User());
        userMap.put("user3",new User());
        userMap.put("user4",new User());
        userMap.put("user5",new User());
        ExecutionResult er=new ExecutionResult("200",userMap);

        String objJson = JSON.toJSONString(er);

        System.out.println(objJson);*/
    }
}
