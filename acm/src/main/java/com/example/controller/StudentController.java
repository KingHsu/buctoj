package com.example.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.QueryPageParam;
import com.example.common.Result;
import com.example.entity.Student;
import com.example.service.CaptchaService;
import com.example.service.StudentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/student")
@Api(tags = "学生用户管理")
@CrossOrigin
public class StudentController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private CaptchaService captchaService;


    @GetMapping("/captcha")
    @ApiOperation("验证码功能")
    public Result getCaptcha(HttpSession session) {
        String base64Image = captchaService.generateCaptcha(session);
        Map<String, String> response = new HashMap<>();
        response.put("captchaImage", base64Image);
        return Result.suc(response);
    }

    //用户登录
    @PostMapping("/login")
    @ApiOperation("用户登录")
    public Result login(@RequestBody Map<String, String> requestBody, HttpSession session) {
        String inputCaptcha = requestBody.get("captcha");
        String storedCaptcha = (String) session.getAttribute("captcha");

        if (storedCaptcha == null || !storedCaptcha.equalsIgnoreCase(inputCaptcha)) {
            return Result.fail();
        }
        String username = requestBody.get("stuUsername");
        String password = requestBody.get("stuPassword");

        List list = studentService.lambdaQuery()
                .eq(Student::getStuUsername, username)
                .eq(Student::getStuPassword, password)
                .list();

        boolean isAuthenticated = !list.isEmpty();

        if (isAuthenticated) {
            session.removeAttribute("captcha");
            return Result.suc(list.get(0));
        } else {
            return Result.fail();
        }
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
    public Result delete(@PathVariable Integer studentNo){
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
