package com.wukong.dao;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;
import com.wukong.util.JdbcUtil;

import java.sql.ResultSet;

public class UserDaoImpl implements  UserDao {

        public JdbcUtil jdbcUtil = new JdbcUtil();


    /**
     *  注册新用户（添加用户）
     *  insert into news_user(`username`,`password`,`email`,`userType`)values(?,?,?,?);
     * @param user 用户对象
     * @return  0 添加失败；1 添加成功
     */
    public boolean addUser(User user) {
        String sql = "insert into news_user(`username`,`password`,`email`,`userType`)values(?,?,?,?);";
        Object[] params = {user.getUsername(),user.getPassword(),user.getEmail(),user.getUserType()};
        return jdbcUtil.addDeleteModify(sql, params);
    }

    /**
     * select count(1) from news_user where username = 'wukong2';
     *  验证用户名是否唯一
     * @param username
     * @return 0 不存在用户； 1 用户唯一； >1 用户重名
     */
    public int verifyOnlyUsername(String username) {
        String sql = "select count(1)  from news_user where username = ?";
        Object [] params = {username};
        ResultSet resultSet= jdbcUtil.getObjectByParams(sql, params);
        int count =0;
        try{
            while(resultSet.next()) {
                count = resultSet.getInt(1);
            }
        }catch (Exception e ){
            e.printStackTrace();
        }

        return count;
    }



    /**
     * 通过用户名查询用户信息
     * 规定：username 唯一
     * @param username
     * @return
     */
    public User getUserByUsername(String username){

        String  sql = "select * from news_user where username = ?";
        Object [] params = {username};
        ResultSet resultSet = jdbcUtil.getObjectByParams(sql, params);
        try{
            while(resultSet.next()){
                Integer id = resultSet.getInt("id");
                String username1 = resultSet.getString("username");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                Integer userType = resultSet.getInt("userType");
                User user = new User();
                user.setId(id);
                user.setUsername(username1);
                user.setPassword(password);
                user.setEmail(email);
                user.setUserType(userType);
                return user;

            }

        }catch (Exception e ){
            e.printStackTrace();
            return null;
        }
        return null;
    }




}
