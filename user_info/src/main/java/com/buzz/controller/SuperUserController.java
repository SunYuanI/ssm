package com.buzz.controller;

import com.buzz.pojo.SuperUser;
import com.buzz.service.SuperUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * @program: ssm
 * @description:
 * @author: buzz
 * @create: 2022-02-11 20:04
 **/
@Controller
@RequestMapping("/superUser")
public class SuperUserController {
    private SuperUserService service;
    private static final String VCE = "验证码错误";
    private static final String UOPE = "用户名或密码错误";
    private static final String BASE = "0123456789ABCDEFGabcdefg";

    @Autowired
    public void setService(SuperUserService service) {
        this.service = service;
    }

    @RequestMapping("/login")
    public String login(SuperUser superUser, String verifyCode, Model model, HttpServletRequest request) {
        String code = (String) request.getSession().getAttribute("verifyCode");
        if (!verifyCode.equalsIgnoreCase(code)) {
            model.addAttribute("msg", VCE);
            return "login";
        }else {
            SuperUser user = service.getUser(superUser);
            if (user == null) {
                model.addAttribute("msg", UOPE);
                return "login";
            }else {
//                model.addAttribute("superUser", user);
                model.addAttribute("name", null);
                return "forward:/user/findByPage/1/2";
            }
        }
    }
    @RequestMapping("/toLoginPage")
    public String toLoginPage() {
        return "login";
    }

    @RequestMapping("/verifyCode")
    public void generateVerifyCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //服务器通知浏览器不要缓存
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expires","0");

        //在内存中创建一个长80，宽30的图片，默认黑色背景
        //参数一：长
        //参数二：宽
        //参数三：颜色
        int width = 80;
        int height = 30;
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

        //获取画笔
        Graphics g = image.getGraphics();
        //设置画笔颜色为灰色
        g.setColor(Color.GRAY);
        //填充图片
        g.fillRect(0,0, width,height);

        //产生4个随机验证码，12Ey
        String checkCode = getCheckCode();
        //将验证码放入HttpSession中
        request.getSession().setAttribute("verifyCode",checkCode);

        //设置画笔颜色为黄色
        g.setColor(Color.YELLOW);
        //设置字体的小大
        g.setFont(new Font("黑体",Font.BOLD,24));
        //向图片上写入验证码
        g.drawString(checkCode,15,25);

        //将内存中的图片输出到浏览器
        //参数一：图片对象
        //参数二：图片的格式，如PNG,JPG,GIF
        //参数三：图片输出到哪里去
        ImageIO.write(image,"PNG",response.getOutputStream());
    }

    /**
     * 产生4位随机字符串
     */
    private String getCheckCode() {
        int size = BASE.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i=1;i<=4;i++){
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = BASE.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        return sb.toString();
    }
}
