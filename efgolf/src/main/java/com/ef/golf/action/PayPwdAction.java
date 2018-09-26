package com.ef.golf.action;


import com.ef.golf.common.Constant;
import com.ef.golf.core.service.AbstractService;
import com.ef.golf.exception.SystemException;
import com.ef.golf.pojo.User;
import com.ef.golf.service.UserService;
import com.ef.golf.util.AESCoder;
import com.ef.golf.util.EncryptUtil;
import com.ef.golf.util.MD5;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 设置支付密码，修改支付密码
 */
@Service
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class PayPwdAction extends AbstractService {

    @Resource
    private UserService userService;

    private Integer userId;
    private Integer type;// 1-设置支付密码 2-修改支付密码
    private String newPassword;//新密码
    private String jiuPassword;//旧密码
    private String unix;//时间戳

    @Override
    public Object doService() throws Exception {
        Map<String,Object>map = new HashMap<>();
        if(type==1){//设置支付密码
            User user = userService.selectByPrimaryKey(userId.longValue());
            /** 加密 */
            Map<String,Object>passwordMap = AESCoder.jia(newPassword);
                user.setPasswordPay((String) passwordMap.get("encryptData"));
                int status = userService.updateByPrimaryKey(user);
                if(status>0){
                    map.put("status",0);
                    map.put("message","设置成功");
                }else{
                    map.put("status",0);
                    map.put("message","设置失败");
                }
        }else{//修改支付密码
            User user = userService.selectByPrimaryKey(userId.longValue());
            String[]pwds = user.getPasswordPay().split(",");
            /** 解密 */
            String userPwd = new String(AESCoder.jie(AESCoder.parseHexStr2Byte(pwds[0]),AESCoder.parseHexStr2Byte(pwds[1])));

            if(jiuPassword.equalsIgnoreCase(MD5.encode("iFunGolf_"+userPwd+"+"+unix.substring(unix.length()-5,unix.length())+"*FollowMe"))){
                Map<String,Object>passwordMap = AESCoder.jia(newPassword);
                user.setPasswordPay((String) passwordMap.get("encryptData"));
                int status = userService.updateByPrimaryKey(user);
                if(status>0){
                    map.put("status",0);
                    map.put("message","修改成功");
                }else{
                    map.put("status",2);
                    map.put("message","修改异常");
                }
            }else{
                map.put("status",1);
                map.put("message","原密码错误");
            }

        }
                return map;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public void setJiuPassword(String jiuPassword) {
        this.jiuPassword = jiuPassword;
    }

    public void setUnix(String unix) {
        this.unix = unix;
    }
}
