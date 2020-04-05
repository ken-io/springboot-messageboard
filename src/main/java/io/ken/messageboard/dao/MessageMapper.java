package io.ken.messageboard.dao;

import io.ken.messageboard.model.Message;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MessageMapper {

    List<Message> queryListPaging(@Param("offset") int offset, @Param("num") int num);

    int add(Message message);
}
