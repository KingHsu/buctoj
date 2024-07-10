package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("student")
public class Student {
    @TableId
    private Integer stuNo;
    private String stuName;
    private String stuClass;
    private String stuAcId;
    private String stuCfId;
    private String stuPassword;
    private String stuMan;
    private String stuUsername;
    private String stuNum;
}
