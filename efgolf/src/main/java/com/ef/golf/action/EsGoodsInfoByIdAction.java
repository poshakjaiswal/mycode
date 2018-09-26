package com.ef.golf.action;

import com.ef.golf.core.service.AbstractService;
import com.ef.golf.pojo.DlyType;
import com.ef.golf.pojo.Goods;
import com.ef.golf.pojo.GoodsGllery;
import com.ef.golf.pojo.GoodsMarketVo;
import com.ef.golf.service.EsDlyTypeService;
import com.ef.golf.service.GoodsService;
import com.ef.golf.vo.CommentPrictureVo;
import com.ef.golf.vo.CommentVo;
import com.ef.golf.vo.GoodsSpecVo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/14.
 */
@Service
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class EsGoodsInfoByIdAction extends AbstractService {

    @Autowired
    GoodsService goodsService;

    @NotNull(message = "goods_id不能为空")
    private Integer goodsId;


    @Override
    public Object doService() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        Map<String, Object> maps = new HashMap<String, Object>();

        Goods goods = goodsService.selectByPrimaryKey(goodsId);


        map.put("detail", goods.getIntro());

        return map;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }
}
