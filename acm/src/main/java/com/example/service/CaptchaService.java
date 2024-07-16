package com.example.service;

import com.wf.captcha.SpecCaptcha;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;


@Service
public class CaptchaService {

    public String generateCaptcha(HttpSession session) {
        // 创建一个图片验证码，宽度为130，高度为48，验证码字符数为5
        SpecCaptcha specCaptcha = new SpecCaptcha(130, 48, 5);

        // 获取验证码的文字内容
        String captchaText = specCaptcha.text();

        // 将验证码文本存储到 session 中
        session.setAttribute("captcha", captchaText);

        // 获取 Base64 编码的验证码图片
        return specCaptcha.toBase64();
    }
}
