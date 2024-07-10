package com.example.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.entity.Codeforces;


public interface CodeforcesService extends IService<Codeforces> {
    IPage<Codeforces> getCount(int page, int size, String orderBy);
}
