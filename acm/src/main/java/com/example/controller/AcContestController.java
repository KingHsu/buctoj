package com.example.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.QueryPageParam;
import com.example.common.Result;
import com.example.entity.AcContest;
import com.example.service.AcContestService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/acContest")
@Api(tags = "AtCoder比赛列表")
@CrossOrigin
public class AcContestController {
    @Autowired
    private AcContestService accontestService;


    // 根据比赛名称模糊查询
    @PostMapping("/listP")
    @ApiOperation("根据比赛名称模糊查询")
    public Result listP(@RequestBody AcContest accontest) {
        LambdaQueryWrapper<AcContest> queryWrapper = new LambdaQueryWrapper<>();
        if (accontest.getAcContest() != null) {
            queryWrapper.like(AcContest::getAcContest, accontest.getAcContest());
        }
        return Result.suc(accontestService.list(queryWrapper));
    }

    // 分页查询
    @PostMapping("/listPage")
    @ApiOperation("分页查询")
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
