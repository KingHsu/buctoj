package com.example.controller;


import com.example.common.QueryPageParam;
import com.example.common.Result;
import com.example.entity.CfContest;
import com.example.service.CfContestService;
import com.example.service.CodeforcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/codeforces")
public class CodeforcesController {
    @Autowired
    private CodeforcesService CodeforcesService;

    // 分页查询
    @PostMapping("/listPage")
    public Result listPage(@RequestBody QueryPageParam query) {
        String name = (String) query.getParam().get("codeforces");

        Page<CfContest> page = new Page<>();
        page.setCurrent(query.getPageNum());
        page.setSize(query.getPageSize());
        LambdaQueryWrapper<Codeforces> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (name != null && !"null".equals(name)) {
            lambdaQueryWrapper.like(Codeforces::getCodeforces, name);
        }

        IPage<CfContest> result = cfcontestService.page(page, lambdaQueryWrapper);

        return Result.suc(result.getRecords(), result.getTotal());
    }
}
