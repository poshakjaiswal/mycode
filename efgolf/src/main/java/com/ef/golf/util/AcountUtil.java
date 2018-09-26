/*
 * AcountUtil.java       1.0    2018年6月6日
 *
 * Copyright (c) 2011, 2014 Tianjin YiDianFu Network Technology Co. Ltd.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * YiDianFu Network Technology Co. Ltd. ("Confidential Information").
 * You shall not disclose such Confidential Information and shall use
 * it only in accordance with the terms of the license agreement you
 * entered into with YiDianFu.
 */
package com.ef.golf.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;


/**
 *
 *
 * @author Administrator 2018年6月6日 上午9:18:32
 * @version 1.0
 */
public class AcountUtil {

    @SuppressWarnings({ "resource", "deprecation" })
    public static String createPingUser(Long userId,String url) {
        String strResult = "";
        String baseUrl ="http://localhost:8080/golf/ticket";
        HttpClient client = new DefaultHttpClient();
        // 发送post请求
        HttpPost request = new HttpPost(baseUrl/* + "?userId=" + userId*/);
        try {
            HttpResponse response = client.execute(request);
            /** 请求发送成功，并得到响应 **/
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                /** 读取服务器返回过来的json字符串数据 **/
                strResult = EntityUtils.toString(response.getEntity());
            }
        } catch (ClientProtocolException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        } catch (ParseException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        } catch (IOException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        return strResult;
    }


}
