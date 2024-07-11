package com.example.controller;

import com.example.common.QueryPageParam;
import com.example.common.Result;
import com.example.entity.AtCoder;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.service.AtCoderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/atCoder")
@Api(tags = "atCoder用户排名")
@CrossOrigin
public class AtCoderController {
    @Autowired
    private AtCoderService atCoderService;

    @GetMapping("/order")
    @ApiOperation("根据比赛场次排序")
    public Result getCount(@RequestParam int page, @RequestParam int size, @RequestParam(required = false, defaultValue = "asc") String orderBy) {
        IPage<AtCoder> acCount = atCoderService.getCount(page, size, orderBy);
        return Result.suc(acCount);
    }

    // 分页查询
    @PostMapping("/listPage")
    @ApiOperation("分页查询")
    public Result listPage(@RequestBody QueryPageParam query) {
        String name = (String) query.getParam().get("acCount");

        Page<AtCoder> page = new Page<>();
        page.setCurrent(query.getPageNum());
        page.setSize(query.getPageSize());
        LambdaQueryWrapper<AtCoder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (name != null && !"null".equals(name)) {
            lambdaQueryWrapper.like(AtCoder::getAcCount, name);
        }

        IPage<AtCoder> result = atCoderService.page(page, lambdaQueryWrapper);

        return Result.suc(result.getRecords(), result.getTotal());
    }
}
