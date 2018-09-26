package com.ef.golf.action;

import com.ef.golf.core.service.AbstractService;
import com.ef.golf.exception.SystemException;
import com.ef.golf.pojo.Banner;
import com.ef.golf.pojo.Site;
import com.ef.golf.service.BannerService;
import com.ef.golf.service.GoodsService;
import com.ef.golf.service.SiteService;
import com.ef.golf.service.UserService;
import com.ef.golf.util.PageBean;
import com.ef.golf.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * for efgolf
 * Created by Bart on 2017/9/22.
 * Date: 2017/9/22 17:52
 */

@Service
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class IndexAction extends AbstractService {


    @Resource
    private SiteService siteService;

    @Resource
    private BannerService bannerService;

    @Resource
    private UserService userService;

    @Resource
    private GoodsService esGoodsService;

    private String city="天津市";
    private String lon = "117.216175";//经度

    private String lat = "39.062205";//纬度

    public Object doService() throws SystemException {


        Site site = new Site();
        site.setShowCount(3);
        site.setReserve1(lon);
        site.setReserve2(lat);
        site.setSiteCity(city);
        /** 球场 */
        List<SiteVo> sites = siteService.getSiteListPage(site);
        /** banner */
        List<Banner> bannerList = bannerService.bannerByGrouping("0");
        /**
         * 推荐商品
         */
        Map<String, Object> maps = new HashMap<String, Object>();
        maps.put("pageNo", 0);
        maps.put("pageSize", 3);
        List<GoodsHotSpecVo> hotVoList = esGoodsService.getGoodsHotVoList(maps);
        /** 球童 */
        QuanziUserVo quanziUserVo = new QuanziUserVo();
        quanziUserVo.setRegion(city);
        quanziUserVo.setCurrentPage(0);
        quanziUserVo.setShowCount(3);
        List<QuanziUserVo> qiuTongList = userService.getQiuTongListPage(quanziUserVo);
        /** 教练 */
        QuanziUserVo quanziUserVo2 = new QuanziUserVo();
        quanziUserVo2.setRegion(city);
        quanziUserVo2.setCurrentPage(0);
        quanziUserVo2.setShowCount(3);
        List<QuanziUserVo> coachListPage = userService.getCoachListPage(quanziUserVo2);
        /** 商家 */
        PageBean pageBean1 = userService.selectClubOrShop(null, "6", 1, 3,1);//门店
        PageBean pageBean2 = userService.selectClubOrShop(null, "7", 1, 3,1);//球会商家

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("sites", sites);
        map.put("hotGoodsList", hotVoList);//推荐商品
        map.put("banners", bannerList);
        map.put("qiuTong", qiuTongList);
        map.put("coach", coachListPage);
        map.put("shop", pageBean1.getResultList());
        map.put("club", pageBean2.getResultList());

        return map;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }
}
