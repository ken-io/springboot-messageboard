package io.ken.messageboard;

import io.ken.messageboard.util.Md5Util;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class Md5UtilTest   {

    @Test
    public void test(){
        System.out.println(Md5Util.getMD5("ken"));
    }
}
