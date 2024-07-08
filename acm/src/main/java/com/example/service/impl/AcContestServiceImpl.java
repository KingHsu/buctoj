package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.AcContest;
import com.example.mapper.AcContestMapper;
import com.example.service.AcContestService;
import org.springframework.stereotype.Service;

@Service
public class AcContestServiceImpl extends ServiceImpl<AcContestMapper, AcContest> implements AcContestService {
}