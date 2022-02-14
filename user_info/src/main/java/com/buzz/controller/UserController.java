package com.buzz.controller;

import com.buzz.pojo.User;
import com.buzz.pojo.UserCondition;
import com.buzz.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @program: ssm
 * @description:
 * @author: buzz
 * @create: 2022-02-11 22:06
 **/
@Controller
@RequestMapping("/user")
public class UserController {
    private UserService service;

    @Autowired
    public void setService(UserService service) {
        this.service = service;
    }

    @RequestMapping("/findAll")
    public String listAll(Model model){
        List<User> all = service.findAll();
        model.addAttribute("users", all);
        return "list";
    }

    @RequestMapping("/findByPage/{currentPage}/{pageSize}")
    public String listByPage(Model model, @PathVariable int currentPage, @PathVariable int pageSize, UserCondition condition) {
        System.out.println(condition);
        model.addAttribute("currentPage", currentPage);
        if (condition.getName() != null) {
            model.addAttribute("search_name", condition.getName());
        }
        if (condition.getBirthplace() != null) {
            model.addAttribute("search_birthplace", condition.getBirthplace());
        }
        if (condition.getEmail() != null) {
            model.addAttribute("search_email", condition.getEmail());
        }
        int counts = service.getCounts(condition);
        model.addAttribute("totalCounts", counts);
        int pages = counts / pageSize + (counts % pageSize == 0 ? 0 : 1);
        model.addAttribute("pages", pages);
        List<User> all = service.findByPage(currentPage, pageSize, condition);
        model.addAttribute("users", all);
        return "list";
    }


    @RequestMapping("/toAddUserPage")
    public String toAddUserPage(){
        return "add";
    }

    @RequestMapping("/addUser")
    public String addUser(User user) {
        service.addUser(user);
        return "forward:/user/findByPage/1/2";
    }

    @RequestMapping("/updateUser/{id}")
    public String updateUser(@PathVariable int id, Model model) {
        User user = service.findById(id);
        model.addAttribute("user", user);
        return "update";
    }

    @RequestMapping("/confirmModify")
    public String cofirmModify(User user) {
        service.updateUser(user);
        return "forward:/user/findByPage/1/2";
    }

    @RequestMapping("/deleteUser/{id}")
    public String deleteUser(@PathVariable int id) {
        service.deleteUser(id);
        return "forward:/user/findByPage/1/2";
    }

    @RequestMapping("deleteSelect")
    public String deleteSelect(int[] chbox) {
        service.deleteSelect(chbox);
        return "forward:/user/findByPage/1/2";
    }

    @RequestMapping("/conditionalQuery")
    public String conditionalQuery(UserCondition condition) {


        return "list";
    }



}
