package com.ef.golf.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class RedPacketUtil {  
    //最小红包额度  
    private static final int MINMONEY = 1;  
    //最大红包额度  
    private static final int MAXMONEY = 200000 * 100;
    //每个红包最大是平均值的倍数  
    private static final double TIMES = 2.1;
      
    /** 
     * @param money 
     * @param count 
     * @return 
     * @Author:lulei   
     * @Description: 拆分红包 
     */  
    public static List<Integer> splitRedPackets(int money, int count) {
        if (!isRight(money, count)) {  
            return null;  
        }  
        List<Integer> list = new ArrayList<Integer>();  
        //红包最大金额为平均金额的TIMES倍  
        int max = (int) (money * TIMES / count);  
        max = max > MAXMONEY ? MAXMONEY : max;  
        for (int i = 0; i < count; i++) {  
            int one = random(money, MINMONEY, max, count - i);  
            list.add(one);  
            money -= one;  
        }  
        return list;  
    }  
      
    /** 
     * @param money 
     * @param minS 
     * @param maxS 
     * @param count 
     * @return 
     * @Author:lulei   
     * @Description: 随机红包额度 
     */  
    private static int random(int money, int minS, int maxS, int count) {
        //红包数量为1，直接返回金额  
        if (count == 1) {  
            return money;  
        }  
        //如果最大金额和最小金额相等，直接返回金额  
        if (minS == maxS) {  
            return minS;  
        }  
        int max = maxS > money ? money : maxS;  
        //随机产生一个红包  
        int one = ((int)Math.rint(Math.random() * (max - minS) + minS))  % max + 1;  
        int money1 = money - one;  
        //判断该种分配方案是否正确  
        if (isRight(money1, count -1)) {  
            return one;  
        } else {  
            double avg = money1 / (count - 1);  
            if (avg < MINMONEY) {  
                //递归调用，修改红包最大金额  
                return random(money, minS, one, count);  
            }else if (avg > MAXMONEY) {  
                //递归调用，修改红包最小金额  
                return random(money, one, maxS, count);  
            }  
        }  
        return one;  
    }  
      
    /** 
     * @param money 
     * @param count 
     * @return 
     * @Author:lulei   
     * @Description: 此种红包是否合法 
     */  
    private static boolean isRight(int money, int count) {
        double avg = money / count;  
        if (avg < MINMONEY) {  
            return false;  
        }  
        if (avg > MAXMONEY) {  
            return false;  
        }  
        return true;  
    }

    /**
     * 生成红包id流水号
     * @param
     * @para phoneNumber 手机号
     * @return 对应类型的流水号
     */
    public static String serialNoGenerate(){
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String number=sdf.format(date);
        String end=null;
        end="r"+number+RandomUtil.getRandom(4);
        return end;
    }
    public static void main(String[] args) {  
        // TODO Auto-generated method stub    
        RedPacketUtil util = new RedPacketUtil();
       // System.out.println(util.splitRedPackets(10000, 800));
       // System.out.println(util.serialNoGenerate("13652091897"));
    }  
} 