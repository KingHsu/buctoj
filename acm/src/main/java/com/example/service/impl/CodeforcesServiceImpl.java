package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.Codeforces;
import com.example.mapper.CodeforcesMapper;
import com.example.service.CodeforcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeforcesServiceImpl extends ServiceImpl<CodeforcesMapper, Codeforces> implements CodeforcesService {
    @Autowired
    private CodeforcesMapper codeforcesMapper;


    public IPage<Codeforces> getCount(int page, int size, String orderBy) {
        QueryWrapper<Codeforces> queryWrapper = new QueryWrapper<>();
        // 根据 orderBy 参数判断是否升序排序
        boolean isAsc = "asc".equalsIgnoreCase(orderBy);
        queryWrapper.orderBy(true, isAsc, "cf_sum_contest"); // 第三个参数为排序的字段名
        return codeforcesMapper.selectPage(new Page<>(page, size), queryWrapper);
    }
}
