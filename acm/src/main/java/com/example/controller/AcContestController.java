package com.example.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.common.Result;
import com.example.entity.AcContest;
import com.example.service.AcContestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/acContest")
public class AcContestController {
    @Autowired
    private AcContestService accontestService;

    // 查询全部
    @GetMapping("/list")
    public List<AcContest> list() {
        return accontestService.list();
    }


    // 根据比赛名称模糊查询
    @PostMapping("/listP")
    public Result listP(@RequestBody AcContest accontest) {
        LambdaQueryWrapper<AcContest> queryWrapper = new LambdaQueryWrapper<>();
        if (accontest.getAcContest() != null) {
            queryWrapper.like(AcContest::getAcContest, accontest.getAcContest());
        }
        return Result.suc(accontestService.list(queryWrapper));
    }

    // 分页查询
    @PostMapping("/listPage")
    public Result listPage(@RequestBody QueryPageParam query) {
        String name = (String) query.getParam().get("acContest");

        Page<AcContest> page = new Page<>();
        page.setCurrent(query.getPageNum());
        page.setSize(query.getPageSize());
        LambdaQueryWrapper<AcContest> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (name != null && !"null".equals(name)) {
            lambdaQueryWrapper.like(AcContest::getAcContest, name);
        }

        IPage<AcContest> result = accontestService.page(page, lambdaQueryWrapper);

        return Result.suc(result.getRecords(), result.getTotal());
    }
}