package com.example.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("atcoder")
public class AtCoder {
    private String acId;
    private String acDate;
    private String acContest;
    private String acRank;
    private String acPerformance;
    @TableField("ac_newRating")
    private String acNewRating;
    private String acDiff;
    private String acCount;
    @TableField("ac_maxRating")
    private String acMaxRating;
    private String acNum;
}
