package com.example.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.QueryPageParam;
import com.example.common.Result;
import com.example.entity.Student;
import com.example.service.StudentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/student")
@Api(tags = "学生用户管理")
public class StudentController {
    @Autowired
    private StudentService studentService;

    //用户登录
    @PostMapping("/login")
    @ApiOperation("用户登录")
    public Result login(@RequestBody Student student){
        List list= studentService.lambdaQuery()
                .eq(Student::getStuUsername,student.getStuUsername())
                .eq(Student::getStuPassword,student.getStuPassword())
                .list();
        return list.size()>0?Result.suc(list.get(0)):Result.fail();
    }
    //用户注册
    @PostMapping("/register")
    @ApiOperation("用户注册")
    public Result register(@RequestBody Student student){
        return studentService.save(student)?Result.suc():Result.fail();
    }

    //新增
    @PostMapping
    @ApiOperation("新增")
    public Result save(@RequestBody Student student){
        return studentService.save(student)?Result.suc():Result.fail();
    }

    //修改
    @PutMapping
    @ApiOperation("修改")
    public Result mod(@RequestBody Student student){
        return studentService.updateById(student)?Result.suc():Result.fail();
    }

    //删除
    @DeleteMapping("/{studentNo}")
    @ApiOperation("删除")
    public Result delete(@PathVariable String studentNo){
        return studentService.removeById(studentNo)?Result.suc():Result.fail();
    }

    //模糊查询
    @PostMapping("/listP")
    @ApiOperation("根据学号模糊查询")
    public Result listP(@RequestBody Student student){
        LambdaQueryWrapper<Student> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(student.getStuNum()!=null)
            lambdaQueryWrapper.like(Student::getStuNum,student.getStuNum());
        return Result.suc(studentService.list(lambdaQueryWrapper));
    }

    //分页查询
    @PostMapping("/listPage")
    @ApiOperation("分页查询")
    public Result listPage(@RequestBody QueryPageParam query){
        String name= (String) query.getParam().get("stuNum");

        Page<Student> page=new Page<>();
        page.setCurrent(query.getPageNum());
        page.setSize(query.getPageSize());
        LambdaQueryWrapper<Student> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(name!=null&&!"null".equals(name))
            lambdaQueryWrapper.like(Student::getStuNum,name);

        IPage<Student> result=studentService.page(page,lambdaQueryWrapper);

        return Result.suc(result.getRecords(),result.getTotal());
    }
}
