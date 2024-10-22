package com.example.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.QueryPageParam;
import com.example.common.Result;
import com.example.entity.AtCoder;
import com.example.entity.Codeforces;
import com.example.service.CodeforcesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/codeforces")
@Api(tags = "codeforces用户排名")
@CrossOrigin
public class CodeforcesController {
    @Autowired
    private CodeforcesService codeforcesService;

    @GetMapping("/order")
    @ApiOperation("根据比赛场次排序")
    public Result getCount(@RequestParam int page, @RequestParam int size, @RequestParam(required = false, defaultValue = "asc") String orderBy) {
        IPage<Codeforces> cfCount = codeforcesService.getCount(page, size, orderBy);
        return Result.suc(cfCount);
    }

    // 分页查询
    @PostMapping("/listPage")
    @ApiOperation("分页查询")
    public Result listPage(@RequestBody QueryPageParam query) {
        String name = (String) query.getParam().get("cfSumContest");

        Page<Codeforces> page = new Page<>();
        page.setCurrent(query.getPageNum());
        page.setSize(query.getPageSize());
        LambdaQueryWrapper<Codeforces> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (name != null && !"null".equals(name)) {
            lambdaQueryWrapper.like(Codeforces::getCfSumContest, name);
        }

        IPage<Codeforces> result = codeforcesService.page(page, lambdaQueryWrapper);

        return Result.suc(result.getRecords(), result.getTotal());
    }
}
