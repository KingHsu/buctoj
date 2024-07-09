package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.AtCoder;
import com.example.mapper.AtCoderMapper;
import com.example.service.AtCoderService;
import org.springframework.stereotype.Service;

@Service
public class AtCoderServiceImpl extends ServiceImpl<AtCoderMapper, AtCoder> implements AtCoderService {
}
