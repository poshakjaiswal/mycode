package com.ef.golf.action;

import com.ef.golf.core.service.AbstractService;
import com.ef.golf.core.structure.pageModel.Page;
import com.ef.golf.service.EsGoodsCatService;
import com.ef.golf.service.GoodsService;
import com.ef.golf.vo.GoodsCatVo;
import com.ef.golf.vo.GoodsHotSpecVo;
import com.ef.golf.vo.GoodsHotVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * create by zhang
 * 2018年1月3日15:17:30
 * 商城热销商品
 */
@Service
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class EsGoodsHotAction extends AbstractService {
    @NotNull(message = "pageNo不能为空")
    private Integer pageNo;
    @NotNull(message = "pageSize不能为空")
    private Integer pageSize;

    @Autowired
    GoodsService esGoodsService;

    @Override
    public Object doService() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        Map<String, Object> maps = new HashMap<String, Object>();
        map.put("pageNo", pageNo);
        map.put("pageSize", pageSize);

        pageNo = (pageNo - 1) * pageSize;
        maps.put("pageNo", pageNo);
        maps.put("pageSize", pageSize);
        List<GoodsHotSpecVo> hotVoList = esGoodsService.getGoodsHotVoList(maps);


        int totalCount = esGoodsService.getGoodsHotVoCount(maps);
        Page<GoodsHotSpecVo> page = new Page<GoodsHotSpecVo>();
        page.setCurrentPage(pageNo);
        page.setShowCount(pageSize);
        page.setTotalResult(totalCount);
        page.setResultList(hotVoList);
        //map.put("page",page);
        map.put("totalCount", totalCount);
        map.put("totalPage", page.getTotalPage());
        map.put("hotVoList", hotVoList);
        map.put("resultList", hotVoList);
        return map;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
