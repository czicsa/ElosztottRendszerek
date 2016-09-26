package hu.meiit.service;

import hu.meiit.model.NewUserRequest;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by czinke2 on 2016. 09. 26..
 */
@Service
public class UserManagementService {
    public List<NewUserRequest> getUsers() {
        return users;
    }

    private List<NewUserRequest> users;

    public UserManagementService(){
        this.users = new ArrayList<NewUserRequest>();
    }

    public void AddUser(NewUserRequest newUserRequest){
        this.users.add(newUserRequest);
    }
}
