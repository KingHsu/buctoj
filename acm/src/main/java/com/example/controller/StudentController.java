package com.example.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.QueryPageParam;
import com.example.common.Result;
import com.example.entity.Student;
import com.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    //用户登录
    @PostMapping("/login")
    public Result login(@RequestBody Student student){
        List list= studentService.lambdaQuery()
                .eq(Student::getStuUsername,student.getStuUsername())
                .eq(Student::getStuPassword,student.getStuPassword())
                .list();
        return list.size()>0?Result.suc(list.get(0)):Result.fail();
    }
    //用户注册
    @PostMapping("/register")
    public Result register(@RequestBody Student student){
        return studentService.save(student)?Result.suc():Result.fail();
    }

    //查询全部
    @GetMapping("/list")
    public List<Student> list(){
        return studentService.list();
    }

    //新增
    @PostMapping
    public Result save(@RequestBody Student student){
        return studentService.save(student)?Result.suc():Result.fail();
    }

    //修改
    @PutMapping
    public Result mod(@RequestBody Student student){
        return studentService.updateById(student)?Result.suc():Result.fail();
    }

    //删除
    @DeleteMapping("/{studentNo}")
    public Result delete(@PathVariable String studentNo){
        return studentService.removeById(studentNo)?Result.suc():Result.fail();
    }

    //模糊查询
    @PostMapping("/listP")
    public Result listP(@RequestBody Student student){
        LambdaQueryWrapper<Student> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(student.getStuUsername()!=null)
            lambdaQueryWrapper.like(Student::getStuUsername,student.getStuUsername());
        return Result.suc(studentService.list(lambdaQueryWrapper));
    }

    //分页查询
    @PostMapping("/listPage")
    public Result listPage(@RequestBody QueryPageParam query){
        String name= (String) query.getParam().get("studentUsername");

        Page<Student> page=new Page<>();
        page.setCurrent(query.getPageNum());
        page.setSize(query.getPageSize());
        LambdaQueryWrapper<Student> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(name!=null&&!"null".equals(name))
            lambdaQueryWrapper.like(Student::getStuUsername,name);

        IPage<Student> result=studentService.page(page,lambdaQueryWrapper);

        return Result.suc(result.getRecords(),result.getTotal());
    }
}
