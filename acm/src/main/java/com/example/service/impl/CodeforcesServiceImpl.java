package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.Codeforces;
import com.example.mapper.CodeforcesMapper;
import com.example.service.CodeforcesService;
import org.springframework.stereotype.Service;

@Service
public class CodeforcesServiceImpl extends ServiceImpl<CodeforcesMapper, Codeforces> implements CodeforcesService {

}
