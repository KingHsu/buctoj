package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.AtCoder;
import com.example.mapper.AtCoderMapper;
import com.example.service.AtCoderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AtCoderServiceImpl extends ServiceImpl<AtCoderMapper, AtCoder> implements AtCoderService {
    @Autowired
    private AtCoderMapper atCoderMapper;


    public IPage<AtCoder> getCount(int page, int size, String orderBy) {
        QueryWrapper<AtCoder> queryWrapper = new QueryWrapper<>();
        // 根据 orderBy 参数判断是否升序排序
        boolean isAsc = "asc".equalsIgnoreCase(orderBy);
        queryWrapper.orderBy(true, isAsc, "ac_count"); // 第三个参数为排序的字段名
        return atCoderMapper.selectPage(new Page<>(page, size), queryWrapper);
    }
}
