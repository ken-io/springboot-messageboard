package io.ken.messageboard.controller;

import io.ken.messageboard.dao.MessageMapper;
import io.ken.messageboard.model.Message;
import io.ken.messageboard.util.AesUtil;
import io.ken.messageboard.util.AuthUserUtil;
import io.ken.messageboard.util.PagingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    MessageMapper messageMapper;

    int pageSize = 10;

    @RequestMapping("/list")
    ModelAndView list(HttpServletRequest request, @RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView();
        String userName = AuthUserUtil.getAuthUserName(request);
        if (userName != null && !userName.equals("")) {
            modelAndView.addObject("username", userName);
            int dataCount = messageMapper.countAll();
            int pageTotal = dataCount / pageSize;
            if (dataCount % pageSize != 0) pageTotal += 1;
            if (page == null || page <= 0) page = 1;
            if (page > pageTotal) page = pageTotal;
            List<Message> messageList = messageMapper.queryListPaging(pageSize * (page - 1), pageSize);
            modelAndView.addObject("messageList", messageList);
            modelAndView.addObject("pagination", PagingUtil.getPagingHtml(request.getServletPath() + "?page=", page, pageSize, dataCount));
        } else {
            List<Message> messageList = messageMapper.queryListPaging(0, pageSize);
            modelAndView.addObject("messageList", messageList);
        }

        modelAndView.setViewName("message/list");
        return modelAndView;
    }
}
