package io.ken.messageboard.controller;

import io.ken.messageboard.util.AesUtil;
import io.ken.messageboard.util.AuthUserUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/message")
public class MessageController {

    @RequestMapping("/list")
    ModelAndView list(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String userName = AuthUserUtil.getAuthUserName(request);
        if (userName != null && !userName.equals("")) {
            modelAndView.addObject("username", userName);
        }
        modelAndView.setViewName("message/list");
        return modelAndView;
    }
}
