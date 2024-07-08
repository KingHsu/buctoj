package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.CfContest;
import com.example.mapper.CfContestMapper;
import com.example.service.CfContestService;
import org.springframework.stereotype.Service;

@Service
public class CfContestServiceImpl extends ServiceImpl<CfContestMapper, CfContest> implements CfContestService {
}
