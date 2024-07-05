package com.example.controller;


import com.example.service.CodeforcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/codeforces")
public class CodeforcesController {
    @Autowired
    private CodeforcesService codeforcesService;



}
