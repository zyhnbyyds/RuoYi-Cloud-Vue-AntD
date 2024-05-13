package com.ruoyi.common.core.web.page;

import java.util.List;

public class PageDataVo {
    /** 总记录数 */
    private Long total;
    /** 列表数据 */
    private List<?> rows;

    public PageDataVo(List<?> list, Long total) {
        this.rows = list;
        this.total = total;
    }

    public Long getTotal() {
        return total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }
}
