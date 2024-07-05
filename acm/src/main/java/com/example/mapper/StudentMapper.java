package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.entity.Student;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface StudentMapper extends BaseMapper<Student> {

}
