package com.ef.golf.action;

import com.ef.golf.common.Constant;
import com.ef.golf.common.pxx.util.PingUtil;
import com.ef.golf.core.service.AbstractService;
import com.ef.golf.core.structure.pageModel.Page;
import com.ef.golf.exception.LoginException;
import com.ef.golf.pojo.Dynamic;
import com.ef.golf.service.DynamicCommentService;
import com.ef.golf.service.DynamicPraiseService;
import com.ef.golf.service.DynamicService;
import com.ef.golf.service.ShareService;
import com.ef.golf.util.PageBean;
import com.ef.golf.util.RedisLoginVerifyUtil;
import com.ef.golf.vo.DynamicHopeVo;
import com.ef.golf.vo.DynamicVo;
import com.ef.golf.vo.QuanziUserVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class DynamicAction extends AbstractService {

    @Resource
    private RedisLoginVerifyUtil redisLoginVerifyUtil;

    @Resource
    private DynamicPraiseService dynamicPraiseService;

    @Resource
    private ShareService shareService;

    @Resource
    private DynamicCommentService dynamicCommentService;

    private Integer serachType = 1;//搜索条件  1最新 2精选 3.附近

    private String lat = "40.0497810000";

    private String lng = "116.3424590000";

    /**
     * 分页用
     */
    private int pageNum = 1;

    private int showCount = 10;

    private String uid;

    private String sid;


    @Resource
    private DynamicService dynamicService;

    @Override
    public Object doService() throws Exception {
        Integer userId = 0;
        Dynamic dynamic = new Dynamic();
        //reserve3作为搜索条件
        dynamic.setReserved3(serachType.toString());
        dynamic.setLat(lat);
        dynamic.setLng(lng);
        dynamic.setShowCount(this.showCount);
        dynamic.setCurrentPage(this.pageNum);
        //验证是否登录，如果登录则显示当前用户关注过的人的备注
        if (StringUtils.isNotEmpty(sid) && StringUtils.isNotEmpty(uid)) {
            userId = redisLoginVerifyUtil.longinVerifty(this.sid, this.uid);
            dynamic.setUserId(userId);
        }
        //1.获取动态列表
        List<DynamicVo> dynamicList = dynamicService.getDynamicListPage(dynamic);
        int count = dynamicService.getDynamicListPageCount(dynamic);
        if (dynamicList.size() > 0) {

            /**
             * 1.循环取出每一条动态
             * 2.循环取出每一条愿望
             * 3.根据用户id判断，将愿望和动态绑定到集合中
             */
            if (dynamicList.size() > 0) {
                for (int i = 0; i < dynamicList.size(); i++) {

                    //2.获取愿望列表
                    List<DynamicHopeVo> dynamicHopeList = dynamicService.getHopes(dynamicList.get(i).getUserId());

                    String imgUrl = dynamicList.get(i).getImgUrl();
                    if (StringUtils.isNotEmpty(imgUrl)) {
                        //分割图片路径，并存入数组
                        dynamicList.get(i).setDynamicImgs(this.getDynamicImgUrl(imgUrl));
                    }
                    int dynamicId = dynamicList.get(i).getDynamicId();
                    /** 获取送礼物人头像 */

                    //获取点赞记录

                    PageBean pageBean = dynamicPraiseService.getPraises(dynamicId, pageNum, showCount,null);
                    List<QuanziUserVo> list = pageBean.getResultList();
                    if (list.size() > 0) {
                        dynamicList.get(i).setDynamicPraises(list);
                    }
                        /*dynamicList.get(i).setDynamicPraises(dynamicPraiseService.getPraises(dynamicId,1,8).getResultList());*/


                    //获取评论记录
                    dynamicList.get(i).setDynamicComments(dynamicCommentService.getComments(dynamicId));
                    //获取转发记录
                    PageBean pageBean1 = shareService.getShares(dynamicId, pageNum, showCount,userId);
                    List<QuanziUserVo> list2 = pageBean1.getResultList();
                    if (list2.size() > 0) {
                        dynamicList.get(i).setDynamicShares(list2);
                    }
                        /*dynamicList.get(i).setDynamicShares(shareService.getShares(dynamicId,1,8).getResultList());*/

                    //查询动态点赞人id
                    List<Integer> users = dynamicPraiseService.selectPraisesRecord(dynamicId);

                    if (users.contains(userId)) {
                        dynamicList.get(i).setHasAttend(true);
                    } else {
                        dynamicList.get(i).setHasAttend(false);
                    }
                    int userId1 = dynamicList.get(i).getUserId();
                    List<DynamicHopeVo> hopes = new ArrayList<DynamicHopeVo>();
                    for (int j = 0; j < dynamicHopeList.size(); j++) {
                        int userId2 = dynamicHopeList.get(j).getUserId();
                        if (userId1 == userId2) {
                            hopes.add(dynamicHopeList.get(j));
                            dynamicList.get(i).setHopes(hopes);
                        }
                    }
                }
            }
        }
        Page page = new Page();
        page.setTotalResult(count);
        page.setShowCount(showCount);
        page.setCurrentPage(pageNum);
        page.setResultList(dynamicList);
        page.setTotalPage(dynamic.getTotalPage());
        return page;
    }

    public void setSerachType(Integer serachType) {
        this.serachType = serachType;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public void setShowCount(int showCount) {
        this.showCount = showCount;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    /**
     * 分割动态发表的图片地址路径
     */
    private String[] getDynamicImgUrl(String imgUrl) throws LoginException {
        String url[] = null;
        if (StringUtils.isNotEmpty(imgUrl)) {
            url = imgUrl.split(";");

        } /*else {
            throw new LoginException(Constant.ERR_PARAMETER);
        }*/
        return url;
    }
}
