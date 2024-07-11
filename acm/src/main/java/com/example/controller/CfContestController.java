package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.QueryPageParam;
import com.example.common.Result;
import com.example.entity.CfContest;
import com.example.service.CfContestService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/cfContest")
@Api(tags = "codeforces比赛列表")
@CrossOrigin
public class CfContestController {
    @Autowired
    private CfContestService cfcontestService;


    // 根据比赛名称模糊查询
    @PostMapping("/listP")
    @ApiOperation("根据比赛名称模糊查询")
    public Result listP(@RequestBody CfContest cfcontest) {
        LambdaQueryWrapper<CfContest> queryWrapper = new LambdaQueryWrapper<>();
        if (cfcontest.getCfContest() != null) {
            queryWrapper.like(CfContest::getCfContest, cfcontest.getCfContest());
        }
        return Result.suc(cfcontestService.list(queryWrapper));
    }

    // 分页查询
    @PostMapping("/listPage")
    @ApiOperation("分页查询")
    public Result listPage(@RequestBody QueryPageParam query) {
        String name = (String) query.getParam().get("cfContest");

        Page<CfContest> page = new Page<>();
        page.setCurrent(query.getPageNum());
        page.setSize(query.getPageSize());
        LambdaQueryWrapper<CfContest> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (name != null && !"null".equals(name)) {
            lambdaQueryWrapper.like(CfContest::getCfContest, name);
        }

        IPage<CfContest> result = cfcontestService.page(page, lambdaQueryWrapper);

        return Result.suc(result.getRecords(), result.getTotal());
    }
}
