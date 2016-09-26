package hu.meiit.model;

import lombok.Data;

/**
 * Created by czinke2 on 2016. 09. 26..
 */
@Data
public class NewUserRequest {

    public NewUserRequest(){
    }

    public NewUserRequest(String userName, int credit){
        this.userName = userName;
        this.credit = credit;
    }
    private String userName;
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    private int credit;
    public int getCredit() {
        return credit;
    }
    public void setCredit(int credit) {
        this.credit = credit;
    }

}
