package com.ef.golf.controller;

import com.cloopen.rest.sdk.utils.PropertiesUtil;
import com.ef.golf.common.Constant;
import com.ef.golf.exception.LoginException;
import com.ef.golf.exception.SystemException;
import com.ef.golf.pojo.Dynamic;
import com.ef.golf.pojo.Hope;
import com.ef.golf.pojo.IfunResult;
import com.ef.golf.pojo.User;
import com.ef.golf.service.UserService;
import com.ef.golf.service.WoService;
import com.ef.golf.util.OssUtil;
import com.ef.golf.util.PageBean;
import com.ef.golf.util.PictureUploadUtil;
import com.ef.golf.util.RedisLoginVerifyUtil;
import com.ef.golf.vo.MineVo;
import com.ef.golf.vo.UserVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * for efgolf
 * Created by Bart on 2017/1/6.
 * Date: 2017/1/6 09:16
 */
@Controller
@RequestMapping("/updateData")
public class PersonDataUpdateController {

    @Resource
    private UserService userService;
    @Resource
    private RedisLoginVerifyUtil redisLoginVerifyUtil;


    @RequestMapping(value = "/ios",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> issueDynamic(User user,String sid, String uid) throws LoginException, SystemException {
        Map<String,Object> endMap=new HashMap<>();



        /*MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);*/
       // MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        /*List<MultipartFile> files = multipartRequest.getFiles("imgUpload");
        String filePath=headerImgs;*/
        try{
            /*if(files.size()>0) {
                File dirFile = new File(filePath);
                if (!dirFile.isDirectory()) {
                    dirFile.mkdir();
                }


                for (int i = 0; i < files.size(); i++) {
                    String url = "";
                    //获取文件全名称
                    String fileName = files.get(i).getOriginalFilename();
                    //判断是否有上传文件
                    if (fileName != null && fileName != "") {
                        //分割文件名称
                        String[] filestr = fileName.split("\\.");
                        //获取文件后缀
                        String fileEndName=filestr[filestr.length-1];
                        //为当前文件重新命名
                        String fileUrl = System.currentTimeMillis() + "." + filestr[filestr.length-1];
                        //将文件封装成File类型
                        File targetFile = new File(filePath, fileUrl);
                        //将文件写入硬盘
                        try {
                            files.get(i).transferTo(targetFile);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        url = fileUrl;
                        MineVo mo=userService.getInfo(user.getId().intValue());
                        if(mo.getHeadPortraitUrl()!=null&&mo.getHeadPortraitUrl()!=""){
                            String headerStr[]=mo.getHeadPortraitUrl().split("/");
                            String headerName=headerStr[1];
                            OssUtil.delete(headerName,BucketName1);
                        }
                            OssUtil.upload(url,targetFile,BucketName1);
                            user.setHeadPortraitUrl(networkDomainName1+url);
                            userService.updateByPrimaryKey(user);
                        //删除本地文件
                        new File(filePath+"/"+fileUrl).delete();
                    }
                }

            }*/
            Integer userId = redisLoginVerifyUtil.longinVerifty(sid,uid);
            user.setId(Long.valueOf(userId));
            userService.updateByPrimaryKey(user);
        }catch (Exception e){
            endMap.put("-232","更新失败!");
            throw new SystemException(Constant.ERR_SYSTEM);
        }
        endMap.put("code",200);
        endMap.put("message","更新成功!");
        return endMap;
    }





    @ResponseBody
    @RequestMapping(value = "/personDataUpdate",method = RequestMethod.POST)
    public IfunResult personDataUpdate(User user,String sid, String uid,@RequestParam(value = "imgUpload") MultipartFile[] multipartFile){
        System.out.println("====================");
        try {
            Integer userId = redisLoginVerifyUtil.longinVerifty(sid,uid);
            user.setId(Long.valueOf(userId));
            for (int i = 0; i < multipartFile.length; i++){
                //调用工具类上传图片
                String url = PictureUploadUtil.imgsUpload(multipartFile[i],headerImgs,BucketName1);
                MineVo mo=userService.getInfo(userId.intValue());
                if(StringUtils.isNotBlank(mo.getHeadPortraitUrl())){
                    String headerStr[]=mo.getHeadPortraitUrl().split("/");
                    String headerName=headerStr[1];
                    OssUtil.delete(headerName,BucketName1);
                }
                user.setHeadPortraitUrl(networkDomainName1+url);
            }
            userService.updateByPrimaryKey(user);
            return IfunResult.ok();
        }catch (Exception e){
            e.printStackTrace();
            return IfunResult.build(1,"更新失败！");
        }
    }


    private static String BucketName1;
    private static String networkDomainName1;
    private  static String headerImgs;


    static {
        try {
            initOss();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void initOss() throws IOException {
        Properties properties=new Properties();
        InputStream in=PropertiesUtil.class.getClassLoader().getResourceAsStream("oss.properties");
        try {
            properties.load(in);
            BucketName1=properties.getProperty("BucketName1");
            networkDomainName1=properties.getProperty("networkDomainName1");
            headerImgs=properties.getProperty("headerImgs");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }


    }



    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    // 时间比较
    public static int compare_date(Date dt1, Date dt2) {
        try {
            if (dt1.getTime() > dt2.getTime()) {
                System.out.println("dt1 在dt2前");
                return 1;
            } else if (dt1.getTime() < dt2.getTime()) {
                System.out.println("dt1在dt2后");
                return -1;
            } else {
                return 0;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return 0;
    }
}
