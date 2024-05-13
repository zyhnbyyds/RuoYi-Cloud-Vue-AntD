package com.ruoyi.common.core.web.page;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 表格分页数据对象
 * 
 * @author ruoyi
 */
public class TableDataInfo implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 列表数据 + 总记录数 */
    private PageDataVo data;

    /** 消息状态码 */
    private int code;

    /** 消息内容 */
    private String msg;

    /**
     * 表格数据对象
     */
    public TableDataInfo()
    {
    }

    /**
     * 分页
     * 
     * @param list 列表数据
     * @param total 总记录数
     */
    public TableDataInfo(List<?> list, Long total)
    {
        data = new PageDataVo(list, total);
    }

    public void setTotal(long total)
    {
        data.setTotal(total);
    }

    public void setRows(List<?> rows)
    {
        data.setRows(rows);
    }

    public int getCode()
    {
        return code;
    }

    public void setCode(int code)
    {
        this.code = code;
    }

    public String getMsg()
    {
        return msg;
    }

    public void setMsg(String msg)
    {
        this.msg = msg;
    }

    public PageDataVo getData() {
        return data;
    }
}