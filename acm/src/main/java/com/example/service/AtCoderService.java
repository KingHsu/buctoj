package com.example.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.entity.AtCoder;


public interface AtCoderService extends IService<AtCoder> {
    IPage<AtCoder> getCount(int page, int size, String orderBy);
}

