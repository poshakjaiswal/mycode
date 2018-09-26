package com.ef.golf.test;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * com.ef.golf.test
 * Administrator
 * 2018/9/3 13:39
 */
public class HttpUtil {

    String uri = "https://www.baidu.com/";

    /**
     * Get方法
     */
    @Test
    public void test1() {
        try {
            URL url = new URL("http://localhost:8080/golf/userDetails");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setDoOutput(true); // 设置该连接是可以输出的
            connection.setRequestMethod("GET"); // 设置请求方式
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            String line = null;
            StringBuilder result = new StringBuilder();
            while ((line = br.readLine()) != null) { // 读取数据
                result.append(line + "\n");
            }
            connection.disconnect();

            System.out.println(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Test
    public void test2() {
        try {
            URL url = new URL("http://localhost:8080/golf/userDetails");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setDoInput(true); // 设置可输入
            connection.setDoOutput(true); // 设置该连接是可以输出的
            connection.setRequestMethod("POST"); // 设置请求方式
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

            PrintWriter pw = new PrintWriter(new BufferedOutputStream(connection.getOutputStream()));
            pw.write("userId=47");
            pw.flush();
            pw.close();

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            String line = null;
            StringBuilder result = new StringBuilder();
            while ((line = br.readLine()) != null) { // 读取数据
                result.append(line + "\n");
            }
            connection.disconnect();

            System.out.println(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Test
    public void test3() {
        try {
            URL url = new URL("http://localhost:8080/golf/userDetails");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setDoInput(true); // 设置可输入
            connection.setDoOutput(true); // 设置该连接是可以输出的
            connection.setRequestMethod("POST"); // 设置请求方式
            connection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");

            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("userId", "47");
            PrintWriter pw = new PrintWriter(new BufferedOutputStream(connection.getOutputStream()));
            pw.write(objectMapper.writeValueAsString(data));
            pw.flush();
            pw.close();

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            String line = null;
            StringBuilder result = new StringBuilder();
            while ((line = br.readLine()) != null) { // 读取数据
                result.append(line + "\n");
            }
            connection.disconnect();

            System.out.println(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test //发券规则
    public void Test4() throws ParseException {
       int year = 2018;
        int month =  9;
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR,year);
        calendar.set(Calendar.MONTH,month);
        calendar.set(Calendar.DATE,calendar.getActualMaximum(Calendar.DATE));
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");


        String s = "2018-10-03 08:30";

        Date date = simpleDateFormat.parse(s);
        System.out.println(simpleDateFormat.format(date));
        System.out.println(date.getTime());
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.HOUR, -24);// 24小时制
        date = cal.getTime();
        System.out.println(simpleDateFormat.format(date));
        System.out.println(date.getTime());
        if(new Date().getTime()<date.getTime()){
            System.out.println("lalala");
        }

        /*double scale = 8.5;
        double shop = 15300.00;
        double jiage = shop*(scale/100.0);
        System.out.println(jiage);
        //品牌规则 购物满1000送一张200满减券 满500送50满减券 满100送20满减券  现有一单2688元 实现分配三种券
        int yi = (int)(jiage/1000);
        int er = (int)(jiage%1000/500);
        int san = (int)(jiage%1000%500/100);
        System.out.println("一级券="+yi);
        System.out.println("二级券="+er);
        System.out.println("三级券="+san);

        int  quanshu=0;
        int yu=(int)jiage;

        for (int i=0;i<4;i++){
            yu=yu%100;
            quanshu=yu/100;
            list.add()
        }*/

    }

}
