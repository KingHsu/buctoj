package com.example.controller;

import com.example.common.QueryPageParam;
import com.example.common.Result;
import com.example.entity.AcContest;
import com.example.service.AcContestService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/atCoder")
public class AtCoderController {
    @Autowired
    private AcContestService accontestService;

    // 分页查询
    @PostMapping("/listPage")
    public Result listPage(@RequestBody QueryPageParam query) {
        String name = (String) query.getParam().get("atCoder");

        Page<AtCoder> page = new Page<>();
        page.setCurrent(query.getPageNum());
        page.setSize(query.getPageSize());
        LambdaQueryWrapper<AtCoder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (name != null && !"null".equals(name)) {
            lambdaQueryWrapper.like(AtCoder::getAtCoder, name);
        }

        IPage<AcContest> result = atcoderService.page(page, lambdaQueryWrapper);

        return Result.suc(result.getRecords(), result.getTotal());
    }
}
