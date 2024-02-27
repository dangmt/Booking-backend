package com.dailycodework.lakesidehotel.service;

import com.dailycodework.lakesidehotel.model.User;

import java.util.List;

/**
 * @author Simpson Alfred
 */

public interface IUserService {
    User registerUser(User user);

    User registerUserr(String email, String password, String firstName, String lastName);

    List<User> getUsers();

    void deleteUser(String email);

    User getUser(String email);
}
