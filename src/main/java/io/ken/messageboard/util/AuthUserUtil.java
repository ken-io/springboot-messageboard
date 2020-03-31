package io.ken.messageboard.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthUserUtil {

    public static String getAuthUserName(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String userInfo = null;
        String userName = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("auth")) {
                    userInfo = cookie.getValue();
                }
            }
        }

        if (userInfo != null && !userInfo.equals("")) {
            try {
                String userInfoText = AesUtil.decrypt(userInfo);
                String[] users = userInfoText.split(",");
                if (users.length == 2) {
                    userName = users[1];
                }
            } catch (Exception e) {
                //todo 记录异常日志
            }
        }
        return userName;
    }

    public static void setUserAuth(HttpServletResponse response, String userId, String userName) throws Exception {
        String userInfo = String.format("%s,%s", userId, userName);
        Cookie userCookie = new Cookie("auth", AesUtil.encrypt(userInfo));
        userCookie.setPath("/");
        response.addCookie(userCookie);
    }
}
